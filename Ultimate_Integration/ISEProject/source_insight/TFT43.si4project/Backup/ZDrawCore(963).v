`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:46:25 04/14/2023 
// Design Name: 
// Module Name:    ZDrawCore 
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
parameter
ZCURSOR_INDEX_MODE1=0, //Mode1.
ZCURSOR_INDEX_MODE2=1, //Mode2.
ZCURSOR_INDEX_MODE3=2, //Mode3.
ZCURSOR_INDEX_MODE4=3; //Mode4.
module ZDrawCore(
    input clk,
    input rst_n,
    input en,

	//0: Clear Screen, iData1=Background Color.
	//1: Draw Fixed Pixel Image.
	//2: Draw RTC.
	//3: Draw SIN wave.
	//4: Draw GongPinTongBu and GuangZiMaiChong.
	//5. Draw A New Photon Counter. iData1=New Photon Counter.
	//6. Draw Random Histogram.
	//7: Draw Mode1~Mode4, iData1=0,1,2,3. Active Mode.
	//8: Draw Accumulated Counter, iData1=Counter.
	input [3:0] iCmd,
	input [31:0] iData1,
	output reg oDraw_Done, //output, indicate draw done.

	//Cursor Index.
	input [3:0] iCursor_Index,
	
	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data1, //ouptut, write data1 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data2, //ouptut, write data2 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data3, //ouptut, write data3 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data4, //ouptut, write data4 to SDRAM.
    output reg oSDRAM_Wr_Req, //output, SDRAM write request.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );

//https://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml
//Sine Look Up Table Generator
//Number of Points: 120
//Max Amplitude: 220
//Numbers Per Row: 8
//M9K=9*1024bits=9216bits.
//120 Samples*8-bits *5 periods =950bits *5 periods =4800 bits.
reg [9:0] addr_SIN;
wire [7:0] data_SIN;
reg [9:0] cnt_data_SIN;
reg [9:0] cnt_SIN_Shift;
ZSIN_ROM_M9K ic_SIN_ROM(
  .clka(clk), // input clka
  .addra(addr_SIN), // input [9 : 0] addra
  .douta(data_SIN) // output [7 : 0] douta
);

//https://www.calculator.net/random-number-generator.html
//Comprehensive Version: 0~220, Generate 600 numbers.
reg [9:0] addr_Random;
wire [7:0] data_Random;
ZPulseCounter_Random ic_PulseCounter_Random (
  .clka(clk), // input clka
  .addra(addr_Random), // input [9 : 0] addra
  .douta(data_Random) // output [7 : 0] douta
);

////////////////////////////////////////////////////////////
//RTC Module.
wire [3:0] hour_10;
wire [3:0] hour_1;
wire [3:0] minute_10;
wire [3:0] minute_1;
wire [3:0] second_10;
wire [3:0] second_1;
ZRTC_Counter ic_RTC(
    .clk(clk),
    .rst_n(rst_n),
    .en(1'b1), //Always Enable.
    .hour_10(hour_10),
    .hour_1(hour_1),
    .minute_10(minute_10),
    .minute_1(minute_1),
    .second_10(second_10),
    .second_1(second_1));
 
//RTC: xx:xx:xx ZiMo Address Mux.
reg [3:0] select_RTCMux;
wire [10:0] dout_RTC_ZiMo_Addr;
ZRTC_Mux8to1 ic_RTC_Mux(
    .select(select_RTCMux),
    .hour_10(hour_10),
    .hour_1(hour_1),
    .minute_10(minute_10),
    .minute_1(minute_1),
    .second_10(second_10),
    .second_1(second_1),
    .dout(dout_RTC_ZiMo_Addr)
    );
////////////////////////////////////////////////////////
reg [3:0] select_PulseCounterMux;
reg [31:0] PulseCounter;
wire [10:0] dout_PulseCounter_ZiMo_Addr;
ZPulseCounter_Mux10to1 ic_PulseCounter_Mux(
	//0: q7
	//1: q6
	//2: q5
	//3: q4
	//4: q3
	//5: q2
	//6: q1
	//7: q0
    .select(select_PulseCounterMux),
    
    .q0(PulseCounter[3:0]), //input.
    .q1(PulseCounter[7:4]),
    .q2(PulseCounter[11:8]),
    .q3(PulseCounter[15:12]),
    .q4(PulseCounter[19:16]),
    .q5(PulseCounter[23:20]),
    .q6(PulseCounter[27:24]),
    .q7(PulseCounter[31:28]),
    
    .dout(dout_PulseCounter_ZiMo_Addr) //output.
    );
////////////////////////////////////////////////////////
//ZiMo 32x32.
reg [11:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
reg [7:0] cnt_8bits;
reg [7:0] cnt_3bytes; //Font Matrix, 24*12, 24bits/8bits=3bytes.
reg [7:0] cnt_4bytes; //Font Matrix, 32*32, 32bits/8bits=4bytes.
reg [7:0] cnt_bytes; //column 12 repeat times.
reg [7:0] cnt_column;
M9K_ZiMo3232 ic_M9K_ZiMo3232 (
  .a(addr_ZiMo3232), // input [11 : 0] a
  .spo(data_ZiMo3232) // output [7 : 0] spo
);
////////////////////////////////////////////////////////
//driven by step i.
reg [15:0] i;
reg [31:0] x_position;
reg [31:0] y_position;
reg [7:0] pixel_data;
reg [7:0] which_dot_matrix;
reg [23:0] addr_photon_counter;
reg [7:0] CNT1;
reg [31:0] clear_X;
reg [31:0] clear_Y;
reg [31:0] fill_pixel_addr;
reg [31:0] clean_X;
reg [31:0] clean_Y;
//prefetch pixel dot matrix.
reg [7:0] pixel_data1;
reg [7:0] pixel_data2;
reg [7:0] pixel_data3;
reg [7:0] pixel_data4;
//draw cursor flag.
reg flag_draw_cursor;
reg [31:0] addr_draw_cursor;
reg [7:0] length_draw_cursor;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data1<=0;
			oSDRAM_Wr_Data2<=0;
			oSDRAM_Wr_Data3<=0;
			oSDRAM_Wr_Data4<=0;
			oSDRAM_Wr_Req<=1'b0;
			oDraw_Done<=1'b0;

			//SIN wave.
			addr_SIN<=0;
			cnt_data_SIN<=0;
			cnt_SIN_Shift<=0;

			//Random Histogram.
			addr_Random<=0;

			//ZiMo 32x32.
			addr_ZiMo3232<=0;
			cnt_addr_ZiMo3232<=0;
			select_RTCMux<=0;
			
			//SDRAM Space Assignment
			//0~383999: (480*800-1): LCD GRAM. 
			//384000~384599: (384000+600-1): Photon Counter.
			addr_photon_counter<=384000;

			//draw cursor flag.
			flag_draw_cursor<=1'b0;
			addr_draw_cursor<=0;
			length_draw_cursor<=0;
		end
else if(en) begin
			case(iCmd)
				0: //Clear Screen.
					case(i)
						0: //Clear Screen, iData1=Background Color.
							begin
								oSDRAM_Wr_Addr<=0;
								i<=i+1'b1; 
							end
						1: //Clear Screen: write one pixel data each time.
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=iData1; //Background Color.
									oSDRAM_Wr_Data2<=iData1; //Background Color.
									oSDRAM_Wr_Data3<=iData1; //Background Color.
									oSDRAM_Wr_Data4<=iData1; //Background Color.
									//oSDRAM_Wr_Data1<=16'h1986;
								end
						2: //Clear Screen: 480*800=384000.
						//The last one is 383996, 383997,383998,383999.
							if(oSDRAM_Wr_Addr>=383996) begin 
														oSDRAM_Wr_Addr<=0; 
														i<=i+1'b1; 
													end
							else begin 
									//0,1,2,3.....4,5,6,7......8,9,10,11.....
									//write address offset +4.
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						3: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						4: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				1: //Draw Fixed Pixel Image.
					case(i)
						0: //Draw A Line from (10,10) to (470,10) .
							begin 
								oSDRAM_Wr_Addr<=4810-1; //(10,10)=y*width+x=10*480+10=4810.
								i<=i+1'b1; 
							end
						1: 
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Green;
									oSDRAM_Wr_Data2<=`Color_Green;
									oSDRAM_Wr_Data3<=`Color_Green;
									oSDRAM_Wr_Data4<=`Color_Green;
								end
						2: //(470,10)=y*width+x=10*480+470=5270.
							if(oSDRAM_Wr_Addr>=5270-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; //4 words each time.
									i<=i-1'b1; //Loop to write next pixel.
								end
						3: //Draw A Line from (10,790) to (470,790) .
							begin 
								oSDRAM_Wr_Addr<=379210-1; //(10,790)=y*width+x=790*480+10=379210.
								i<=i+1'b1; 
							end
						4: 
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Green;
									oSDRAM_Wr_Data2<=`Color_Green;
									oSDRAM_Wr_Data3<=`Color_Green;
									oSDRAM_Wr_Data4<=`Color_Green;
								end
						5: //(470,790)=y*width+x=790*480+470=379670.
							if(oSDRAM_Wr_Addr>=379670-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; //4 words each time.
									i<=i-1'b1; //Loop to write next pixel.
								end
						6: //Draw A Line from (10,10) to (10,790).
							begin 
								oSDRAM_Wr_Addr<=4810-1; //(10,10)=y*width+x=10*480+10=4810.
								i<=i+1'b1; 
							end
						7:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Green;
									oSDRAM_Wr_Data2<=`Screen_Color_Background;
									oSDRAM_Wr_Data3<=`Screen_Color_Background;
									oSDRAM_Wr_Data4<=`Screen_Color_Background;
								end
						8: //(10,790)=y*width+x=790*480+10=379210.
							if(oSDRAM_Wr_Addr>=379210-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						9: //Draw A Line from (470,10) to (470,790).
							begin 
								oSDRAM_Wr_Addr<=5270-1; //(470,10)=y*width+x=10*480+470=5270.
								i<=i+1'b1; 
							end
						10:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Green;
									oSDRAM_Wr_Data2<=`Screen_Color_Background;
									oSDRAM_Wr_Data3<=`Screen_Color_Background;
									oSDRAM_Wr_Data4<=`Screen_Color_Background;
								end
						11: //(470,790)=y*width+x=790*480+470=379670.
							if(oSDRAM_Wr_Addr>=379670-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						12: //Draw A Line from (240,10) to (240,790).
							begin 
								oSDRAM_Wr_Addr<=5040-1; //(240,10)=y*width+x=10*480+240=5040.
								i<=i+1'b1; 
							end
						13:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Yellow;
									oSDRAM_Wr_Data2<=`Screen_Color_Background;
									oSDRAM_Wr_Data3<=`Screen_Color_Background;
									oSDRAM_Wr_Data4<=`Screen_Color_Background;
								end
						14: //(240,790)=y*width+x=790*480+240=379440.
							if(oSDRAM_Wr_Addr>=379440-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						15: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						16: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				2: //2. Draw RTC.
				//23:59:59  Font Size: 24*12.
				//Clear the area before writing.
				//(x1,y1)=(410,680) (x2,y2)=(410+24,680+8*12)=(434,776).
					case(i)
						0: //set start address.(410,680)=y*width+x=680*480+410=326810.
						//SDRAM Read/Write Address must be aligned by 4 words.
						//0,4,8,12,16,20,24,28,32,36,40.......
						//326812/4=81703.
							begin
								oSDRAM_Wr_Addr<=326812;
								select_RTCMux<=0; //xx:xx:xx
								i<=i+1'b1;
							end
						1: //Update ZiMo address for next digit.
							begin 
								//choose 0~9 ZiMo Offset Value.
								addr_ZiMo3232<=dout_RTC_ZiMo_Addr; //0~9.
								
								//reset counter.
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: //pre-fetch 1st byte.
							begin pixel_data1<=data_ZiMo3232; i<=i+1'b1; end
						3: //Because ROM is Combinal Logic, it changes at once, so we only change address at next clock to avoid mistakes!!!
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						4: //pre-fetch 2st byte.
							begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
						5: //Because ROM is Combinal Logic, it changes at once, so we only change address at next clock to avoid mistakes!!!
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						6: //pre-fetch 3st byte.
							begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
						7: //Because ROM is Combinal Logic, it changes at once, so we only change address at next clock to avoid mistakes!!!
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						8: //Reverse 3 bytes of this column.
							begin
								case(cnt_bytes)
									0: pixel_data<=pixel_data3;
									1: pixel_data<=pixel_data2;
									2: pixel_data<=pixel_data1;
								endcase
								i<=i+1'b1;
							end
						9: //Loop to draw 1 byte - low 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						10: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						11: //Loop to draw 1 byte - high 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						12: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						13: //24*12, 24bits/8bits=3bytes. 3 bytes of each column.
							begin 
								if(cnt_bytes==3-1) begin cnt_bytes<=0; i<=i+1'b1; end							
								else begin 
										cnt_bytes<=cnt_bytes+1'b1; 
										i<=8; //Loop to draw next byte of this column.
									end
							end
						14: //repeat 12 times of 3 bytes = 3*12=36 bytes of one 24*12 dot matrx.
							begin
								if(cnt_column==12-1) begin cnt_column<=0; i<=i+1'b1; end		
								else begin 
										cnt_column<=cnt_column+1'b1; 
										i<=2; //Loop to draw one complete digit.
									end
								//since we operate SDRAM four words each time.
								//so the address direction is increasing. 
								//then we should -24 in next column.
								//adjust coordinate: new position: x-24 and y+480.
								oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-24+480; //Next Column.
							end
						15: //xx:xx:xx, we have 8 digits to draw.
							if(select_RTCMux==8-1) begin select_RTCMux<=0; i<=i+1'b1; end
							else begin 
									select_RTCMux<=select_RTCMux+1'b1; 
									i<=1; //Loop to draw next digit.
								end
						16: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						17: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				3: //3. Draw SIN wave.
				//https://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml
				//Sine Look Up Table Generator
				//Number of Points: 120
				//Max Amplitude: 220
				//Numbers Per Row: 8
				//Single Period SIN wave is 120 points, 0~220.
				//The upper limit is 470, the bottom limit is 250, so the available drawing space is 470-250=220.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw SIN wave in rectangle (208,20)-(208+256,20+600)=(464,620).
					case(i)
						0: //Calculate SDRAM plain address.
							begin 
								//Plain xOffset=244. because the middle line is 480/2=240.
								//Plain yOffset=15*480=7200.
								x_position<=244-1+data_SIN; //+xOffset.
								y_position<=7200;
								i<=i+1'b1; 
							end
						1: //calculate the pixel address that need to be set.
							begin 
								fill_pixel_addr<=y_position+x_position;
								i<=i+1'b1; 
							end
						2: //clean all pixels in this column before drawing. (X:244~464, 244+220=464)
							begin
								clean_X<=244-1;
								clean_Y=y_position;
								i<=i+1'b1;
							end
						3: //clean all pixels in this column before drawing. (X:244~464, 244+220=464)
							begin 
								oSDRAM_Wr_Addr<=clean_Y+clean_X;
								i<=i+1'b1; 
							end
						4: //clean all pixels in this column before drawing. (X:244~464, 244+220=464)
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1;
									if((oSDRAM_Wr_Addr+0)==fill_pixel_addr) begin
																		oSDRAM_Wr_Data1<=`Color_Yellow;
																		oSDRAM_Wr_Data2<=`Color_Yellow;
																		oSDRAM_Wr_Data3<=`Color_Yellow;
																		oSDRAM_Wr_Data4<=`Color_Yellow;
																		end
									else if((oSDRAM_Wr_Addr+1)==fill_pixel_addr) begin
																		oSDRAM_Wr_Data1<=`Color_Yellow;
																		oSDRAM_Wr_Data2<=`Color_Yellow;
																		oSDRAM_Wr_Data3<=`Color_Yellow;
																		oSDRAM_Wr_Data4<=`Color_Yellow;
																		end
									else if((oSDRAM_Wr_Addr+2)==fill_pixel_addr) begin
																		oSDRAM_Wr_Data1<=`Color_Yellow;
																		oSDRAM_Wr_Data2<=`Color_Yellow;
																		oSDRAM_Wr_Data3<=`Color_Yellow;
																		oSDRAM_Wr_Data4<=`Color_Yellow;
																		end
									else if((oSDRAM_Wr_Addr+3)==fill_pixel_addr) begin
																		oSDRAM_Wr_Data1<=`Color_Yellow;
																		oSDRAM_Wr_Data2<=`Color_Yellow;
																		oSDRAM_Wr_Data3<=`Color_Yellow;
																		oSDRAM_Wr_Data4<=`Color_Yellow;
																		end
									else begin
											oSDRAM_Wr_Data1<=`SIN_Color_Background;
											oSDRAM_Wr_Data2<=`SIN_Color_Background;
											oSDRAM_Wr_Data3<=`SIN_Color_Background;
											oSDRAM_Wr_Data4<=`SIN_Color_Background;
										end
								end
						5: //clean all pixels in this column before drawing. (X:244~464, 244+220=464)
							if(clean_X>=464-1) begin i<=i+1'b1; end
							else begin 
									clean_X<=clean_X+4; 
									i<=3; //loop to clean this column.
								end
						6: //120 points single period, 5 periods*120 points=600.
							if(cnt_data_SIN==600-1) begin 
													cnt_data_SIN<=0; 
													i<=i+1'b1;
												end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									
									//Loop addr of SIN data.
									if(addr_SIN==10'd600-1 ) begin addr_SIN<=10'd0; end				
									else begin addr_SIN<=addr_SIN+1'b1; end	
									
									x_position<=244-1+data_SIN; //+xOffset.
									y_position<=y_position+480; //next y.
									i<=1; //Loop to write next pixel.
								end
						7: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						8: //Generate done Signal.
							begin 
								oDraw_Done<=1'b0; 
								i<=0; 
								
								//SIN shift accumulation here.
								if(cnt_SIN_Shift==10'd120-1)
									cnt_SIN_Shift<=10'd0;
								else
									cnt_SIN_Shift<=cnt_SIN_Shift+1'b1; 
								///////////////////////////////////
								//infect addr_SIN next time.
								addr_SIN<=cnt_SIN_Shift;
							end
					endcase
				4: //4: Draw GongPinTongBu and GuangZiMaiChong.
					case(i)
						0:
							begin which_dot_matrix<=0; i<=i+1'b1; end
						1:
							begin //Since SDRAM address increase 4 each time, so here we draw from bottom to top.
								case(which_dot_matrix)
									0: //Rising Edge Symbol.
										begin
											addr_ZiMo3232<=1932; //offset of Rising Edge Symbol.
											//(436,628)
											//436+32=468, 628+32=660. =>(468,660)
											//addr=y*width+x=628*480+436=301876.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//301876/4=75469.
											oSDRAM_Wr_Addr<=301876;
										end
									1: //Gong.
										begin 
											addr_ZiMo3232<=0; //offset of Gong.
											//(436,660)
											//436+32=468, 660+32=692. =>(468,692)
											//addr=y*width+x=660*480+436=317236.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//3172836/4=79309.
											oSDRAM_Wr_Addr<=317236;
										end
									2: //Pin.
										begin 
											addr_ZiMo3232<=128; //offset of Pin.
											//(436,692)
											//436+32=468, 692+32=724. =>(468,724)
											//addr=y*width+x=692*480+436=332596.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//332596/4=83149.
											oSDRAM_Wr_Addr<=332596;
										end
									3: //Tong.
										begin 
											addr_ZiMo3232<=256; //offset of Gong.
											//(436,724)
											//436+32=468, 724+32=756. =>(468,756)
											//addr=y*width+x=724*480+436=347956.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//347956/4=86989.
											oSDRAM_Wr_Addr<=347956;
										end
									4: //Bu.
										begin 
											addr_ZiMo3232<=384; //offset of Gong.
											//(436,756)
											//436+32=468, 756+32=788. =>(468,788)
											//addr=y*width+x=756*480+436=363316.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//363316/4=90829.
											oSDRAM_Wr_Addr<=363316;
										end
									5: //Guang.
										begin 
											addr_ZiMo3232<=512; //offset of Guang.
											//(206,660)
											//206+32=238, 660+32=692. =>(238,692)
											//addr=y*width+x=660*480+206=317006.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//317004/4=79251.
											oSDRAM_Wr_Addr<=317004;
										end
									6: //Zi.
										begin 
											addr_ZiMo3232<=640; //offset of Zi.
											//(206,692)
											//206+32=238, 692+32=724. =>(238,724)
											//addr=y*width+x=692*480+206=332366.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//332364/4=83091.
											oSDRAM_Wr_Addr<=332364;
										end
									7: //Mai.
										begin 
											addr_ZiMo3232<=768; //offset of Mai.
											//(206,724)
											//206+32=238, 724+32=756. =>(238,756)
											//addr=y*width+x=724*480+206=347726.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//347724/4=86931.
											oSDRAM_Wr_Addr<=347724;
										end
									8: //Chong.
										begin 
											addr_ZiMo3232<=896; //offset of Chong.
											//(206,756)
											//206+32=238, 756+32=788. =>(238,788)
											//addr=y*width+x=756*480+206=363086.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//0,4,8,12,16,20,24,28,32,36,40.......
											//363084/4=90771.
											oSDRAM_Wr_Addr<=363084;
										end
								endcase
								
								//reset counter.
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: //pre-fetch 1st byte.
							begin pixel_data1<=data_ZiMo3232; i<=i+1'b1; end
						3:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
						4: //pre-fetch 2st byte.
							begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
						5:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
						6: //pre-fetch 3st byte.
							begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
						7:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
						8: //pre-fetch 4st byte.
							begin pixel_data4<=data_ZiMo3232; i<=i+1'b1; end
						9:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
						10:
							begin
								case(cnt_bytes)
									0: pixel_data<=pixel_data4;
									1: pixel_data<=pixel_data3;
									2: pixel_data<=pixel_data2;
									3: pixel_data<=pixel_data1;
								endcase
								i<=i+1'b1;
							end
						11: //Loop to draw 4st byte - low 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						12: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						13: //Loop to draw 4st byte - high 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						14: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						15: //32*32, 32bits/8bits=4bytes. 4 bytes of each column.
							begin 
								if(cnt_bytes==4-1) begin cnt_bytes<=0; i<=i+1'b1; end							
								else begin 
										cnt_bytes<=cnt_bytes+1'b1; 
										i<=10; //Loop to draw next byte of this column.
									end
							end
						16: //repeat 32 times of 4 bytes = 32*4=128 bytes of one 32*32 dot matrx.
							begin
								if(cnt_column==32-1) begin cnt_column<=0; i<=i+1'b1; end		
								else begin 
										cnt_column<=cnt_column+1'b1; 
										i<=2; //Loop to draw one complete digit.
									end
								//since we operate SDRAM four words each time.
								//so the address direction is increasing. 
								//then we should -32 in next column.
								//adjust coordinate: new position: x-32 and y+480.
								oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-32+480; //Next Column.
							end
						17: //we have 9 chars to be drawn.
							if(which_dot_matrix==9-1) begin which_dot_matrix<=0;i<=i+1'b1; end
							else begin 
									which_dot_matrix<=which_dot_matrix+1'b1; 
									i<=1; //Loop to draw Next dot matrix.
								end
						18: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						19: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				5: //5. Draw A New Photon Counter. iData1=New Photon Counter.
				//99999999  Font Size: 24*12.
				//(156,680) - (156+24=180, 680+12*8=776)=>(180-1,776-1)
					case(i)
						0: //set start address.(156,680)=y*width+x=680*480+156=326556.
						//SDRAM Read/Write Address must be aligned by 4 words.
						//326556/4=81639.
							begin
								oSDRAM_Wr_Addr<=326556;
								PulseCounter<=iData1;
								select_PulseCounterMux<=0; //99999999.
								i<=i+1'b1;
							end
						1: //Update ZiMo address for next digit.
							begin 
								//choose 0~9 ZiMo Offset Value.
								addr_ZiMo3232<=dout_PulseCounter_ZiMo_Addr; //0~9.
								
								//reset counter.
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: //pre-fetch 1st byte.
							begin pixel_data1<=data_ZiMo3232; i<=i+1'b1; end
						3:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						4: //pre-fetch 2st byte.
							begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
						5:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						6: //pre-fetch 3st byte.
							begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
						7:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						8: //Reverse 3 bytes of this column.
							begin
								case(cnt_bytes)
									0: pixel_data<=pixel_data3;
									1: pixel_data<=pixel_data2;
									2: pixel_data<=pixel_data1;
								endcase
								i<=i+1'b1;
							end
						9: //Loop to draw 1 byte - low 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
									//oSDRAM_Wr_Data2<=`Color_Green;
									//oSDRAM_Wr_Data3<=`Color_Green;
									//oSDRAM_Wr_Data4<=`Color_Green;
								end
						10: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						11: //Loop to draw 1 byte - high 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Pink;
									//oSDRAM_Wr_Data2<=`Color_Pink;
									//oSDRAM_Wr_Data3<=`Color_Pink;
									//oSDRAM_Wr_Data4<=`Color_Pink;
								end
						12: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						13: //24*12, 24bits/8bits=3bytes. 3 bytes of each column.
							begin 
								if(cnt_bytes==3-1) begin cnt_bytes<=0; i<=i+1'b1; end							
								else begin 
										cnt_bytes<=cnt_bytes+1'b1; 
										i<=8; //Loop to draw next byte of this column.
									end
							end
						14: //repeat 12 times of 3 bytes = 3*12=36 bytes of one 24*12 dot matrx.
							begin
								if(cnt_column==12-1) begin cnt_column<=0; i<=i+1'b1; end		
								else begin 
										cnt_column<=cnt_column+1'b1; 
										i<=2; //Loop to draw one complete digit.
									end
								//since we operate SDRAM four words each time.
								//so the address direction is increasing. 
								//then we should -24 in next column.
								//adjust coordinate: new position: x-24 and y+480.
								oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-24+480; //Next Column.
							end
						15: //xx:xx:xx, we have 8 digits to draw.
							if(select_PulseCounterMux==8-1) begin select_PulseCounterMux<=0; i<=i+1'b1; end
							else begin 
									select_PulseCounterMux<=select_PulseCounterMux+1'b1; 
									i<=1; //Loop to draw next digit.
								end
						16: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						17: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				6: //Draw Random Histogram.
				//Single Period SIN wave is 120 points,.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw Random Histogram in rectangle (15,20)-(15+220,20+600)=(235,620).
					case(i)
						0: //Calculate SDRAM plain address.
							begin 
								//Plain xOffset=208.
								//Plain yOffset=20*480=9600.
								x_position<=10+data_Random; //+xOffset.
								y_position<=9600;
								CNT1<=data_Random; 
								i<=i+1'b1; 
							end
						1: //Original.
							begin 
								oSDRAM_Wr_Addr<=y_position+x_position-1;
								i<=i+1'b1; 
							end
						2:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data1<=`Color_Pink;
								end
						3: //Loop to draw from top to bottom to generate histogram.
							if(CNT1==0) begin i<=i+1'b1; end
							else begin 
									CNT1<=CNT1-1'b1; 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1; 
									i<=2; 
								end
						
						4: //120 points single period, 5 periods*120 points=600.
							if(cnt_data_SIN==600-1) begin 
													cnt_data_SIN<=0; 
													addr_Random<=0;
													i<=i+1'b1;
												end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									addr_Random<=addr_Random+1'b1; 
									
									x_position<=10+data_Random; //+xOffset.
									y_position<=y_position+480; //next y.
									CNT1<=data_Random;
									i<=1; //Loop to write next pixel.
								end
						5: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						6: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				7: //7: Draw Mode1~Mode4, iData1=0,1,2,3. Active Mode.
					case(i)
						0:
							begin which_dot_matrix<=0; i<=i+1'b1; end
						1:
							begin
								case(which_dot_matrix)
									0: //Mode1 Icon.
										begin 
											addr_ZiMo3232<=1420; //offset of Icon1.
											//(372,660)
											//372+32=404, 660+32=692. =>(372,692)
											//addr=y*width+x=660*480+372=317172.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//317168/4=79292.
											oSDRAM_Wr_Addr<=317168;

											//draw cursor indicate line below the Icon.
											addr_draw_cursor<=317168-4; 
											//All Icons are 32*32 size, so we draw a 32 width line below Icons.
											length_draw_cursor<=32;											
											if(iCursor_Index==ZCURSOR_INDEX_MODE1) 
												flag_draw_cursor<=1'b1;
											else 
												flag_draw_cursor<=1'b0; 
										end
									1: //Mode2 Icon.
										begin 
											addr_ZiMo3232<=1548; //offset of Icon2.
											//(372,692)
											//372+32=404, 692+32=724. =>(372,724)
											//addr=y*width+x=692*480+372=332532.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//332528/4=83132.
											oSDRAM_Wr_Addr<=332528;

											//draw cursor indicate line below the Icon.
											addr_draw_cursor<=332528-4; 
											//All Icons are 32*32 size, so we draw a 32 width line below Icons.
											length_draw_cursor<=32;
											if(iCursor_Index==ZCURSOR_INDEX_MODE2) 
												flag_draw_cursor<=1'b1;
											else 
												flag_draw_cursor<=1'b0; 
										end
									2: //Mode3 Icon.
										begin 
											addr_ZiMo3232<=1676; //offset of Icon3.
											//(372,724)
											//372+32=404, 724+32=756. =>(372,756)
											//addr=y*width+x=724*480+372=347892.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//347888/4=86972.
											oSDRAM_Wr_Addr<=347888;

											//draw cursor indicate line below the Icon.
											addr_draw_cursor<=347888-4; 
											//All Icons are 32*32 size, so we draw a 32 width line below Icons.
											length_draw_cursor<=32;
											if(iCursor_Index==ZCURSOR_INDEX_MODE3) 
												flag_draw_cursor<=1'b1;
											else 
												flag_draw_cursor<=1'b0; 
										end
									3: //Mode4 Icon.
										begin 
											addr_ZiMo3232<=1804; //offset of Icon4.
											//(372,756)
											//372+32=404, 756+32=788. =>(372,788)
											//addr=y*width+x=756*480+372=363252.
											//SDRAM Read/Write Address must be aligned by 4 words.
											//363248/4=90812.
											oSDRAM_Wr_Addr<=363248;

											//draw cursor indicate line below the Icon.
											addr_draw_cursor<=363248-4; 
											//All Icons are 32*32 size, so we draw a 32 width line below Icons.
											length_draw_cursor<=32;
											if(iCursor_Index==ZCURSOR_INDEX_MODE4) 
												flag_draw_cursor<=1'b1;		
											else 
												flag_draw_cursor<=1'b0; 
										end
								endcase
								
								//reset counter.
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: //pre-fetch 1st byte.
							begin pixel_data1<=data_ZiMo3232; i<=i+1'b1;end
						3:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1;end
						4: //pre-fetch 2st byte.
							begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
						5:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1;end
						6: //pre-fetch 3st byte.
							begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
						7:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1;end
						8: //pre-fetch 4st byte.
							begin pixel_data4<=data_ZiMo3232; i<=i+1'b1; end
						9:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1;end
						10: //ZiMo software scan data from top to bottom.
						//but SDRAM address increases from bottom to top, so reverse the whole column here.
							begin
								case(cnt_bytes)
									0: pixel_data<=pixel_data4;
									1: pixel_data<=pixel_data3;
									2: pixel_data<=pixel_data2;
									3: pixel_data<=pixel_data1;
								endcase
								i<=i+1'b1;
							end
						11: //Loop to draw the byte - low 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Screen_Color_Background):(`Color_Yellow);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						12: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						13: //Loop to draw the byte - high 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Screen_Color_Background):(`Color_Yellow);
									oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Screen_Color_Background):(`Color_Yellow);
									//oSDRAM_Wr_Data1<=`Color_Green;
								end
						14: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						15: //32*32, 32bits/8bits=4bytes. 4 bytes of each column.
							begin 
								if(cnt_bytes==4-1) begin cnt_bytes<=0; i<=i+1'b1; end							
								else begin 
										cnt_bytes<=cnt_bytes+1'b1; 
										i<=10; //Loop to draw other bytes of this column.
									end
							end
						16: //repeat 32 times of 4 bytes = 32*4=128 bytes of one 32*32 dot matrx.
							begin
								if(cnt_column==32-1) begin cnt_column<=0; i<=i+1'b1; end		
								else begin 
										cnt_column<=cnt_column+1'b1; 
										i<=2; //Loop to draw one complete digit.
									end
								//since we operate SDRAM four words each time.
								//so the address direction is increasing. 
								//then we should -32 in next column.
								//adjust coordinate: new position: x-32 and y+480.
								oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-32+480; //Next Column.
							end
						17: 
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Addr<=addr_draw_cursor;
									//Pink: Foreground Color. Black: Background Color.
									if(flag_draw_cursor) begin
														oSDRAM_Wr_Data1<=`Color_Yellow;
														oSDRAM_Wr_Data2<=`Color_Yellow;
														oSDRAM_Wr_Data3<=`Color_Yellow;
														oSDRAM_Wr_Data4<=`Color_Yellow;
														end
									else begin
														oSDRAM_Wr_Data1<=`Screen_Color_Background;
														oSDRAM_Wr_Data2<=`Screen_Color_Background;
														oSDRAM_Wr_Data3<=`Screen_Color_Background;
														oSDRAM_Wr_Data4<=`Screen_Color_Background;
										end
								end
						18:
							if(length_draw_cursor==0) begin i<=i+1'b1; end
							else begin 
									length_draw_cursor<=length_draw_cursor-1'b1; 
									addr_draw_cursor<=addr_draw_cursor+480;
									i<=i-1'b1; //Loop to draw next pixel.
								end
						19: //we have 4 Icons to be drawn.
							if(which_dot_matrix==4-1) begin which_dot_matrix<=0;i<=i+1'b1; end
							else begin 
									which_dot_matrix<=which_dot_matrix+1'b1; 
									i<=1; //Loop to draw Next dot matrix.
								end
						20: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						21: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				8: //8: Draw Accumulated Counter, iData1=Counter.
				//99999999  Font Size: 24*12.
				//(182,680)-(182+24=206,680+12*8=776)=> (206,776)
					case(i)
						0: //set start address.(182,680)=y*width+x=680*480+182=326582.
						//SDRAM Read/Write Address must be aligned by 4 words.
						//326580/4=81645.
							begin
								oSDRAM_Wr_Addr<=326580;
								PulseCounter<=iData1;
								select_PulseCounterMux<=4'd0; //99999999.
								i<=i+1'b1;
							end
						1: //Update ZiMo address for next digit.
							begin 
								//choose 0~9 ZiMo Offset Value.
								addr_ZiMo3232<=dout_PulseCounter_ZiMo_Addr; //0~9.
								
								//reset counter.
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: //pre-fetch 1st byte.
							begin pixel_data1<=data_ZiMo3232; i<=i+1'b1; end
						3:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						4: //pre-fetch 2st byte.
							begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
						5:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						6: //pre-fetch 3st byte.
							begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
						7:
							begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
							
						8: //Reverse 3 bytes of this column.
							begin
								case(cnt_bytes)
									0: pixel_data<=pixel_data3;
									1: pixel_data<=pixel_data2;
									2: pixel_data<=pixel_data1;
								endcase
								i<=i+1'b1;
							end
						9: //Loop to draw 1 byte - low 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Green;
									//oSDRAM_Wr_Data2<=`Color_Green;
									//oSDRAM_Wr_Data3<=`Color_Green;
									//oSDRAM_Wr_Data4<=`Color_Green;
								end
						10: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						11: //Loop to draw 1 byte - high 4 bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Color_White):(`Screen_Color_Background);
									oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Color_White):(`Screen_Color_Background);
									//oSDRAM_Wr_Data1<=`Color_Pink;
									//oSDRAM_Wr_Data2<=`Color_Pink;
									//oSDRAM_Wr_Data3<=`Color_Pink;
									//oSDRAM_Wr_Data4<=`Color_Pink;
								end
						12: 
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
						13: //24*12, 24bits/8bits=3bytes. 3 bytes of each column.
							begin 
								if(cnt_bytes==3-1) begin cnt_bytes<=0; i<=i+1'b1; end							
								else begin 
										cnt_bytes<=cnt_bytes+1'b1; 
										i<=8; //Loop to draw next byte of this column.
									end
							end
						14: //repeat 12 times of 3 bytes = 3*12=36 bytes of one 24*12 dot matrx.
							begin
								if(cnt_column==12-1) begin cnt_column<=0; i<=i+1'b1; end		
								else begin 
										cnt_column<=cnt_column+1'b1; 
										i<=2; //Loop to draw one complete digit.
									end
								//since we operate SDRAM four words each time.
								//so the address direction is increasing. 
								//then we should -24 in next column.
								//adjust coordinate: new position: x-24 and y+480.
								oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-24+480; //Next Column.
							end
						15: //xx:xx:xx, we have 8 digits to draw.
							if(select_PulseCounterMux==8-1) begin select_PulseCounterMux<=0; i<=i+1'b1; end
							else begin 
									select_PulseCounterMux<=select_PulseCounterMux+1'b1; 
									i<=1; //Loop to draw next digit.
								end
						16: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						17: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				9: //Other Commands.
					i<=i;
			endcase
		 end
endmodule
