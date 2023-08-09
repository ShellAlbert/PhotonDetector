`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:41 04/06/2023 
// Design Name: 
// Module Name:    ZExSignalSync 
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
module ZExSignalSync(
    input clk,
    input rst_n,
    input sig_in,
    output sig_out
    );

reg sig_delay1;
reg sig_delay2;

always@(posedge clk or negedge rst_n)
if(!rst_n) begin
			sig_delay1<=1'b0;
			sig_delay2<=1'b0;
		end
else begin
		sig_delay1<=sig_in;
		sig_delay2<=sig_delay1;
	end
assign sig_out=sig_delay2;
endmodule
