`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:18 02/17/2023 
// Design Name: 
// Module Name:    ZUART_Module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: the top module of ZUART_Module_BPS_Generator, ZUART_Module_TX and ZUART_Module_RX.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ZUART_Module(
    input iClk,
    input iRst_N,
    input iEn,

    //tx logic.
    input [7:0] iTxData,
    output oTxDone,
	output oTxPin,

	//rx logic.
	input iRxPin,
    output [7:0] oRxData,
    output oRxDone  
    );

//Transmit module.
ZUART_Module_TX u2(
    .iClk(iClk), //input.
    .iRst_N(iRst_N), //input.
    .iEn(iEn), //input.

    .iTxData(iTxData), //input.
    .oTxPin(oTxPin), //output.
    .oTxDone(oTxDone) //output.
    );

//Receive module.
ZUART_Module_RX u3(
    .clk(iClk), //input.
    .rst_n(iRst_N), //input.
    .en(iEn), //input.
    .rx_pin(iRxPin), //input.
    .rx_data(oRxData), //output.
    .done(oRxDone) //output.
    );
endmodule
