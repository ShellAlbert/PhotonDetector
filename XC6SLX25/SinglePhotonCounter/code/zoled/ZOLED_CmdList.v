`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:13 11/01/2022 
// Design Name: 
// Module Name:    Zsy_OLEDCmdList 
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

`define	CMD_INIT_REGS	4'd0 //initial OLED all registers.
`define CMD_CLS_GRAM	4'd1 //clear entire GRAM. (fill entire screen with zeros).
`define CMD_CLS_LINE1	4'd2 //clear entire line-1.
`define CMD_CLS_LINE2	4'd3 //clear entire line-2.
`define CMD_CLS_LINE3	4'd4 //clear entire line-3.
`define CMD_CLS_LINE4	4'd5 //clear entire line-4.
`define CMD_WR_GRAM		4'd6 //write GRAM.

