`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 09:45:02 AM
// Design Name: 
// Module Name: ZMux2to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
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
    input iSig1,
    input iSig2,
    output reg oSig,
    input iSel
    );

always @(*)
begin
    if(!iSel)
        oSig=iSig1;
    else
        oSig=iSig2;
end
endmodule