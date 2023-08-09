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
	input [3:0] iCmd,
	output reg oDraw_Done, //output, indicate draw done.

	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.
    output reg oSDRAM_Wr_Req, //output, SDRAM write request.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );
 
//M9K=9*1024bits=9216bits.
//120 Samples*7-bits *2 periods =840bits *2 periods =1680 bits.
reg [9:0] addr_SIN;
wire [6:0] data_SIN;
reg [9:0] cnt_data_SIN;
reg [9:0] cnt_SIN_Shift;
ZM9K_SIN ic_M9K_SIN_Wave (
  .clka(clk), // input clka
  .addra(addr_SIN), // input [9 : 0] addra
  .douta(data_SIN) // output [6 : 0] douta
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
//ZiMo 32x32.
reg [10:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
reg [7:0] cnt_8bits;
reg [7:0] cnt_3bytes; //Font Matrix, 24*12, 24bits/8bits=3bytes.
reg [7:0] cnt_12repeat; //column 12 repeat times.
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

			//ZiMo 32x32.
			addr_ZiMo3232<=0;
			cnt_addr_ZiMo3232<=0;
			select_RTCMux<=0;
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
							if(oSDRAM_Wr_Addr==384000-1) begin 
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
							if(oSDRAM_Wr_Addr==5270-1) begin i<=i+1; end
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
							if(oSDRAM_Wr_Addr==379670-1) begin i<=i+1; end
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
							if(oSDRAM_Wr_Addr==379210-1) begin i<=i+1; end
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
							if(oSDRAM_Wr_Addr==379670-1) begin i<=i+1; end
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
							if(oSDRAM_Wr_Addr==379440-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
/////////////////////////////////////////////////////////////////////////////////////////////////////////
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						15: //Draw A Line from (250,100) to (250,700).
							begin 
								oSDRAM_Wr_Addr<=48250-1; //(250,100)=y*width+x=100*480+250=48250.
								i<=i+1'b1; 
							end
						16:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						17: //(250,700)=y*width+x=700*480+250=336250.
							if(oSDRAM_Wr_Addr>=336250-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						18: //Draw A Line from (378,100) to (378,700).
							begin 
								oSDRAM_Wr_Addr<=48378-1; //(250,100)=y*width+x=100*480+378=48378.
								i<=i+1'b1; 
							end
						19:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						20: //(378,700)=y*width+x=700*480+378=336378.
							if(oSDRAM_Wr_Addr>=336378-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						21: //Draw A Line from (250,100) to (378,100).
							begin 
								oSDRAM_Wr_Addr<=48250-1; //(250,100)=y*width+x=100*480+250=48250.
								i<=i+1'b1; 
							end
						22:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						23: //(378,100)=y*width+x=100*480+378=48378.
							if(oSDRAM_Wr_Addr>=48378-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						24: //Draw A Line from (250,700) to (378,700).
							begin 
								oSDRAM_Wr_Addr<=336250-1; //(250,700)=y*width+x=700*480+250=336250.
								i<=i+1'b1; 
							end
						25:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						26: //(378,700)=y*width+x=700*480+378=336378.
							if(oSDRAM_Wr_Addr>=336378-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1; 
									i<=i-1'b1; //Loop to write next pixel.
								end
/////////////////////////////////////////////////////////////////////////////////////////////////////////
						27: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						28: //Generate done Signal.
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
								cnt_12repeat<=0;
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
							if(cnt_12repeat==12-1) begin 
													cnt_12repeat<=0; 
													oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+504; //Next Column.
													i<=i+1'b1; 
												end
							else begin 
									cnt_12repeat<=cnt_12repeat+1'b1; 
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
				//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
					case(i)
						0: //Calculate SDRAM plain address.
							begin 
								//Plain xOffset=250.
								//Plain yOffset=100*480=48000.
								x_position<=250+data_SIN; //+xOffset.
								y_position<=48000;
								i<=i+1'b1; 
							end
						1: 
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
													addr_SIN<=0;
													i<=i+1'b1;
												end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									addr_SIN<=addr_SIN+1'b1; 
									
									x_position<=250+data_SIN; //+xOffset.
									y_position<=y_position+480; //next y.
									i<=1; //Loop to write next pixel.
								end
						4: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						5: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				4: //Other Commands.
					i<=i;
			endcase
		 end
endmodule
