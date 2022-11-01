`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:26 10/31/2022 
// Design Name: 
// Module Name:    Zsy_OLEDModule 
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
module Zsy_OLEDModule(
    input clk, //input, 10MHz.
    input rst_n,
	input en, //input, pull high during operation.
	
	input [3:0] char_addr,//which char we want to display.
	input [7:0] x,   //x coordinate, we use 16x16, so 128/16=8.
	input [2:0] y, //y coordinate, we use 16x16, so 64/16=4.
	
    output cs_n, //output, SPI-CS.
    output sclk, //output, SPI-SCLK
    output dc, //output, Data/Command.
    output sdin, //output, SPI-MOSI.
    output oled_rst, //output, reset.
    
    
    output done //output. 
    );

//output done signal.
reg rdone;

//When the pin is pulled high, the input at D7~D0 is treated as display data. 
//When the pin is pulled low, the input at D7~D0 will be transferred to the command register.
parameter DC_DATA=1'b1;
parameter DC_CMD=1'b0;

//OLED initial register constant values.
reg [7:0] conf_reg_addr;
wire [7:0] conf_reg_data;
reg dc_reg;
wire dc_reg2;

ZsyOledRegsData inst_ZsyOledRegsData(
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
				rdone<=1'b0;
			end
else if(en)	begin
				case(i)
				5'd0,5'd1,5'd2,5'd3,5'd4: //reserved 5 clock period to reset OLED.
					begin 
						i<=i+1'b1;
						conf_reg_addr<=8'd0;
						iPage<=4'd0;
						rdone<=1'b0;
					end
				5'd5: //configure ALL registers.
					if(tx_done) begin 
									tx_en<=1'b0;
									if(conf_reg_addr==8'd28) //All done.
										i<=i+1'b1;
									else 
										conf_reg_addr<=conf_reg_addr+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								tx_data<=conf_reg_data;
								dc_reg<=dc_reg2;
							end
				5'd6:begin //clear screen: Set Page address.(0~7)
						if(tx_done) begin
										tx_en<=1'b0;
										i<=i+1'b1;
									end
						else	begin
									tx_en<=1'b1;
									tx_data<=8'hb0+iPage;  //page 0,1,2,3,4,5,6,7.
									dc_reg<=DC_CMD;
								end
					 end
				5'd7:begin //clear screen: Set display position column address(low byte).
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
				5'd8:begin //clear screen: Set display position column address(high byte).
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
				5'd9:begin //Clear Screen: Fill all columns(0~127) of pages(0~7) with zero.
						if(tx_done)	begin
										tx_en<=1'b0;
										if(iCol==8'd128)
											i<=i+1'b1;
										else
											iCol<=iCol+1'b1; //increase column address.
										end
						else begin
								tx_en<=1'b1;
								tx_data<=8'h00; //write 0 to GRAM.
								dc_reg<=DC_DATA;
							 end
						end
				5'd10:begin //repeat all 7 pages to clear entire screen.
						if(iPage==4'd7)
							i<=i+1'b1;
						else begin
								iPage<=iPage+1'b1; //next page.
								i<=4'd6; //repeat.
							 end
						end
				5'd11: //set y Position(0,y) x=0~127, y=0~7.
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
				5'd12: //set high byte of x Position(x,0) x=0~127, y=0~7.
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
				5'd13: //set low byte of x Position(x,0) x=0~127, y=0~7.
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
				5'd14://tx Top Half data out, OLED will show it at (x,y). //128bit/8bit=16.
						if(tx_done)	begin
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
				5'd15: //set y Position(0,y) x=0~127, y=0~7.
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
				5'd16: //set high byte of x Position(x,0) x=0~127, y=0~7.
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
				5'd17: //set low byte of x Position(x,0) x=0~127, y=0~7.
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
				5'd18://tx Top Half data out, OLED will show it at (x,y). //128bit/8bit=16.
						if(tx_done)	begin
										tx_en<=1'b0;
										if(cnt_byte==5'd16)	begin
																i<=i+1'b1;
																rdone<=1'b1;
															end
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
				5'd19:
					begin
						i<=5'd11; //initial only once, so here jump to 5'd11.
						rdone<=1'b0;
					end
				default:
					i<=i;
			endcase
		end
	else	begin
				tx_data<=8'd0;
				tx_en<=1'b0;
				rdone<=1'b0;
			end
		
//RESET# OLED.
assign oled_rst=(i>2)?1'b1:1'b0;

assign done=rdone;

endmodule
