`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:34:45 04/07/2023 
// Design Name: 
// Module Name:    ZEdgeDetect 
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
module ZEdgeDetect(
    input clk,
    input rst_n,
    input sig_in,
    output rising_edge,
    output falling_edge
    );

reg sig_delay1;
reg sig_delay2;

//external pulse sync to clk.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sig_delay1<=1'b0;
				sig_delay2<=1'b0;
			end
else 	if(en)	begin
					sig_delay1<=sig_in;
					sig_delay2<=sig_delay1;
				end
		else	begin
					sig_delay1<=1'b0;
					sig_delay2<=1'b0;
				end

assign rising_edge=(sig_delay1 && (~sig_delay2));
assign falling_edge=((~sig_delay1 && sig_delay2));
endmodule
