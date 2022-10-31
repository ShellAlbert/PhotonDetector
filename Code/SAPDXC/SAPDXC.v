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
    output cs_n, //Pin-7,CS. 
	output sclk, //Pin-3,D0.
	output dc, //Pin-6,DC. 
	output sdin,//Pin-4,D1.
	output oled_rst //Pin-5,RES#.
    );

wire clk_10MHz;
wire rst_n;
//Digital Clock Management (like PLL)
//100MHz input clock to 10MHz clock.
ZsyDCM inst_ZsyDCM(.CLKIN_IN(clk), 
              .CLKFX_OUT(clk_10MHz),
              .CLKIN_IBUFG_OUT(), 
              .CLK0_OUT(), 
              .LOCKED_OUT(rst_n));
				  
				  
//led inst_led(.clk(clk_10MHz),.rst_n(rst_n),.led(led));

ZsySPI inst_ZsySPI(
.clk(clk_10MHz),
.rst_n(rst_n),
.cs_n(cs_n),
.sclk(sclk),
.dc(dc),
.sdin(sdin),
.oled_rst(oled_rst));

endmodule

