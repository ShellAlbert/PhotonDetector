`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:43 02/22/2023 
// Design Name: 
// Module Name:    ZKey_Module 
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
module ZKey_Module(
    input clk,
    input rst_n,
    input en,
    input key_pin,
    output key_down,
    output key_up
    );

//edge detector, outputs one clock pulse.
wire h2l_edge; //high to low edge.
wire l2h_edge; //low to high edge.
ZKey_Module_Edge_Detector u0(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(en), //input, enable module.
    .key_pin(key_pin), //input, physical input pin.
    .h2l_edge(h2l_edge), //output.
    .l2h_edge(l2h_edge) //output.
    );
//500ms delay to filter noise.
ZKey_Module_Delay u1(
    .clk(clk), //input.
    .rst_n(rst_n), //input. 
    .en(en), //input, enable module.
   	.key_down(h2l_edge), //input.
    .key_up(l2h_edge), //input.
    .delayed_key_down(key_down), //output.
    .delayed_key_up(key_up) //output.
    );
endmodule
