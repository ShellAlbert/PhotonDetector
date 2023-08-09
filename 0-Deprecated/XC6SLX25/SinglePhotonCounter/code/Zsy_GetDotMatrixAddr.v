`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:07 11/02/2022 
// Design Name: 
// Module Name:    Zsy_GetDotMatrixAddr 
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
module Zsy_GetDotMatrixAddr(
    input [3:0] q,
    output reg [3:0] addr
    );

always @ (q)
begin
	case(q)
		4'd0:addr=4'd6;
		4'd1:addr=4'd7;
		4'd2:addr=4'd8;
		4'd3:addr=4'd9;
		4'd4:addr=4'd10;
		4'd5:addr=4'd11;
		4'd6:addr=4'd12;
		4'd7:addr=4'd13;
		4'd8:addr=4'd14;
		4'd9:addr=4'd15;
		default:
			addr=4'd6;
	endcase
end
endmodule
