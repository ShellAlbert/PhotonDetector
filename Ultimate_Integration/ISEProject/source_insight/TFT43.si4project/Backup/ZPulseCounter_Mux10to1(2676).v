`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:10 04/03/2023 
// Design Name: 
// Module Name:    ZMux10to1 
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
module ZPulseCounter_Mux10to1(
	//0: q0
	//1: q1
	//2: q2
	//3: q3
	//4: q4
	//5: q5
	//6: q6
	//7: q7
    input [3:0] select,
    
    input [3:0] q0,
    input [3:0] q1,
    input [3:0] q2,
    input [3:0] q3,
    input [3:0] q4,
    input [3:0] q5,
    input [3:0] q6,
    input [3:0] q7,
    
    output reg [3:0] dout
    );

always @(*)	
begin
	case(select)
		4'd0: dout<=q7;
		4'd1: dout<=q6;
		4'd2: dout<=q5;
		4'd3: dout<=q4;
		4'd4: dout<=q3;
		4'd5: dout<=q2;
		4'd6: dout<=q1;
		4'd7: dout<=q0;
		default: dout<=q0;
	endcase
end
endmodule
