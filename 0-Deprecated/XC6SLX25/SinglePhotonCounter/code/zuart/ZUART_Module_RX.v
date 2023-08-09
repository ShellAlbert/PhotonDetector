`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:36 02/17/2023 
// Design Name: 
// Module Name:    ZUART_Module_RX 
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
module ZUART_Module_RX(
    input clk,
    input rst_n,
    input en,
    input rx_pin,
    output [7:0] rx_data,
    output done
    );

reg [7:0] rx_data;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	rx_data<=8'd0;
else
	rx_data<=8'd1;
endmodule
