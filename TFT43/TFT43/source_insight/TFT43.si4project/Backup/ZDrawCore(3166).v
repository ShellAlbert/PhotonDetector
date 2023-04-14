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
	//2: Draw SIN wave.
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
//driven by step i.
reg [15:0] i;
reg [31:0] x_position;
reg [31:0] y_position;
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
									oSDRAM_Wr_Data<=`Color_Yellow;
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
						15: //Draw A Line from (300,100) to (300,600).
							begin 
								oSDRAM_Wr_Addr<=48300-1; //(300,100)=y*width+x=100*480+300=48300.
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
						17: //(300,600)=y*width+x=600*480+300=288300.
							if(oSDRAM_Wr_Addr>=288300-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
						18: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						19: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				2: //Draw SIN wave.
				//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
					case(i)
						0: //Draw A Line from (300,100) to (300,600).
							begin 
								oSDRAM_Wr_Addr<=48300-1; //(300,100)=y*width+x=100*480+300=48300.
								i<=i+1'b1; 
							end
						1:
							if(iSDRAM_Wr_Done) begin 
													oSDRAM_Wr_Req<=0; 
													i<=i+1'b1; 
												end
							else begin 
									oSDRAM_Wr_Req<=1; 
									oSDRAM_Wr_Data<=`Color_Pink;
								end
						2: //(300,600)=y*width+x=600*480+300=288300.
							if(oSDRAM_Wr_Addr>=288300-1) begin i<=i+1; end
							else begin 
									oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
									i<=i-1'b1; //Loop to write next pixel.
								end
					/*
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
							if(cnt_data_SIN==600-1) begin cnt_data_SIN<=0; i<=i+1'b1;end
							else begin 
									cnt_data_SIN<=cnt_data_SIN+1'b1;
									addr_SIN<=addr_SIN+1'b1; 
									
									//x_position<=250+data_SIN; //+xOffset.
									y_position<=y_position+480; //next y.
									i<=1; //Loop to write next pixel.
								end
						*/
						3: //Generate done Signal.
							begin oDraw_Done<=1'b1; i<=i+1'b1; end
						4: //Generate done Signal.
							begin oDraw_Done<=1'b0; i<=0; end
					endcase
				3: //Other Commands.
					i<=i;
			endcase
		 end
endmodule
