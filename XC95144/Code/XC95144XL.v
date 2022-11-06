`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:29 11/03/2022 
// Design Name: 
// Module Name:    XC95144XL 
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
module XC95144XL(
    input clk,
    input rst_n,
    output [3:0] led
    );

reg [3:0] rled;


//25MHz/1Hz/2=12500000
reg [23:0] cnt_1hz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1hz<=24'd0;
else if(cnt_1hz>=24'd12500000)
	cnt_1hz<=24'd0;
else
	cnt_1hz<=cnt_1hz+1'b1;

reg [2:0] cnt_sec;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_sec<=3'd0;
else if(cnt_sec>=3'd7)
			cnt_sec<=3'd0;
	else if(cnt_1hz>=24'd12500000)
			cnt_sec<=cnt_sec+1'b1;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	rled<=4'b0000;
else if(cnt_sec==3'd1)
		rled[0]<=~rled[0];
else if(cnt_sec==3'd2)
		rled[1]<=~rled[1];
else if(cnt_sec==3'd3)
		rled[2]<=~rled[2];
else if(cnt_sec==3'd4)
		rled[3]<=~rled[3];
else 
	rled<=4'b0000;
assign led=rled;
endmodule
