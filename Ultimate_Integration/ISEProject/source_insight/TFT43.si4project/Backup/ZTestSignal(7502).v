`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:53:18 04/07/2023 
// Design Name: 
// Module Name:    ZTestSignal 
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
module ZTestSignal(
	input clk,
	input rst_n,

	output photon_pulse_simulate,
	output sync_50Hz_simulate
    );

//generate 100KHz photon_pulse_simulate.
//80MHz/100KHz=800
reg [19:0] cnt_100KHz;
always@(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_100KHz<=20'd0;
else if(cnt_100KHz==20'd800-1) 
		cnt_100KHz<=20'd0;
	else
		cnt_100KHz<=cnt_100KHz+1'b1;
assign photon_pulse_simulate=(cnt_100KHz==20'd800-1)?1'b1:1'b0;


//generate 50Hz sync_50Hz_simulate.
//80MHz/50Hz=1_600_000;
reg [23:0] cnt_50Hz;
always@(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_50Hz<=24'd0;
else if(cnt_50Hz==24'd1_600_000-1) 
		cnt_50Hz<=24'd0;
	else
		cnt_50Hz<=cnt_50Hz+1'b1;
assign sync_50Hz_simulate=(cnt_50Hz==24'd1_600_000-1)?1'b1:1'b0;
endmodule
