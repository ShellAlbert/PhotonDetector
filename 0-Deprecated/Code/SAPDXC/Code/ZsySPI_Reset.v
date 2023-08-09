`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:58 10/28/2022 
// Design Name: 
// Module Name:    ZsySPI_Reset 
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
module ZsySPI_Reset(
    input clk,
    input rst_n,
    output reg reset,
	output reg isDone
    );

reg [7:0] counter;
always @(posedge clk or negedge rst_n)
if(!rst_n) 	begin
				reset<=1'b0;
				counter<=8'd0;
				isDone<=1'b0;
			end
else if(counter==8'd254) 
			isDone<=1'b1;
else if(counter==8'd255) 
			isDone<=1'b0;
else	
	counter<=counter+1'b1;
								
endmodule
