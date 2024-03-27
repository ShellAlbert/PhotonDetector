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
module ZEdge_Detect(
    input iClk,
    input iRst_N,
    input iEn,
    input iSig_In,
    output oSig_Rising,
    output oSig_Falling
    );

reg sig_delay1;
reg sig_delay2;

//external pulse sync to clk.
always @(posedge iClk or negedge iRst_N)
if(!iRst_N)	begin
				sig_delay1<=1'b0;
				sig_delay2<=1'b0;
			end
else 	if(iEn)	begin
					sig_delay1<=iSig_In;
					sig_delay2<=sig_delay1;
				end
		else	begin
					sig_delay1<=1'b0;
					sig_delay2<=1'b0;
				end

assign oSig_Rising=(sig_delay1 && (~sig_delay2));
assign oSig_Falling=((~sig_delay1 && sig_delay2));
endmodule
