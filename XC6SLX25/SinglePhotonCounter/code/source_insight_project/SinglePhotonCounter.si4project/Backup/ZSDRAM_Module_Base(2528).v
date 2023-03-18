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
    input S_CKE,
    input S_nCS,
    input S_nRAS,
    input S_nCAS,
    input S_nWE,
    output [1:0] S_BA,
    output [12:0] S_A,
    output [1:0] S_DQM,
    output [15:0] S_DQ,
    input [1:0] iCall,
    output [1:0] oDone,
    input [23:0] iAddr,
    input [15:0] iData,
    output [15:0] oData
    );


endmodule
