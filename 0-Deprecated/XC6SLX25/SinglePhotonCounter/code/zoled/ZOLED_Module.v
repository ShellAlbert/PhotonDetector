`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:26 10/31/2022 
// Design Name: 
// Module Name:    ZOLED_Module 
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
`include "ZOLED_CmdList.v"

module ZOLED_Module(
    input clk, //input, 10MHz.
    input rst_n,
	input en, //input, pull high during operation.
	
	// cmd=0: initial OLED.
	// cmd=1: clear entire screen.
	// cmd=2: write  GRAM.
	// cmd=3: clear the entire line-2. (16x16).
	input [3:0] cmd, //input, command input.
	
	input [4:0] char_addr,//which char we want to display.
	input [7:0] x,   //x coordinate, we use 16x16, so 128/16=8.
	input [2:0] y, //y coordinate, we use 16x16, so 64/16=4.
	
    output cs_n, //output, SPI-CS.
    output sclk, //output, SPI-SCLK
    output dc, //output, Data/Command.
    output sdin, //output, SPI-MOSI.
    output oled_rst, //output, reset.
    
    
    output done //output. 
    );

//output to reset# OLED.
reg roled_rst;
assign oled_rst=roled_rst;

//output to indicate done signal.
reg rdone;
assign done=rdone;

//When the pin is pulled high, the input at D7~D0 is treated as display data. 
//When the pin is pulled low, the input at D7~D0 will be transferred to the command register.
parameter DC_DATA=1'b1;
parameter DC_CMD=1'b0;

//OLED initial register constant values.
reg [7:0] conf_reg_addr;
wire [7:0] conf_reg_data;
reg dc_reg;
wire dc_reg2;

ZsyCfgRegsData inst_ZsyCfgRegsData(
    .clk(clk), //input,10MHz.
    .rst_n(rst_n), //input 
	.addr(conf_reg_addr),//input
    .data(conf_reg_data), //output
    .dc_flag(dc_reg2)); //output

//SPI Tx One Byte module.
reg tx_en;
reg [7:0] tx_data;
wire tx_done;

ZsySPI_TxByte inst_ZsySPI_TxByte(
.clk(clk), //input,10MHz.
.rst_n(rst_n), //input 
.en(tx_en), //input
.txByte(tx_data),//input 
.dc_flag(dc_reg), //input 
.cs_n(cs_n), //output
.sclk(sclk), //output
.dc(dc), //output
.sdin(sdin), //output
.isDone(tx_done) //output
);


//Fetch Dot Matrix data.
wire [127:0] dotMatrix_data_top;
wire [127:0] dotMatrix_data_btm;

reg [127:0] rdotMatrix_data_top;
reg [127:0] rdotMatrix_data_btm;
reg [4:0] cnt_byte; 

//Fetch Dot Matrix data.
ZsyDotMatrix inst_ZsyDotMatrix(
.clk(clk),
.rst_n(rst_n),
.addr(char_addr), //input, which char we want to fetch.
.data_top(dotMatrix_data_top), //output, top half dot matrix data.
.data_btm(dotMatrix_data_btm)); //output, bottom half dot matrix data.


//page counter: 0~7.
reg [3:0] iPage;
//column counter:0~128.
reg [7:0] iCol;
//driven by step i.
reg [4:0] i;

always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				tx_en<=1'b0;
				conf_reg_addr<=8'd0;
				iCol<=8'd0;	
				iPage<=4'd0;
				cnt_byte<=5'd0;
				roled_rst<=1'b0;
				rdone<=1'b0;
			end
else if(en)	begin
				case(cmd)
					`CMD_INIT_REGS:	begin //Configure All registers of OLED before operating.
										case(i)
											5'd0,5'd1,5'd2,5'd3,5'd4:begin //reserved 5 clock period to reset OLED.
													i<=i+1'b1;
													conf_reg_addr<=8'd0;
													iPage<=4'd0;
													roled_rst<=1'b0;
													rdone<=1'b0;
												end
											5'd5,5'd6,5'd7,5'd8,5'd9:begin //reserved 5 clock period to reset OLED.
													i<=i+1'b1;
													roled_rst<=1'b1;
												end
											5'd10:begin //configure ALL registers.
													if(tx_done) 	begin 
																		tx_en<=1'b0;
																		if(conf_reg_addr==8'd28) //All done,28 registers need to be configured.
																			i<=i+1'b1;
																		else
																			conf_reg_addr<=conf_reg_addr+1'b1;
																	end
													else	begin
																tx_en<=1'b1;
																tx_data<=conf_reg_data;
																dc_reg<=dc_reg2;
															end
												end
											5'd11:begin
													rdone<=1'b1;
													i<=i+1'b1;
												end
											5'd12:begin
													rdone<=1'b0;
													i<=1'b0;
												end
											default:
												i<=1'b0;
										endcase
									end
					`CMD_CLS_GRAM:	begin //clear entire GRAM. (fill entire screen with zeros).
										case(i)
											5'd0:begin //clear screen: Set Page address.(0~7)
													if(tx_done) 	begin
																		tx_en<=1'b0;
																		i<=i+1'b1;
																	end
													else	begin
																tx_en<=1'b1;
																tx_data<=8'hb0+iPage;  //page 0,1,2,3,4,5,6,7.
																dc_reg<=DC_CMD;
															end
												 end
											5'd1:begin //clear screen: Set display position column address(low byte).
													if(tx_done) 	begin
																		tx_en<=1'b0;
																		i<=i+1'b1;
																	end
													else	begin
																tx_en<=1'b1;
																tx_data<=8'h00;  //low byte address.
																dc_reg<=DC_CMD;
															end
												 end
											5'd2:begin //clear screen: Set display position column address(high byte).
													if(tx_done) 	begin
																	tx_en<=1'b0;
																	i<=i+1'b1;
																		
																	//init Column counter.
																	iCol<=8'd0;	
																end
													else 	begin
																tx_en<=1'b1;
																tx_data<=8'h10;  //high byte address.
																dc_reg<=DC_CMD;
															end
												 end
											5'd3:begin //Clear Screen: Fill all columns(0~127) of pages(0~7) with zero.
													if(tx_done)	begin
																	tx_en<=1'b0;
																	if(iCol==8'd128) //All 0~127(128) pages were processed.
																		i<=i+1'b1;
																	else
																		iCol<=iCol+1'b1; //increase column address.
																end
													else	begin
																tx_en<=1'b1;
																tx_data<=8'h00; //write 0(empty) to GRAM.
																dc_reg<=DC_DATA;
															end
												end
											5'd4:begin //repeat all 7 pages to clear entire screen.
													if(iPage==4'd7)
														i<=i+1'b1;
													else	begin
																iPage<=iPage+1'b1; //next page.
																i<=5'd0; //repeat.
															end
												end
											5'd5:begin
													rdone<=1'b1;
													i<=i+1'b1;
												end
											5'd6:begin
													rdone<=1'b0;
													i<=5'd0;
												end
											default:
												i<=5'd0;
										endcase
									end
					`CMD_CLS_LINE1:	begin
									end
					`CMD_CLS_LINE2:	begin
									end
					`CMD_CLS_LINE3:	begin
									end
					`CMD_CLS_LINE4:	begin
									end
					`CMD_WR_GRAM:	begin //write data at(x,y).
										case(i)
										5'd0:begin //set y Position(0,y) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=8'hb0+y;
															tx_data<=8'hb0+y; //(,y). //y:0~7.
															dc_reg<=DC_CMD;
														end
											end
										5'd1:begin //set high byte of x Position(x,0) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=((x&8'hf0)>>4)|8'h10;
															tx_data<=((x&8'hf0)>>4)|8'h10; //(x,) high byte of x.
															dc_reg<=DC_CMD;
														end			
											end
										5'd2:begin //set low byte of x Position(x,0) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
																
																//initial byte counter to 0.
																cnt_byte<=5'd0;
																rdotMatrix_data_top<=dotMatrix_data_top;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=((x&8'h0f)|8'h0f);
															tx_data<=((x&8'h0f)|8'h01); //(x,) low byte of x.
															dc_reg<=DC_CMD;
														end
											end
//since we use 16x16 dot matrix, but OLED is separated by 8 pages. So one page is 64/8=8 lines.
//So one char should be displayed twice, and split into two parts, top-half part and bottom-half part.
//The top part is 16x8.
//The bottom part is 16x8.
										5'd3:begin //tx Top Half data out, OLED will show it at (x,y). //128bit/8bit=16.
												if(tx_done)		begin
																	tx_en<=1'b0;
																	if(cnt_byte==5'd16)	begin
																							cnt_byte<=5'd0; 
																							rdotMatrix_data_btm<=dotMatrix_data_btm;
																							i<=i+1'b1;
																						end
																	else	begin
																				cnt_byte<=cnt_byte+5'd1;
																				rdotMatrix_data_top<=rdotMatrix_data_top<<8;//left shift.
																			end
																end
												else	begin
															tx_data<=rdotMatrix_data_top[127:120];
															dc_reg<=DC_DATA;
															tx_en<=1'b1;
														end
											end
										5'd4:begin //set y Position(0,y) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=8'hb0+y;
															tx_data<=8'hb0+1'b1+y; //(,y). //y:0~7.
															dc_reg<=DC_CMD;
														end
											end
										5'd5:begin //set high byte of x Position(x,0) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=((x&8'hf0)>>4)|8'h10;
															tx_data<=((x&8'hf0)>>4)|8'h10; //(x,) high byte of x.
															dc_reg<=DC_CMD;
														end
											end
										5'd6:begin //set low byte of x Position(x,0) x=0~127, y=0~7.
												if(tx_done)	begin
																tx_en<=1'b0;
																i<=i+1'b1;
																
																//initial byte counter to 0.
																cnt_byte<=5'd0;
																rdotMatrix_data_top<=dotMatrix_data_top;
															end
												else	begin
															tx_en<=1'b1;
															//txData<=((x&8'h0f)|8'h0f);
															tx_data<=((x&8'h0f)|8'h01); //(x,) low byte of x.
															dc_reg<=DC_CMD;
														end
											end
										5'd7:begin //tx bottom Half data out, OLED will show it at (x,y).
												if(tx_done)	begin
																tx_en<=1'b0;
																if(cnt_byte==5'd16)
																	i<=i+1'b1;
																else	begin
																			cnt_byte<=cnt_byte+5'd1;
																			rdotMatrix_data_btm<=rdotMatrix_data_btm<<8;//left shift.
																		end
															end
												else	begin
															tx_data<=rdotMatrix_data_btm[127:120];
															dc_reg<=DC_DATA;
															tx_en<=1'b1;
														end
											end
										5'd8:begin
												rdone<=1'b1;
												i<=i+1'b1;
											end
										5'd9:begin
												rdone<=1'b0;
												i<=5'd0;
											end
										default:
											i<=5'd0;
										endcase //CMD_WR_GRAM.
									end
					default:	begin
								end
				endcase
			end
	else	begin
				i<=1'b0;
				
				tx_data<=8'd0;
				tx_en<=1'b0;
				rdone<=1'b0;
				
				roled_rst<=1'b1;
			end
endmodule
