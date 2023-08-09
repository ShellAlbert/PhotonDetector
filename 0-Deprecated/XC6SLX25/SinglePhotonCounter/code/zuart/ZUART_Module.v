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
    input clk,
    input rst_n,
    input en,

    //tx logic.
    input [7:0] tx_data,
    output tx_done,
	output tx_pin,

	//rx logic.
	input rx_pin,
    output [7:0] rx_data,
    output rx_done  
    );

//Baudrate generator module.
wire bps_clk;
ZUART_Module_BPS_Generator u1(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(en), //input.
    .bps_clk(bps_clk) //output.
    );

//Transmit module.
ZUART_Module_TX u2(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(en), //input.
    .bps_clk(bps_clk), //input.
    .data(tx_data), //input.
    .tx_pin(tx_pin), //output.
    .done(tx_done) //output.
    );

//Receive module.
ZUART_Module_RX u3(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(en), //input.
    .rx_pin(rx_pin), //input.
    .rx_data(rx_data), //output.
    .done(rx_done) //output.
    );
endmodule
