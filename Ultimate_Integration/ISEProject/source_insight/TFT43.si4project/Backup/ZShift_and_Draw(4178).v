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

				ringbuffer_wr_addr<=384000;
				ringbuffer_rd_addr<=384000;
				cnt_Shift_PulseCounter<=0;
			end
else if(en) begin
			case(i)
				0: 
					begin CNT1<=0; i<=i+1'b1; end
				1: //Clear PulseCounter RAM to 0 from 384000~384599 at power on.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							oSDRAM_Wr_Data1<=0; //clear.
							oSDRAM_Wr_Data2<=0; //clear.
							oSDRAM_Wr_Data3<=0; //clear.
							oSDRAM_Wr_Data4<=0; //clear.
						end
				2: 
					//600 Points: 0~599
					if(CNT1==599) begin CNT1<=0; i<=i+1'b1; end
					else begin 
							//0,1,2,3......4,5,6,7........8,9,10,11.................
							//since we write 4 words each time, so next address offset +4.
							ringbuffer_wr_addr<=ringbuffer_wr_addr+4; 
							i<=i-1'b1; //Loop to clear.
						end
				3: //Clear GRAM (Set foreground color to background color)
				//Draw Random Histogram in a Rectangle (height=220,width=600).
				//Since we operate 4 words each time, so 220/4=55, 600/4=150.
				//(15,15)-(15+220,15+600)=(235-1,615-1).
					begin
						//sdram_addr=y*width+x=15*480+15=7215;
						GRAM_Y<=7215;
						GRAM_X<=15;
						i<=i+1'b1;
					end
				4: //Set background to Black to clear screen.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X-1;
							oSDRAM_Wr_Data1<=`BAR_Color_Background; 
							oSDRAM_Wr_Data2<=`BAR_Color_Background; 
							oSDRAM_Wr_Data3<=`BAR_Color_Background; 
							oSDRAM_Wr_Data4<=`BAR_Color_Background; 
						end
				5:  //the last GRAM_X is 231,232,233,234.
					if(GRAM_X>=231) begin GRAM_X<=15; i<=i+1'b1; end
					else begin 
							GRAM_X<=GRAM_X+4; //4 words each time.
							i<=i-1'b1; 
						end
				6:  //614*480=294720.
					if(GRAM_Y>=294720) begin GRAM_Y<=0; i<=i+1'b1; end
					else begin 
							GRAM_Y<=GRAM_Y+480;
							i<=i-2; //Loop to fill next column. 
						end
				/////////////////////////////////////////////////////////////////
				7: //shift rd address to generate left shift effect. 
					begin //0~599 => *4 => 0~2396.
						if(cnt_Shift_PulseCounter>=2396)
							cnt_Shift_PulseCounter<=0;
						else //shift 1 pulse counters each time.
							cnt_Shift_PulseCounter<=cnt_Shift_PulseCounter+4;
						//////////////////////////////////////////////////
						ringbuffer_rd_addr<=384000+cnt_Shift_PulseCounter;
						//GRAM Plain yOffset=20*480=9600.
						GRAM_Y<=9600;
						i<=i+1'b1;
					end
				8: //calculating the write address of new PulseCounter.
				//Always write new data at the end of rd addr+600.
					begin
						if(ringbuffer_rd_addr==384000)
								//384000,384001,384002,384003.......
								//386396,386397,386398,386399.
								ringbuffer_wr_addr<=386396;
						else 
							ringbuffer_wr_addr<=ringbuffer_rd_addr-4;
						/////////////////////////////////////////////////
						i<=i+1'b1;
					end

				9: //Write the new pulse counter to 384600.
				//384000,384000+1,384000+2,384000+3, ... ... 384000+599,384000+600.
				//Left Shift the entire area, so we should write the new pulse couter to 384000+600.
				//Ring buffer to write new pulse counter to SDRAM.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							//oSDRAM_Wr_Data1<=200; //fixed value for debugging.
							oSDRAM_Wr_Data1<=lockInPulseCounter;
							oSDRAM_Wr_Data2<=lockInPulseCounter;
							oSDRAM_Wr_Data3<=lockInPulseCounter;
							oSDRAM_Wr_Data4<=lockInPulseCounter;
						end
				10: //Read from ring buffer.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										//GRAM X.
										//Truncate to avoid reaching full scale.
										//iSDRAM_Data>>1 => /2.
										//iSDRAM_Data>>2 => /4.
										if((15+iSDRAM_Data1)>235) begin
																	GRAM_X<=235;
																	CNT1<=235;
																 end
										else begin
												GRAM_X<=15+iSDRAM_Data1; //+xOffset.
												CNT1<=iSDRAM_Data1;//repeat times.
											end
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
							oSDRAM_Rd_Addr<=ringbuffer_rd_addr;
						end
				11: //CLS GRAM: Before draw histrogram, we clean this column. 
				//we only clear the un-used pixels in this column.
					begin
						clear_X<=GRAM_X;
						clear_Y<=GRAM_Y;
						i<=i+1'b1;
					end
				12: //CLS GRAM: set pixel to Background color to clear it.
				//we only clear the un-used pixels in this column.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=clear_Y+clear_X-1;
							oSDRAM_Wr_Data1<=`Color_Gray;
							oSDRAM_Wr_Data2<=`Color_Gray;
							oSDRAM_Wr_Data3<=`Color_Gray;
							oSDRAM_Wr_Data4<=`Color_Gray;
						end

				13: //CLS GRAM: loop to clear from the toppest point to the maximum x position 220.
				//we only clear the un-used pixels in this column.
				//(15,15)-(235,615) height=220,width=600. 
					if(clear_X>=235) begin i<=i+1'b1; end
					else begin 
							clear_X<=clear_X+4; //four words each time.
							i<=i-1'b1; //Loop to write next pixel.
						end
				14: //GRAM: Write to GRAM the toppest point.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X-1;
							oSDRAM_Wr_Data1<=`Color_Pink;
							oSDRAM_Wr_Data2<=`Color_Pink;
							oSDRAM_Wr_Data3<=`Color_Pink;
							oSDRAM_Wr_Data4<=`Color_Pink;
						end
				15: //GRAM: Loop to draw from top to bottom to generate histogram.
					if(CNT1<=4) begin i<=i+1'b1; end
					else begin 
							CNT1<=CNT1-4; //4 words each time.
							GRAM_X<=GRAM_X-4; //4 words each time.
							i<=i-1'b1; 
						end
				16: //Loop 600-1=599 times.
					if(CNT2==599) begin CNT2<=0; i<=i+1'b1; end
					else begin 
							CNT2<=CNT2+1'b1; 
							//Loop ring buffer for rd_addr: 384000+599*4=386396.
							if(ringbuffer_rd_addr==386396)
								ringbuffer_rd_addr<=384000;
							else
								ringbuffer_rd_addr<=ringbuffer_rd_addr+4;
							//GRAM Y. Next Y.
							GRAM_Y<=GRAM_Y+480; 
							i<=15; //Loop to read next pulse counter and write GRAM.
						end
				17: //only clear GRAM.
					begin i<=7; end
			endcase
		 end
endmodule
