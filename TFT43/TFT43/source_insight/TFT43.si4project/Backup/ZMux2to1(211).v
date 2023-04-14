`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:59:10 04/13/2023 
// Design Name: 
// Module Name:    ZMux2to1 
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
module ZMux2to1(
	input select,
	input [23:0] in1,
	input [23:0] in2,
	output reg [23:0] out
    );
always @(*)
begin
	case(select)
		0:
			out<=in1;
		1:
			out<=in2;
	endcase
end
endmodule
