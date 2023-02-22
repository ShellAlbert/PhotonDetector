`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:54:10 02/21/2023 
// Design Name: 
// Module Name:    ZReset_Module 
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
module ZReset_Module(
    input clk,
    output rst_n
    );

//Since we have no hardware reset mechanism,
//so we count the clk to a specific number to generate a reset signal.
//                  ________________________________________________
//_________________|
reg [31:0] cnt_rst_n;
always @ (posedge clk)
if(cnt_rst_n>=32'hfffffff0)
	cnt_rst_n<=cnt_rst_n; //keeping permanently.
else
	cnt_rst_n<=cnt_rst_n+1'b1;

assign rst_n=(cnt_rst_n>=32'hffff)?1'b1:1'b0;
endmodule
