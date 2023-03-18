`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:20:04 02/28/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Cmd 
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
module ZSDRAM_Module_Cmd(
    input clk,
    input rst_n,
    input [23:0] sys_addr,
    input [3:0] ini_state,
    input [4:0] work_state,
    output sdram_cke_pin,
    output sdram_cs_n_pin,
    output sdram_ras_n_pin,
    output sdram_cas_n_pin,
    output sdram_we_n_pin,
    output [1:0] sdram_bank_pin,
    output [12:0] sdram_addr_pin
    );


endmodule
