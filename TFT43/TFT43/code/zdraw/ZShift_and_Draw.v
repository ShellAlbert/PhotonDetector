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

	//Pause or Run, 1=Pause, 0=Run.
	input iPause,
	
	//New PulseCounter comes.
	input iDataUpdate,
	input [15:0] iPulseCounter,
	input [31:0] iPulseCouter_LCD,

    //PulseCounter Gain Divider.
    input [7:0] iPulseCounter_Gain_Divider,
    
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
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.

	//the Maximum & Minimum Pulse Counter with 600 points.
	output reg [31:0] oMaxPulseCounter,
	output reg [31:0] oMinPulseCounter
    );

//---------------------------------------
//SDRAM Data Bus: 16bits.
//4.3'' LCD Data Bus: 16bits.
//PhotonCounter Module output value: 16bits.
//---------------------------------------
//---------------SDRAM Space Assignment-------------------------
//480*800=384000,		0~383999 => LCD FrameBuffer.
//384000+600=384600,	384000~384599 => 600 Points PhotonCounter.
//
//But because SDRAM operation in 4 words unit,
//in order to prevent complicated read-modify-write operating,
//we extend 1 word to 4 words to simply the operation.
//I call it More Storage, Less Time.
//So the real address is as follows:
//384000,384001,384002,384003:  1st unit, PulseCounter stored in 384000.
//384004,384005,384006,384007:  2st unit, PulseCounter stored in 384004.
//384008,384009,384010,384011:  3st unit, PulseCounter stored in 384008.
//..............................................
//600 Points * 4 words = 2400, 384000+2400=386400.
//...............................................
//386396,386397,386398,386399:  600st unit, PulseCounter stored in 386396.
//Verification
//(386399-384000+1)=2400, 2400/4=600.

//-----------------Lock in new pulse counter----------------------
reg [15:0] lockInPulseCounter;
reg [31:0] PulseCouter_LCD;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				lockInPulseCounter<=0;
			end
else if(iDataUpdate && !iPause)	begin 
									//1=Pause, 0=Run, Only lock in new PulseCounter in Run mode.
									lockInPulseCounter<=iPulseCounter;

									//lockInPulseCounter<=100; //fixed value for debugging.

									PulseCouter_LCD<=iPulseCouter_LCD;
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
reg [31:0] HistoryPulseCounter_LCD;

//maximum pulse counter tracking.
reg [31:0] MaxPulseCounter_X;
reg [31:0] MaxPulseCounter_Y;

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
				ringbuffer_wr_addr<=384000;
				ringbuffer_rd_addr<=384000;
				cnt_Shift_PulseCounter<=0;

				//Find out the Maxium & Minimum Pulse Counter within 600 points.
				oMaxPulseCounter<=0;
				oMinPulseCounter<=32'hFFFFFFFF;

				//maximum pulse counter tracking.
				MaxPulseCounter_X<=0;
				MaxPulseCounter_Y<=0;
			end
else if(en) begin
			case(i)
				0: //Clear PulseCounter RAM.
					begin 
						ringbuffer_wr_addr<=384000; 
						i<=i+1'b1; 
					end

				1: //Clear PulseCounter RAM to 0 at power on.
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

				2: //Loop to clear All PulseCounter RAM Area.
					if(ringbuffer_wr_addr>=386396) begin 
														i<=i+1'b1; 
													end
					else begin 
							//SDRAM operates alined by 4 words.
							ringbuffer_wr_addr<=ringbuffer_wr_addr+4; 
							i<=i-1'b1; //Loop to clear.
						end

				3: //Clear GRAM (Set foreground color to background color)
				//Draw Random Histogram in a Rectangle (height=220,width=600).
				//Since we operate 4 words each time, so 220/4=55, 600/4=150.
				//(12,15)~(12+220-1,15+600-1) => (12,15)~(231,614)
				//X width: 220
				//Y width: 600
					begin
						//sdram_addr=y*width+x=15*480+12=7212; 7212/4 words=1803.
						GRAM_Y<=7200; 
						GRAM_X<=12;
						i<=i+1'b1;
					end

				4: //Set background Color to Black to clear screen.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end				
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X;
							oSDRAM_Wr_Data1<=`BAR_Color_Background; 
							oSDRAM_Wr_Data2<=`BAR_Color_Background; 
							oSDRAM_Wr_Data3<=`BAR_Color_Background; 
							oSDRAM_Wr_Data4<=`BAR_Color_Background; 
						end
				5:  //the last GRAM_X is 228,229,230,231.
				//X starts from 12, step=+4, 12,16,20,24,28,32,36,40.....
					if(GRAM_X>=228) begin 
										GRAM_X<=12; 
										i<=i+1'b1; 
									end
					else begin 
							GRAM_X<=GRAM_X+4; //4 words each time.
							i<=i-1'b1; 
						end

				6:  //614*480=294720. 294720/4 words=73680.
				//Y starts from 7200, step is 480, 8160,8640,9120,9600.....
					if(GRAM_Y>=294720) begin 
											GRAM_Y<=7200; 
											i<=i+1'b1; 
										end
					else begin 
							GRAM_Y<=GRAM_Y+480;
							i<=i-2; //Loop to fill next column. 
						end
				/////////////////////////////////////////////////////////////////
				7: //Shift RdPointer to generate Left-Shift-Effect.
					begin //0~599 => *4 => 0~2396,2397,2398,2399.
						if(cnt_Shift_PulseCounter>=2396)
							cnt_Shift_PulseCounter<=0;
						else //shift 1 pulse counter each time.
							cnt_Shift_PulseCounter<=cnt_Shift_PulseCounter+4;
						//////////////////////////////////////////////////
						i<=i+1'b1;
					end
				8:
					begin
						//delay one clk to update ringbuffer_rd_addr.
						ringbuffer_rd_addr<=384000+cnt_Shift_PulseCounter;
						//GRAM Address.
						GRAM_Y<=7200;
						GRAM_X<=12;
						i<=i+1'b1;
					end
				9: //calculating the write address of new PulseCounter.
				//Always write new data at the end of rd addr+600.
					begin
						if(ringbuffer_rd_addr==384000)
								//384000,384001,384002,384003.
								//............................
								//386396,386397,386398,386399.
								//(386399-384000+1)/(4 words)=600.
								ringbuffer_wr_addr<=386396;
						else 
							ringbuffer_wr_addr<=ringbuffer_rd_addr-4;
						/////////////////////////////////////////////////
						i<=i+1'b1;
					end
				10: //Write the new pulse counter to specify address.
				//Since SDRAM operates four words each time.
				//but we only use the first word, other 3 words we write zero.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=ringbuffer_wr_addr;
							oSDRAM_Wr_Data1<=lockInPulseCounter;
							oSDRAM_Wr_Data2<=PulseCouter_LCD[23:16];
							oSDRAM_Wr_Data3<=PulseCouter_LCD[15:8];
							oSDRAM_Wr_Data4<=PulseCouter_LCD[7:0];
						end
				11: //Read History 600 Pulse Counter from ring buffer.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										//GRAM X, offset=12, X width=220, 
										//so the maximum of GRAM_X is 12+220-1=231,
										//since we operate 4 pixels each time, so 231-4=227.

										//Truncate to avoid reaching full scale.
										//Histogram divided by 1,2,4,8 to avoid reach full scale.
										case(iPulseCounter_Gain_Divider)
											2: //DIV2=Right shift 1 bit. 2^1=2.
												begin
													if((12+iSDRAM_Data1>>1)>=228) begin
														GRAM_Pixel_Addr<=GRAM_Y+228;
														
														//Full-scale reached, no need to draw MaxPulse Indicator.
														MaxPulseCounter_X<=0;
														MaxPulseCounter_Y<=0;
																				end
													else begin
															GRAM_Pixel_Addr<=GRAM_Y+12+(iSDRAM_Data1>>1); //+xOffset.
															
															//maximum pulse counter tracking.
															MaxPulseCounter_X<=12+(iSDRAM_Data1>>1);
															MaxPulseCounter_Y<=GRAM_Y;
														end
												end
											3: //DIV4=Right shift 2 bits. 2^2=4.
												begin
													if((12+iSDRAM_Data1>>2)>=228) begin
														GRAM_Pixel_Addr<=GRAM_Y+228;

														//Full-scale reached, no need to draw MaxPulse Indicator.
														MaxPulseCounter_X<=0;
														MaxPulseCounter_Y<=0;
																				end
													else begin
															GRAM_Pixel_Addr<=GRAM_Y+12+(iSDRAM_Data1>>2); //+xOffset.

															//maximum pulse counter tracking.
															MaxPulseCounter_X<=12+(iSDRAM_Data1>>2);
															MaxPulseCounter_Y<=GRAM_Y;
														end
												end
											4: //DIV8=Right shift 3 bits. 2^3=8.
												begin
													if((12+iSDRAM_Data1>>3)>=228) begin
														GRAM_Pixel_Addr<=GRAM_Y+228;

														//Full-scale reached, no need to draw MaxPulse Indicator.
														MaxPulseCounter_X<=0;
														MaxPulseCounter_Y<=0;
																				end
													else begin
															GRAM_Pixel_Addr<=GRAM_Y+12+(iSDRAM_Data1>>3); //+xOffset.

															//maximum pulse counter tracking.
															MaxPulseCounter_X<=12+(iSDRAM_Data1>>3);
															MaxPulseCounter_Y<=GRAM_Y;
														end
												end
											default: //0, DIV1. 2^0=1.
												begin
													if((12+iSDRAM_Data1)>=228) begin
														GRAM_Pixel_Addr<=GRAM_Y+228;

														//Full-scale reached, no need to draw MaxPulse Indicator.
														MaxPulseCounter_X<=0;
														MaxPulseCounter_Y<=0;
																			end
													else begin
															GRAM_Pixel_Addr<=GRAM_Y+12+iSDRAM_Data1; //+xOffset.
															
															//maximum pulse counter tracking.
															MaxPulseCounter_X<=12+iSDRAM_Data1; 
															MaxPulseCounter_Y<=GRAM_Y;
														end
												end
										endcase
										////////////////////////////////////////////////
										//Update the Maximum value.
										if({iSDRAM_Data2,iSDRAM_Data3,iSDRAM_Data4}>oMaxPulseCounter)
											oMaxPulseCounter<={4'd0,iSDRAM_Data2,iSDRAM_Data3,iSDRAM_Data4};
										//Update the Minimum value.
										if({iSDRAM_Data2,iSDRAM_Data3,iSDRAM_Data4}<oMinPulseCounter)
											oMinPulseCounter<={4'd0,iSDRAM_Data2,iSDRAM_Data3,iSDRAM_Data4};
										////////////////////////////////////////////////
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
							oSDRAM_Rd_Addr<=ringbuffer_rd_addr;
						end
				12: //Scan from xStart to xEnd.
					begin
						oSDRAM_Wr_Addr<=GRAM_Y+GRAM_X;
						i<=i+1'b1;
					end
				13: //write 4 words each time.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1;
							if((oSDRAM_Wr_Addr+3)<=GRAM_Pixel_Addr) begin
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
				14: //Loop to write X.
				//the last GRAM_X is 228,229,230,231.
					if(GRAM_X>=228) begin GRAM_X<=12; i<=i+1'b1; end
					else begin 
							GRAM_X<=GRAM_X+4; //4 words each time.
							i<=i-2; //Loop to write next pixel.
						end
				15: //Loop 600 times. //(12,15)-(12+220-1,15+600-1)=(220,600).
				//614*480=294720. 294720/4 words=73680.
					if(GRAM_Y>=294720) begin GRAM_Y<=7200; i<=i+1'b1; end
					else begin 
							//Loop ring buffer for rd_addr.
							//386396,386397,386398,386399:  600st unit, PulseCounter stored in 386396.
							if(ringbuffer_rd_addr==386396)
								ringbuffer_rd_addr<=384000;
							else
								ringbuffer_rd_addr<=ringbuffer_rd_addr+4;

							//GRAM Y. Next Y.
							GRAM_Y<=GRAM_Y+480; 
							i<=11; //Loop to read next pulse counter.
						end
				16: //Draw MaxPulseCounter Indicate Line.
					/*
					if(MaxPulseCounter_X!=0 && MaxPulseCounter_Y!=0) begin
						//StartY: +yOffset=15*480=7200.
						oSDRAM_Wr_Addr<=MaxPulseCounter_X+7200;
						i<=i+1'b1;
												end
					else begin
							//Full-scale reached, no need to draw MaxPulseCounter Indicator.
							i<=18; //bypass drawing MaxPulseCounter Indicate Line.
						end
					*/
						i<=i+1'b1;
				17: //Draw Line.
					/*
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			
					else begin 
							oSDRAM_Wr_Req<=1;
							oSDRAM_Wr_Data1<=`Color_Green;
							oSDRAM_Wr_Data2<=`BAR_Color_Background;
							oSDRAM_Wr_Data3<=`BAR_Color_Background;
							oSDRAM_Wr_Data4<=`BAR_Color_Background;
						end
					*/
					i<=i+1'b1;
				18: //EndY.
				/*
					if(oSDRAM_Wr_Addr>=MaxPulseCounter_X+MaxPulseCounter_Y) begin i<=i+1'b1; end
					else begin
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480;
							i<=i-1'b1; //Loop to draw next point.
						end
				*/
					i<=i+1'b1;
				19: 
					//Pause or Run.
					//1=Pause, 0=Run.
					if(!iPause) begin i<=7; end
			endcase
		 end
	else begin //if(en)
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

			//Find out the Maxium & Minimum Pulse Counter within 600 points.
			oMaxPulseCounter<=0;
			oMinPulseCounter<=32'hFFFFFFFF;

			//maximum pulse counter tracking.
			MaxPulseCounter_X<=0;
			MaxPulseCounter_Y<=0;
		end
endmodule
