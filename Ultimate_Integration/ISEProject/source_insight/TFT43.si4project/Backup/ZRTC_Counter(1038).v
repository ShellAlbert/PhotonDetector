`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:04:46 04/02/2023 
// Design Name: 
// Module Name:    ZRTC_Counter 
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
module ZRTC_Counter(
    input clk,
    input rst_n,
    input en,
    output reg [3:0] hour_10,
    output reg [3:0] hour_1,
    output reg [3:0] minute_10,
    output reg [3:0] minute_1,
    output reg [3:0] second_10,
    output reg [3:0] second_1
    );

//20MHz/1Hz=20,000,000
reg [27:0] cnt;
always @(posedge clk or negedge rst_n)
if(!rst_n) 	begin
				cnt<=28'd0;
			end
else if(cnt==28'd20_000_000)
		cnt<=28'd0;
	else
		cnt<=cnt+1'b1;

//second.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				second_1<=4'd0;
			end
else if(en && cnt==28'd20_000_000)	begin
										if(second_1==4'd9)
											second_1<=4'd0;
										else 
											second_1<=second_1+1'b1;
									end
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				second_10<=4'd0;
			end
else if(en && second_1==4'd9)	begin
										if(second_10==4'd5)
											second_10<=4'd0;
										else 
											second_10<=second_10+1'b1;
									end
//minute.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				minute_1<=4'd0;
			end
else if(en && second_10==4'd5 && second_1==4'd9)	begin
														if(minute_1==4'd9)
															minute_1<=4'd0;
														else 
															minute_1<=minute_1+1'b1;
													end
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				minute_10<=4'd0;
			end
else if(en && minute_1==4'd9)	begin
										if(minute_10==4'd5)
											minute_10<=4'd0;
										else 
											minute_10<=minute_10+1'b1;
									end
//hour.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				hour_1<=4'd0;
			end
else if(en && minute_10==4'd5 && minute_1==4'd9)	begin
														if(hour_1==4'd3)
															hour_1<=4'd0;
														else 
															hour_1<=hour_1+1'b1;
													end
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				hour_10<=4'd0;
			end
else if(en && hour_1==4'd3)	begin
										if(hour_10==4'd2)
											hour_10<=4'd0;
										else 
											hour_10<=hour_10+1'b1;
									end
endmodule
