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
module ZDrawCore(
    input clk,
    input rst_n,
    input en,

	//0: Clear Screen.
	//1: Draw Fixed Pixel Image.
	//2: Draw RTC.
	//3: Draw SIN wave.
	//4: Draw GongPinTongBu and GuangZiMaiChong.
	//5. Draw A New Photon Counter. iData1=New Photon Counter.
	//6. Draw Random Histogram.
	input [3:0] iCmd,
	input [31:0] iData1,
	output reg oDraw_Done, //output, indicate draw done.

	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.
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
reg [10:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
reg [7:0] cnt_8bits;
reg [7:0] cnt_3bytes; //Font Matrix, 24*12, 24bits/8bits=3bytes.
reg [7:0] cnt_4bytes; //Font Matrix, 32*32, 32bits/8bits=4bytes.
reg [7:0] cnt_bytes; //column 12 repeat times.
reg [7:0] cnt_column;
M9K_ZiMo3232 ic_M9K_ZiMo3232 (
  .a(addr_ZiMo3232), // input [10 : 0] a
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
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data<=0;
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
			
		end
else if(en) begin
			case(iCmd)
				0: //Clear Screen.
					case(i)
						0: //Clear Screen: Set start address.
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
									oSDRAM_Wr_Data<=`Color_Black;
									//oSDRAM_Wr_Data<=16'h1986;
								end
						2: //Clear Screen: 480*800=384000.
							if(oSDRAM_Wr_Addr>=384000-1) begin 
															oSDRAM_Wr_Addr<=0; 
															i<=i+1'b1; 
														end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
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
									oSDRAM_Wr_Data<=`Color_Green;
								end
						2: //(470,10)=y*width+x=10*480+470=5270.
							if(oSDRAM_Wr_Addr>=5270-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
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
									oSDRAM_Wr_Data<=`Color_Green;
								end
						5: //(470,790)=y*width+x=790*480+470=379670.
							if(oSDRAM_Wr_Addr>=379670-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
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
									oSDRAM_Wr_Data<=`Color_Green;
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
									oSDRAM_Wr_Data<=`Color_Green;
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
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						14: //(240,790)=y*width+x=790*480+240=379440.
							if(oSDRAM_Wr_Addr>=379440-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
/////////////////////////////////////////////////////////////////////////////////////////////////////////
						//Draw SIN wave in rectangle (250,20)-(250+128,20+600)=(378,620).
						15: //Draw A Line from (250,20) to (250,620).
							begin 
								oSDRAM_Wr_Addr<=9850-1; //(250,20)=y*width+x=20*480+250=9850.
								i<=i+1'b1; 
							end
						16:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						17: //(250,620)=y*width+x=620*480+250=297850.
							if(oSDRAM_Wr_Addr>=297850-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,20)-(250+128,20+600)=(378,620).
						18: //Draw A Line from (378,20) to (378,620).
							begin 
								oSDRAM_Wr_Addr<=9978-1; //(378,20)=y*width+x=20*480+378=9978.
								i<=i+1'b1; 
							end
						19:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						20: //(378,620)=y*width+x=620*480+378=297978.
							if(oSDRAM_Wr_Addr>=297978-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						21: //Draw A Line from (250,20) to (378,20).
							begin 
								oSDRAM_Wr_Addr<=9850-1; //(250,20)=y*width+x=20*480+250=9850.
								i<=i+1'b1; 
							end
						22:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						23: //(378,20)=y*width+x=20*480+378=9978.
							if(oSDRAM_Wr_Addr>=9978-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,20)-(250+128,20+600)=(378,620).
						24: //Draw A Line from (250,620) to (378,620).
							begin 
								oSDRAM_Wr_Addr<=297850-1; //(250,620)=y*width+x=620*480+250=297850.
								i<=i+1'b1; 
							end
						25:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						26: //(378,620)=y*width+x=620*480+378=297978.
							if(oSDRAM_Wr_Addr>=297978-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1; 
									i<=i-1'b1; //Loop to write next pixel.
								end
/////////////////////////////////////////////////////////////////////////////////////////////////////////
						//Draw Histogram Rectangle.
						//(16,20)-(16+204,20+600)=(220,620).
						27: //Draw A Line from (16,20) to (16,620).
							begin 
								oSDRAM_Wr_Addr<=9616-1; //(16,20)=y*width+x=20*480+16=9616.
								i<=i+1'b1; 
							end
						28:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Yellow;
								end
						29: //(16,620)=y*width+x=620*480+16=297616.
							if(oSDRAM_Wr_Addr>=297616-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
/////////////////////////////////////////////////////////////////////////////////////////////////////////
						30: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						31: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				2: //2. Draw RTC.
				//23:59:59  Font Size: 24*12.
				//Clear the area before writing.
				//(x1,y1)=(464-24,680) (x2,y2)=(464,680+8*12)=(464,776).
				//(464,680) - (440-1,776-1)
					case(i)
						0: //set start address.(464,680)=y*width+x=680*480+464=326864.
							begin
								oSDRAM_Wr_Addr<=326864-1;
								select_RTCMux<=4'd0; //xx:xx:xx
								i<=i+1'b1;
							end
						1: //Update ZiMo address for next digit.
							begin 
								//choose 0~9 ZiMo Offset Value.
								addr_ZiMo3232<=dout_RTC_ZiMo_Addr; //0~9.
								
								//reset counter.
								cnt_8bits<=0;
								cnt_3bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: 
							begin pixel_data<=data_ZiMo3232; i<=i+1'b1; end
						3: //Loop to draw 8bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data<=(pixel_data&8'h01)?(`Color_Green):(`Color_Black);
									//oSDRAM_Wr_Data<=`Color_Green;
								end
						4: 
							if(cnt_8bits==8-1) begin 
												cnt_8bits<=0; 
												//Next SDRAM address. (Next Row/X).
												oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;		
												i<=i+1'b1; 
											end							
							else begin 
									cnt_8bits<=cnt_8bits+1'b1; //Next bit.
									pixel_data<=pixel_data>>1; //Right Shift 1bit.
									//Next SDRAM address. (Next Row/X).
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;				
									i<=3; //Loop.
								end
						5: //24*12, 24bits/8bits=3bytes. 3 bytes of each column.
							if(cnt_3bytes==3-1) begin 
												cnt_3bytes<=0; 
												addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
												i<=i+1'b1; 
											end				
							else begin 
									cnt_3bytes<=cnt_3bytes+1'b1; 
									addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
									i<=2; //Loop to draw one complete column.
								end
						6: //repeat 12 times of 3 bytes = 12*3=36 bytes of one 24*12 digit.
							if(cnt_column==12-1) begin 
													cnt_column<=0; 
													oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+504; //Next Column.
													i<=i+1'b1; 
												end
							else begin 
									cnt_column<=cnt_column+1'b1; 
									//adjust coordinate: new position: x+24 and y+480=480+24=504
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+504; //Next Column.
									i<=2; //Loop to draw one complete digit.
								end
						7: //xx:xx:xx, we have 8 digits to draw.
							if(select_RTCMux==4'd8-1) begin select_RTCMux<=4'd0; i<=i+1'b1; end
							else begin 
									select_RTCMux<=select_RTCMux+1'b1; 
									i<=1; //Loop to draw next digit.
								end
						8: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						9: //Generate done Signal.
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
								//Plain xOffset=208.
								//Plain yOffset=20*480=9600.
								x_position<=250-5+data_SIN; //+xOffset.
								y_position<=9600;
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
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						3: //draw x+1 to make it looks bold.
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1; i<=i+1'b1; end
						4: 
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						5: //x-1.
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1; i<=i+1'b1; end
						6: 
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						7: //y+1.
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; i<=i+1'b1; end
						8:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						9: //y-1.
							begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-480; i<=i+1'b1; end
						10:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						11: //120 points single period, 5 periods*120 points=600.
							if(cnt_data_SIN==600-1) begin 
													cnt_data_SIN<=0; 
													addr_SIN<=0;
													i<=i+1'b1;
												end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									addr_SIN<=addr_SIN+1'b1; 
									
									x_position<=250-5+data_SIN; //+xOffset.
									y_position<=y_position+480; //next y.
									i<=1; //Loop to write next pixel.
								end
						12: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						13: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				4: //4: Draw GongPinTongBu and GuangZiMaiChong.
					case(i)
						0:
							begin which_dot_matrix<=0; i<=i+1'b1; end
						1:
							begin
								case(which_dot_matrix)
									0: //Gong.
										begin 
											addr_ZiMo3232<=0; //offset of Gong.
											//(468,12)
											//468-32=436, 12+32=44. =>(436,44)
											//addr=y*width+x=12*480+468=6228.
											oSDRAM_Wr_Addr<=6228-1;
										end
									1: //Pin.
										begin 
											addr_ZiMo3232<=128; //offset of Pin.
											//(468,44)
											//468-32=436, 44+32=76. =>(436,76)
											//addr=y*width+x=44*480+468=21588.
											oSDRAM_Wr_Addr<=21588-1;
										end
									2: //Tong.
										begin 
											addr_ZiMo3232<=256; //offset of Gong.
											//(468,76)
											//468-32=436, 76+32=108. =>(436,108)
											//addr=y*width+x=76*480+468=36948.
											oSDRAM_Wr_Addr<=36948-1;
										end
									3: //Bu.
										begin 
											addr_ZiMo3232<=384; //offset of Gong.
											//(468,108)
											//468-32=436, 108+32=140. =>(436,140)
											//addr=y*width+x=108*480+468=52308.
											oSDRAM_Wr_Addr<=52308-1;
										end
									4: //Guang.
										begin 
											addr_ZiMo3232<=512; //offset of Guang.
											//(238,12)
											//238-32=206, 12+32=44. =>(206,44)
											//addr=y*width+x=12*480+238=5998.
											oSDRAM_Wr_Addr<=5998-1;
										end
									5: //Zi.
										begin 
											addr_ZiMo3232<=640; //offset of Zi.
											//(238,44)
											//238-32=206, 44+32=76. =>(206,76)
											//addr=y*width+x=44*480+238=21358.
											oSDRAM_Wr_Addr<=21358-1;
										end
									6: //Mai.
										begin 
											addr_ZiMo3232<=768; //offset of Mai.
											//(238,76)
											//238-32=206, 76+32=108. =>(238,108)
											//addr=y*width+x=76*480+238=36718.
											oSDRAM_Wr_Addr<=36718-1;
										end
									7: //Chong.
										begin 
											//addr_ZiMo3232<=896; //offset of Chong.
											addr_ZiMo3232<=768; 
											//(238,108)
											//238-32=206, 108+32=140. =>(238,140)
											//addr=y*width+x=108*480+238=52078.
											oSDRAM_Wr_Addr<=52078-1;
										end
								endcase
								
								//reset counter.
								cnt_8bits<=0;
								cnt_bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2:
							begin pixel_data<=data_ZiMo3232; i<=i+1'b1; end
						3: //Loop to draw 8bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data<=(pixel_data&8'h01)?(`Color_Green):(`Color_Black);
									//oSDRAM_Wr_Data<=`Color_Green;
								end
						4: 
							if(cnt_8bits==8-1) begin 
												cnt_8bits<=0; 
												//Next SDRAM address. (Next Row/X).
												oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;		
												i<=i+1'b1; 
											end							
							else begin 
									cnt_8bits<=cnt_8bits+1'b1; //Next bit.
									pixel_data<=pixel_data>>1; //Right Shift 1bit.
									//Next SDRAM address. (Next Row/X).
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;				
									i<=3; //Loop to draw next point.
								end
						5: //32*32, 32bits/8bits=4bytes. 4 bytes of each column.
							if(cnt_bytes==4-1) begin 
												cnt_bytes<=0; 
												addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
												i<=i+1'b1; 
											end				
							else begin 
									cnt_bytes<=cnt_bytes+1'b1; 
									addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
									i<=2; //Loop to draw one complete column.
								end
						6: //repeat 32 times of 4 bytes = 32*4=128 bytes of one 32*32 dot matrx.
							if(cnt_column==32-1) begin 
													cnt_column<=0; 
													oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+512; //Next Column.
													i<=i+1'b1; 
												end
							else begin 
									cnt_column<=cnt_column+1'b1; 
									//adjust coordinate: new position: x+32 and y+480=480+32=512
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+512; //Next Column.
									i<=2; //Loop to draw one complete digit.
								end
						7:
							if(which_dot_matrix==7) begin which_dot_matrix<=0;i<=i+1'b1; end
							else begin 
									which_dot_matrix<=which_dot_matrix+1'b1; 
									i<=1; //Loop to draw Next dot matrix.
								end
						8: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						9: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				5: //5. Draw A New Photon Counter. iData1=New Photon Counter.
				//99999999  Font Size: 24*12.
				//(x1,y1)=(234-24,680) (x2,y2)=(234,680+8*12)=(234,776).
				//(234,680) - (210-1,776-1)
					case(i)
						0: //set start address.(234,680)=y*width+x=680*480+234=326634.
							begin
								oSDRAM_Wr_Addr<=326634-1;
								PulseCounter<=iData1;
								select_PulseCounterMux<=4'd0; //99999999.
								i<=i+1'b1;
							end
						1: //Update ZiMo address for next digit.
							begin 
								//choose 0~9 ZiMo Offset Value.
								addr_ZiMo3232<=dout_PulseCounter_ZiMo_Addr; //0~9.
								
								//reset counter.
								cnt_8bits<=0;
								cnt_3bytes<=0;
								cnt_column<=0;
								i<=i+1'b1;
							end
						2: 
							begin pixel_data<=data_ZiMo3232; i<=i+1'b1; end
						3: //Loop to draw 8bits.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			 
							else begin 
									oSDRAM_Wr_Req<=1; 
									//Pink: Foreground Color.
									//Black: Background Color.
									oSDRAM_Wr_Data<=(pixel_data&8'h01)?(`Color_Green):(`Color_Black);
									//oSDRAM_Wr_Data<=`Color_Green;
								end
						4: 
							if(cnt_8bits==8-1) begin 
												cnt_8bits<=0; 
												//Next SDRAM address. (Next Row/X).
												oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;		
												i<=i+1'b1; 
											end							
							else begin 
									cnt_8bits<=cnt_8bits+1'b1; //Next bit.
									pixel_data<=pixel_data>>1; //Right Shift 1bit.
									//Next SDRAM address. (Next Row/X).
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-1'b1;				
									i<=3; //Loop.
								end
						5: //24*12, 24bits/8bits=3bytes. 3 bytes of each column.
							if(cnt_3bytes==3-1) begin 
												cnt_3bytes<=0; 
												addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
												i<=i+1'b1; 
											end				
							else begin 
									cnt_3bytes<=cnt_3bytes+1'b1; 
									addr_ZiMo3232<=addr_ZiMo3232+1'b1; 
									i<=2; //Loop to draw one complete column.
								end
						6: //repeat 12 times of 3 bytes = 12*3=36 bytes of one 24*12 digit.
							if(cnt_column==12-1) begin 
													cnt_column<=0; 
													oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+504; //Next Column.
													i<=i+1'b1; 
												end
							else begin 
									cnt_column<=cnt_column+1'b1; 
									//adjust coordinate: new position: x+24 and y+480=480+24=504
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+504; //Next Column.
									i<=2; //Loop to draw one complete digit.
								end
						7: //99999999, we have 8 digits to draw.
							if(select_PulseCounterMux==4'd8-1) begin select_PulseCounterMux<=4'd0; i<=i+1'b1; end
							else begin 
									select_PulseCounterMux<=select_PulseCounterMux+1'b1; 
									i<=1; //Loop to draw next digit.
								end
						8: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						9: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				/*
				//Single Period SIN wave is 120 points. 5Period*120=600 points.
				//SDRAM Space Assignment
				//0~383999: (480*800-1): LCD GRAM. 
				//384000~384599: (384000+600-1): Photon Counter.
					case(i)
						0: //write new photon counter to SDRAM.
							if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end			 
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Addr<=addr_photon_counter; 
									oSDRAM_Wr_Data<=iData1; //New Photon Counter.
								end
						1: //Loop to write.
							begin
								if(addr_photon_counter>=(384000+600-1)) 
									addr_photon_counter<=384000;
								else 
									addr_photon_counter<=addr_photon_counter+1'b1;
								/////////////////////////////////
								i<=i+1'b1;
							end
						2: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						3: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				*/
				6: //Draw Random Histogram.
				//Single Period SIN wave is 120 points,.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw Random Histogram in rectangle (15,20)-(15+220,20+600)=(235,620).
					case(i)
						0: //Calculate SDRAM plain address.
							begin 
								//Plain xOffset=208.
								//Plain yOffset=20*480=9600.
								x_position<=20-5+220;//data_Random; //+xOffset.
								y_position<=9600;
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
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						3: //120 points single period, 5 periods*120 points=600.
							if(cnt_data_SIN==600-1) begin 
													cnt_data_SIN<=0; 
													addr_Random<=0;
													i<=i+1'b1;
												end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									addr_Random<=addr_Random+1'b1; 
									
									x_position<=20-5+220;//data_Random; //+xOffset.
									y_position<=y_position+480; //next y.
									i<=1; //Loop to write next pixel.
								end
						4: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						5: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				7: //Other Commands.
					i<=i;
			endcase
		 end
endmodule
