`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:34 03/16/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Base 
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
module ZSDRAM_Module_Base(
    input clk,
    input rst_n,

    input [23:0] iAddr, //Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iData, //input data, write to SDRAM.
    output [15:0] oData, //read back data from SDRAM.

    input [1:0] iCall, //[1]=1:Write, [0]=1:Read.
    output [1:0] oDone, //Read & Write done.
    
    output S_CKE,
    output S_nCS,
    output S_nRAS,
    output S_nCAS,
    output S_nWE,
    output [1:0] S_BA,
    output [12:0] S_A,
    output [1:0] S_DQM,
    inout [15:0] S_DQ
    );

wire [3:0] call_bridge; 
wire done_bridge;
ZSDRAM_Module_Ctrl u1(
    .clk(clk), //input from Top Module.
    .rst_n(rst_n), //input from Top Module.
    .iCall(iCall), //input from Top Module.
    .iDone(done_bridge), //input from u2.
    .oDone(oDone), //output to Top Module.
    .oCall(call_bridge) //output to U2.
    );

ZSDRAM_Module_Function u2(
    .clk(clk), //input from Top Module.
    .rst_n(rst_n), //input from Top Module.
    
	.iCall(call_bridge), //input from u1.
    .oDone(done_bridge), //output to u1.
    
    .iAddr(iAddr), //input from Top Module.
    .iData(iData), //input from Top Module.
    .oData(oData),  //output to Top Module.
    
    //Physical Pins connect to SDRAM Integrated Chip.
    .S_CKE(S_CKE), //Output to Top Module.
    .S_nCS(S_nCS), //Output to Top Module.
    .S_nRAS(S_nRAS), //Output to Top Module.
    .S_nCAS(S_nCAS), //Output to Top Module.
    .S_nWE(S_nWE), //Output to Top Module.
    .S_BA(S_BA), //Output to Top Module.
    .S_A(S_A), //Output to Top Module.
    .S_DQM(S_DQM), //Output to Top Module.
    .S_DQ(S_DQ) //Output to Top Module.
    );
endmodule
