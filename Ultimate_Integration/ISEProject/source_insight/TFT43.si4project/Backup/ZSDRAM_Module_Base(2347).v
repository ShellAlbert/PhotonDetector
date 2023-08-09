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
	
	//0: Single Word Read/Write.
	//1: Four Words Read/Write.
	input iMode,
	
    input [23:0] iAddr, //Bank(2)+Row(13)+Column(9)=(24)
    
    input [15:0] iData1, //input data1, write to SDRAM.
	input [15:0] iData2, //input data2, write to SDRAM.
	input [15:0] iData3, //input data3, write to SDRAM.
	input [15:0] iData4, //input data4, write to SDRAM.
	
    output [15:0] oData1, //read back data1 from SDRAM.
	output [15:0] oData2, //read back data2 from SDRAM.
	output [15:0] oData3, //read back data3 from SDRAM.
	output [15:0] oData4, //read back data4 from SDRAM.

	//[1]=1:Word(s) Write, [0]=1:Word(s) Read.
    input [1:0] iReq, 
    //[1]=Write done, [0]=Read done.
    output [1:0] oDone, 
    
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

wire [3:0] req_buf; 
wire [1:0] done_buf;
ZSDRAM_Module_Ctrl u1(
    .clk(clk), //input from Top Module.
    .rst_n(rst_n), //input from Top Module.
    .iReq(iReq), //input from Top Module.
    .iDone(done_buf), //input from u2.
    .oDone(oDone), //output to Top Module.
    .oReq(req_buf) //output to U2.
    );

ZSDRAM_Module_Function u2(
    .clk(clk), //input from Top Module.
    .rst_n(rst_n), //input from Top Module.
    
	//0: Single Word Read/Write.
	//1: Four Words Read/Write.
	.iMode(iMode),
	.iReq(req_buf), //input from u1.
    .oDone(done_buf), //output to u1.
    
    .iAddr(iAddr), //input from Top Module.
    .iData1(iData1), //input from Top Module.
	.iData2(iData2), //input from Top Module.
	.iData3(iData3), //input from Top Module.
	.iData4(iData4), //input from Top Module.
	
    .oData1(oData1),  //output to Top Module.
	.oData2(oData2),  //output to Top Module.
	.oData3(oData3),  //output to Top Module.
	.oData4(oData4),  //output to Top Module.
	
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

