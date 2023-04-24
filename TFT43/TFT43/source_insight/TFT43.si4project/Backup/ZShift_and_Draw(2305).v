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

	output reg oBlock_Mode,
	//New PulseCounter comes.
	input iDataUpdate,
	input [15:0] iPulseCounter,
    
	//SDRAM Read Glue Logic.
    output reg [23:0] oSDRAM_Rd_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iSDRAM_Data, //input, read back data from SDRAM.

    output reg oSDRAM_Rd_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Rd_Done, //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );

//SDRAM Space Assignment
//0~383999: (480*800-1): LCD GRAM. 
//384000~384599: (384000+600-1): Photon Counter.

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
				oSDRAM_Wr_Data<=0;

				ringbuffer_wr_addr<=384000;
				ringbuffer_rd_addr<=384000;
				cnt_Shift_PulseCounter<=0;
				///////////////////////
				oBlock_Mode<=1'b0;
			end
else if(en) begin
			case(i)
				0: //Clear PulseCounter RAM from 384000~384599 at power on.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											oBlock_Mode<=1'b0;
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							oSDRAM_Wr_Data<=0; //clear.
							oBlock_Mode<=1'b1;
						end
				1: 
					if(ringbuffer_wr_addr==384599) begin
													ringbuffer_wr_addr<=384000; 
													i<=i+1'b1;
												end
					else begin
							ringbuffer_wr_addr<=ringbuffer_wr_addr+1'b1; 
							i<=0; //Loop to clear.
						end
				2: //Clear GRAM (15,15)-(235,615) height=220,width=600. (Set Pixel to background color)
				//Draw Random Histogram in rectangle (15,15)-(15+220,15+600)=(235,615).
					begin
						//sdram_addr=y*width+x=15*480+15=7215;
						GRAM_Y<=7215;
						GRAM_X<=15;
						i<=i+1'b1;
					end
				3: //Set background to Black to clear screen.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											oBlock_Mode<=1'b0;
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X-1;
							oSDRAM_Wr_Data<=`BAR_Color_Background; 
							oBlock_Mode<=1'b1;
						end
				4: 
					if(GRAM_X==235) begin GRAM_X<=10; i<=i+1'b1; end
					else begin 
							GRAM_X<=GRAM_X+1'b1; 
							i<=i-1'b1; 
						end
				5:  //615*480=295200.
					if(GRAM_Y>=295200) begin GRAM_Y<=0; i<=i+1'b1; end
					else begin 
							GRAM_Y<=GRAM_Y+480;
							i<=3; 
						end
				/////////////////////////////////////////////////////////////////
				6: //shift rd address to generate left shift effect.
					begin
						if(cnt_Shift_PulseCounter==599)
							cnt_Shift_PulseCounter<=0;
						else
							cnt_Shift_PulseCounter<=cnt_Shift_PulseCounter+1'b1;
						//////////////////////////////////////////////////
						ringbuffer_rd_addr<=384000+cnt_Shift_PulseCounter;
						//GRAM Plain yOffset=20*480=9600.
						GRAM_Y<=9600;
						i<=i+1'b1;
					end
				7: //calculating the write address of new PulseCounter.
				//Always write new data at the end of rd addr+600.
					begin
						if(ringbuffer_rd_addr==0)
							ringbuffer_wr_addr<=384599;
						else
							ringbuffer_wr_addr<=ringbuffer_rd_addr-1;
						/////////////////////////////////////////////////
						i<=i+1'b1;
					end
				8: //Write the new pulse counter to 384600.
				//384000,384000+1,384000+2,384000+3, ... ... 384000+599,384000+600.
				//Left Shift the entire area, so we should write the new pulse couter to 384000+600.
				//Ring buffer to write new pulse counter to SDRAM.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											oBlock_Mode<=1'b0;
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							//oSDRAM_Wr_Data<=200; //fixed value for debugging.
							oSDRAM_Wr_Data<=lockInPulseCounter;
							oBlock_Mode<=1'b1;
						end
				9: //Read from ring buffer.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										oBlock_Mode<=1'b0;
										//GRAM X.
										//Truncate to avoid reaching full scale.
										//iSDRAM_Data>>1 => /2.
										//iSDRAM_Data>>2 => /4.
										if((15+iSDRAM_Data)>235) begin
																	GRAM_X<=235;
																	CNT1<=235;
																 end
										else begin
												GRAM_X<=15+iSDRAM_Data; //+xOffset.
												CNT1<=iSDRAM_Data;//repeat times.
											end
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
							oSDRAM_Rd_Addr<=ringbuffer_rd_addr;
							oBlock_Mode<=1'b1;
						end
				10: //CLS GRAM: Before draw histrogram, we clean this column. 
				//we only clear the un-used pixels in this column.
					begin
						clear_X<=GRAM_X;
						clear_Y<=GRAM_Y;
						i<=i+1'b1;
					end
				11: //CLS GRAM: set pixel to Background color to clear it.
				//we only clear the un-used pixels in this column.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											oBlock_Mode<=1'b0;
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=clear_Y+clear_X-1;
							oSDRAM_Wr_Data<=`Color_Gray;
							oBlock_Mode<=1'b1;
						end
				12: //CLS GRAM: loop to clear from the toppest point to the maximum x position 220.
				//we only clear the un-used pixels in this column.
				//(15,15)-(235,615) height=220,width=600. 
					if(clear_X==235) begin i<=i+1'b1; end
					else begin 
							clear_X<=clear_X+1'b1;
							i<=i-1'b1; 
						end
				13: //GRAM: Write to GRAM the toppest point.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											oBlock_Mode<=1'b0;
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X-1;
							oSDRAM_Wr_Data<=`Color_Pink;
							oBlock_Mode<=1'b1;
						end
				14: //GRAM: Loop to draw from top to bottom to generate histogram.
					if(CNT1==0) begin i<=i+1'b1; end
					else begin 
							CNT1<=CNT1-1'b1; 
							GRAM_X<=GRAM_X-1'b1; 
							i<=i-1'b1; 
						end
				15: //Loop 600-1=599 times.
					if(CNT2==599) begin CNT2<=0; i<=i+1'b1; end
					else begin 
							CNT2<=CNT2+1'b1; 
							//Loop ring buffer for rd_addr.
							if(ringbuffer_rd_addr==384599)
								ringbuffer_rd_addr<=384000;
							else
								ringbuffer_rd_addr<=ringbuffer_rd_addr+1'b1;
							//GRAM Y. Next Y.
							GRAM_Y<=GRAM_Y+480; 
							i<=9; //Loop to read next pulse counter and write GRAM.
						end
				16: //only clear GRAM.
					begin i<=6; end
			endcase
		 end
endmodule
