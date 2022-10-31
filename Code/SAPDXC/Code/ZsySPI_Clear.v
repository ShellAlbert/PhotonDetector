`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:11 10/28/2022 
// Design Name: 
// Module Name:    ZsySPI_Clear 
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
module ZsySPI_ClearScreenRegSet(
    input clk,
    input rst_n,
    input [7:0] reg_addr,
    output [7:0] reg_data
    );

always @ (posedge clk or negedge rst_n)
if(!rst_n) 
	reg_data<=8'd0;
else case(reg_addr)
		
	 endcase
endmodule
