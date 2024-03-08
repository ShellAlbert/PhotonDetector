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

//80MHz/115200bps=694.
//133.333MHz/115200bps=1157
//I changed PLL outputs 88MHz.
//so 88MHz/115200bps=764.
///////////////////////////////////////////
//on Spartan-7, 50MHz/115200bps=434.
reg [31:0] cnt_bps;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_bps<=0;
else if(cnt_bps==434/*764*/ /*694,1157*/)
			cnt_bps<=0;
		else
			cnt_bps<=cnt_bps+1'b1;
			
//we transmit data out at the middle positon of one period to get the most stable state.
//694/2=347.
//1157/2=578.
//764/2=382.
//assign bps_clk=(cnt_bps==347)?1'b1:1'b0;
//assign bps_clk=(cnt_bps==578)?1'b1:1'b0;
//assign bps_clk=(cnt_bps==382)?1'b1:1'b0;
//434/2=217.
assign bps_clk=(cnt_bps==217)?1'b1:1'b0;
endmodule
