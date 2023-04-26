`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:15:57 04/20/2023 
// Design Name: 
// Module Name:    ZShift_and_Draw 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "../ColorTable/ZRGB565_ColorTable.v"
module ZShift_and_Draw(
    input clk,
    input rst_n,
    input en,

	//New PulseCounter comes.
	input iDataUpdate,
	input [15:0] iPulseCounter,
    
	//SDRAM Read Glue Logic.
    output reg [23:0] oSDRAM_Rd_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iSDRAM_Data1, //input, read back data1 from SDRAM.
    input [15:0] iSDRAM_Data2, //input, read back data2 from SDRAM.
    input [15:0] iSDRAM_Data3, //input, read back data3 from SDRAM.
    input [15:0] iSDRAM_Data4, //input, read back data4 from SDRAM.

    output reg oSDRAM_Rd_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Rd_Done, //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data1, //ouptut, write data1 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data2, //ouptut, write data2 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data3, //ouptut, write data3 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data4, //ouptut, write data4 to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );

//SDRAM Space Assignment
//0~383999: (480*800-1): LCD GRAM. 
//384000~384599: (384000+600-1): 600Points Photon Counter.
//MORE STORAGE, LESS TIME.
//Since SDRAM operation in 4 words, to avoid read-modify-write SDRAM operation.
//We extend one word to four words to simply the operation.
//So range is 0-599.  599*4=2396.
//384000~386396.
//384000,384001,384002,384003: 1st PulseCounter. (0*4)=0
//384004: 2st Pulse Counter. (1*4=4)
//384008: 3st Pulse Counter. (2*4=8)
// ... ...
//386396,386397,386398,386399 :120st Pulse Counter. (600-1)*4=2396.
//.............
//(386399-38400+1)/4=600.
//Lock in new pulse counter.
reg [15:0] lockInPulseCounter;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				lockInPulseCounter<=0;
			end
else if(iDataUpdate)	begin
							lockInPulseCounter<=iPulseCounter;
						end
//Do shift movement.
//Eliminate the oldest value and add the new pulse counter.
//Left Shift Effect.
reg [31:0] i;
reg [23:0] ringbuffer_wr_addr;
reg [15:0] CNT1;
reg [23:0] ringbuffer_rd_addr;

reg [31:0] GRAM_X;
reg [31:0] GRAM_Y;
reg [31:0] GRAM_Pixel_Addr;
reg [15:0] CNT2;
//move 600 lines.
reg [31:0] cnt_Shift_PulseCounter;
//clear this column.
reg [31:0] clear_X;
reg [31:0] clear_Y;
reg [7:0] mdy_byte;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				CNT1<=0;
				CNT2<=0;
				
				//SDRAM Read.
				oSDRAM_Rd_Req<=0;
				oSDRAM_Rd_Addr<=0;

				//SDRAM Write.
				oSDRAM_Wr_Req<=0;
				oSDRAM_Wr_Addr<=0;
				oSDRAM_Wr_Data1<=0;
				oSDRAM_Wr_Data2<=0;
				oSDRAM_Wr_Data3<=0;
				oSDRAM_Wr_Data4<=0;
				
				//SDRAM Read/Write Address must be aligned by 4 words.
				//384000/4=96000.
				ringbuffer_wr_addr<=384000;
				ringbuffer_rd_addr<=384000;
				cnt_Shift_PulseCounter<=0;
			end
else if(en) begin
			case(i)
				0: 
					begin ringbuffer_wr_addr<=384000; i<=i+1'b1; end
				1: //Clear PulseCounter RAM to 0 from 384000~384599 at power on.
				//Since SDRAM operates 4 words each time.
				//In order to save time to operate read-modify-write, we use 4 words to save one pulse counter.
				//So the Address range is: 384000(0*4)386396(384000+599*4)
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							oSDRAM_Wr_Data1<=0; //clear.
							oSDRAM_Wr_Data2<=0; //clear.
							oSDRAM_Wr_Data3<=0; //clear.
							oSDRAM_Wr_Data4<=0; //clear.
						end
				2: //To generate Ring Buffer.
					if(ringbuffer_wr_addr>=386396) begin i<=i+1'b1; end
					else begin 
							//0,1,2,3......4,5,6,7........8,9,10,11.................
							//since we write 4 words each time, so next address offset +4.
							ringbuffer_wr_addr<=ringbuffer_wr_addr+4; 
							i<=i-1'b1; //Loop to clear.
						end
				3: //Clear GRAM (Set foreground color to background color)
				//Draw Random Histogram in a Rectangle (height=220,width=600).
				//Since we operate 4 words each time, so 220/4=55, 600/4=150.
				//(12,15)-(12+220,15+600)=(232,615).
					begin
						//sdram_addr=y*width+x=15*480+12=7212; 7212/4=1803.
						GRAM_Y<=7200; //15*480=7200. 7200/4=1800.
						GRAM_X<=12; //12/4=3.
						i<=i+1'b1;
					end
				4: //Set background to Black to clear screen.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X;
							oSDRAM_Wr_Data1<=`BAR_Color_Background; 
							oSDRAM_Wr_Data2<=`BAR_Color_Background; 
							oSDRAM_Wr_Data3<=`BAR_Color_Background; 
							oSDRAM_Wr_Data4<=`BAR_Color_Background; 
						end
				5:  //the last GRAM_X is 228,229,230,231,232.
					if(GRAM_X>=228) begin GRAM_X<=12; i<=i+1'b1; end
					else begin 
							GRAM_X<=GRAM_X+4; //4 words each time.
							i<=i-1'b1; 
						end
				6:  //615*480=295200. 295200/4=73800.
					if(GRAM_Y>=295200) begin GRAM_Y<=7200; i<=i+1'b1; end
					else begin 
							GRAM_Y<=GRAM_Y+480;
							i<=i-2; //Loop to fill next column. 
						end
				/////////////////////////////////////////////////////////////////
				7: //shift rd address to generate left shift effect. 
				//Use Space to Save Time.
				//Single word: 384000~384599. (600 points:0~599).
				//Four words: 384000~384599*4(1538400).
					begin //0~599 => *4 => 0~2396,2397,2398,2399.
						if(cnt_Shift_PulseCounter>=2396)
							cnt_Shift_PulseCounter<=0;
						else //shift 1 pulse counter each time.
							cnt_Shift_PulseCounter<=cnt_Shift_PulseCounter+4;
						//////////////////////////////////////////////////
						//384000/4=96000.
						//384004/4=96001.
						ringbuffer_rd_addr<=384000+cnt_Shift_PulseCounter;
						//GRAM Plain yOffset=15*480=7200.
						GRAM_Y<=7200; //+yOffset.
						GRAM_X<=12; //+xOffset.
						i<=i+1'b1;
					end
				8: //calculating the write address of new PulseCounter.
				//Always write new data at the end of rd addr+600.
					begin
						if(ringbuffer_rd_addr==384000)
								//384000,384001,384002,384003.......
								//386396,386397,386398,386399.
								ringbuffer_wr_addr<=386396; //386396/4=96599.
						else 
							ringbuffer_wr_addr<=ringbuffer_rd_addr-4;
						/////////////////////////////////////////////////
						i<=i+1'b1;
					end
				9: //Write the new pulse counter to specify address.
				//Since SDRAM operates four words each time.
				//but we only use the first word, other 3 words we write zero.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							//oSDRAM_Wr_Data1<=200; //fixed value for debugging.
							oSDRAM_Wr_Data1<=lockInPulseCounter;
							oSDRAM_Wr_Data2<=0;
							oSDRAM_Wr_Data3<=0;
							oSDRAM_Wr_Data4<=0;
						end
				10: //Read History 600 Pulse Counter from ring buffer.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										//GRAM X, offset=12.
										//Truncate to avoid reaching full scale.
										//Or scale it.
										// /2 => iSDRAM_Data>>1
										// /4 => iSDRAM_Data>>2 
										if((12+iSDRAM_Data1)>=228) 
											GRAM_Pixel_Addr<=GRAM_Y+228;
											
										else 
											GRAM_Pixel_Addr<=GRAM_Y+12+iSDRAM_Data1; //+xOffset.
										////////////////////////////////////////////////
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
							oSDRAM_Rd_Addr<=ringbuffer_rd_addr;
						end
				11: //Scan from xStart to xEnd.
					begin
						oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X;
						i<=i+1'b1;
					end
				12: //write 4 words each time.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1;
							if((oSDRAM_Wr_Addr+0)==GRAM_Pixel_Addr) begin
								oSDRAM_Wr_Data1<=`Color_Pink;
								oSDRAM_Wr_Data2<=`Color_Pink;
								oSDRAM_Wr_Data3<=`Color_Pink;
								oSDRAM_Wr_Data4<=`Color_Pink;
																	end
							else if((oSDRAM_Wr_Addr+1)==GRAM_Pixel_Addr) begin
								oSDRAM_Wr_Data1<=`Color_Pink;
								oSDRAM_Wr_Data2<=`Color_Pink;
								oSDRAM_Wr_Data3<=`Color_Pink;
								oSDRAM_Wr_Data4<=`Color_Pink;
																		end
							else if((oSDRAM_Wr_Addr+2)==GRAM_Pixel_Addr) begin
								oSDRAM_Wr_Data1<=`Color_Pink;
								oSDRAM_Wr_Data2<=`Color_Pink;
								oSDRAM_Wr_Data3<=`Color_Pink;
								oSDRAM_Wr_Data4<=`Color_Pink;
																		end
							else if((oSDRAM_Wr_Addr+3)==GRAM_Pixel_Addr) begin
								oSDRAM_Wr_Data1<=`Color_Pink;
								oSDRAM_Wr_Data2<=`Color_Pink;
								oSDRAM_Wr_Data3<=`Color_Pink;
								oSDRAM_Wr_Data4<=`Color_Pink;
																		end
							else begin
								oSDRAM_Wr_Data1<=`BAR_Color_Background;
								oSDRAM_Wr_Data2<=`BAR_Color_Background;
								oSDRAM_Wr_Data3<=`BAR_Color_Background;
								oSDRAM_Wr_Data4<=`BAR_Color_Background;
								end
						end
				13: //Loop to write X.
					if(GRAM_X>=228) begin GRAM_X<=12; i<=i+1'b1; end
					else begin 
							GRAM_X<=GRAM_X+4; //4 words each time.
							i<=i-2; //Loop to write next pixel.
						end
				14: //Loop 600 times. //(12,15)-(12+220,15+600)=(232,615).
				//615*480=295200
					if(GRAM_Y>=295200) begin GRAM_Y<=7200; i<=i+1'b1; end
					else begin 
							//Loop ring buffer for rd_addr: 384000+599*4=386396.
							if(ringbuffer_rd_addr==386396)
								ringbuffer_rd_addr<=384000;
							else
								ringbuffer_rd_addr<=ringbuffer_rd_addr+4;
							//GRAM Y. Next Y.
							GRAM_Y<=GRAM_Y+480; 
							i<=10; //Loop to read next pulse counter.
						end
				15: 
					begin i<=7; end
			endcase
		 end
endmodule
