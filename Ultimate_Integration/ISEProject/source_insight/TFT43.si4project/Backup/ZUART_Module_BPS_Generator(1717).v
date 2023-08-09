`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:47 02/17/2023 
// Design Name: 
// Module Name:    ZUART_Module_BPS_Generator 
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
module ZUART_Module_BPS_Generator(
    input clk,
    input rst_n,
    input en,
    output bps_clk
    );

//50MHz/115200bps=434.
reg [8:0] cnt_bps;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_bps<=9'd0;
else if(cnt_bps==9'd434)
			cnt_bps<=9'd0;
		else
			cnt_bps<=cnt_bps+1'b1;
			
//we transmit data out at the middle positon of one period to get the most stable state.
//434/2=217
assign bps_clk=(cnt_bps==9'd217)?1'b1:1'b0;
endmodule
