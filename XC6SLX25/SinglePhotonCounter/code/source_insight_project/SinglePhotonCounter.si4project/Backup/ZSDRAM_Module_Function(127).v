`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:58 03/16/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Function 
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
module ZSDRAM_Module_Function(
    input clk,
    input rst_n,
    output S_CKE,
    output S_nCS,
    output S_nRAS,
    output S_nCAS,
    output S_nWE,
    output [1:0] S_BA,
    output [12:0] S_A,
    output [1:0] S_DQM,
    output [15:0] S_DQ,
    input [3:0] iCall,
    output oDone,
    input [23:0] iAddr,
    input [15:0] iData,
    output [15:0] oData
    );


endmodule
