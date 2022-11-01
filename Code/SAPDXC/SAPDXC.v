`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:18 10/27/2022 
// Design Name: 
// Module Name:    SAPDXC 
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
////////////////////////////////////////////////////////////////////////////////
//P59,100MHz input.
//RES#(reset, P96)
//D0(SCLK),P102.
//D1(SDIN),P105.
//RES(reset),P96.
//DC(data command),P79.
//CS,P75.
module SAPDXC(
    input clk,
	/*input rst_n,*/
    output cs_n, //Pin-7,CS. 
	output sclk, //Pin-3,D0.
	output dc, //Pin-6,DC. 
	output sdin,//Pin-4,D1.
	output oled_rst //Pin-5,RES#.
    );

wire clk_10MHz;
//Digital Clock Management (like PLL)
//100MHz input clock to 10MHz clock.
Zsy_DCM inst_ZsyDCM (
    .CLKIN_IN(clk), 
    .CLKFX_OUT(clk_10MHz), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(rst_n)
    );
/*
//IP cores are not available in ModelSim.
//100MHz/10MHz/2=5.
reg [2:0] cnt_10MHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_10MHz<=3'd0;
else
begin
	if(cnt_10MHz==3'd5-1)
		cnt_10MHz<=3'd0;
	else
		cnt_10MHz<=cnt_10MHz+1'b1;
end
assign clk_10MHz=(cnt_10MHz==3'd5-1)?1'b1:1'b0;
*/

/*
reg [7:0] cnt_rst;
always @ (posedge clk_10MHz or negedge rst_n)
if(!rst_n)
	cnt_rst<=8'd0;
else
begin
	if(cnt_rst==8'd255)
		cnt_rst<=cnt_rst;
	else
		cnt_rst<=cnt_rst+1'b1;
end
assign rst_n=(cnt_rst==8'd254)?1'b0:1'b1;
*/
	
//led inst_led(.clk(clk_10MHz),.rst_n(rst_n),.led(led));

/*
ZsySPI inst_ZsySPI(
.clk(clk_10MHz),
.rst_n(rst_n),
.cs_n(cs_n),
.sclk(sclk),
.dc(dc),
.sdin(sdin),
.oled_rst(oled_rst));
*/
reg oled_en;
reg [7:0] x;
reg [2:0] y;
reg [3:0] char_addr;
wire oled_done;
Zsy_OLEDModule u1_Zsy_OLEDModule(
	.clk(clk_10MHz),//input, 10MHz.
	.rst_n(rst_n),//input.
	
	.en(oled_en),//input.
	.char_addr(char_addr),//input, char address.
	.x(x),//input,x:0~7.
	.y(y),//input,y:0~7.
	
	.cs_n(cs_n), //output, SPI-CS.
	.sclk(sclk), //output, SPI-SCLK.
	.dc(dc), //output, Data/Command.
	.sdin(sdin), //output, SPI-MOSI.
	.oled_rst(oled_rst), //output, reset.
	.done(oled_done) //output, done.
);

reg [2:0] i;
always @(posedge clk_10MHz or negedge rst_n)
if(!rst_n)	begin
				i<=3'd0;
				oled_en<=1'b0;
				char_addr<=4'd0;
				x<=4'd0;
				y<=3'd0;
			end
else	begin
			case(i)
				3'd0:
					if(oled_done)	begin
										oled_en<=1'b0;
										i<=i+1'b1;
									end
					else	begin
								oled_en<=1'b1;
								char_addr<=4'd0;/*"单",0*/
								x<=8'd0;
								y<=3'd0;
							end
				3'd1:
					if(oled_done)	begin
										oled_en<=1'b0;
										i<=i+1'b1;
									end
					else	begin
								oled_en<=1'b1;
								char_addr<=4'd1;/*"光",0*/
								x<=8'd16;
								y<=3'd0;
							end
				3'd2:
					if(oled_done)	begin
										oled_en<=1'b0;
										i<=i+1'b1;
									end
					else	begin
								oled_en<=1'b1;
								char_addr<=4'd2;/*"子",0*/
								x<=8'd32;
								y<=3'd0;
							end
				3'd3:
					i<=i;
				default:
					i<=i;
			endcase
		end
endmodule

