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

//80MHz/1Hz=80,000,000
reg [27:0] cnt;
always @(posedge clk or negedge rst_n)
if(!rst_n) 	begin
				cnt<=28'd0;
			end
else if(cnt==28'd80_000_000)
		cnt<=28'd0;
	else
		cnt<=cnt+1'b1;

//second.
reg overflow_sec_1;
reg overflow_sec_10;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				second_1<=4'd0;
				overflow_sec_1<=1'b0;
			end
else if(en && cnt==28'd80_000_000)	begin
										if(second_1==4'd9) 	begin 
																second_1<=4'd0;
																overflow_sec_1<=1'b1;
															end
										else	begin
													second_1<=second_1+1'b1;
													overflow_sec_1<=1'b0;
												end
									end
	else
		overflow_sec_1<=1'b0;

always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				second_10<=4'd0;
				overflow_sec_10<=1'b0;
			end
else if(en && overflow_sec_1)	begin
										if(second_10==4'd5)	begin
																second_10<=4'd0;
																overflow_sec_10<=1'b1;
															end
										else	begin
													second_10<=second_10+1'b1;
													overflow_sec_10<=1'b0;
												end
									end
	else
		overflow_sec_10<=1'b0;

//minute.
reg overflow_min_1;
reg overflow_min_10;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				minute_1<=4'd0;
				overflow_min_1<=1'b0;
			end
else if(en && overflow_sec_10)	begin
									if(minute_1==4'd9)	begin
															minute_1<=4'd0;
															overflow_min_1<=1'b1;
														end
									else	begin
												minute_1<=minute_1+1'b1;
												overflow_min_1<=1'b0;
											end
								end
	else
		overflow_min_1<=1'b0;

always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				minute_10<=4'd0;
				overflow_min_10<=1'b0;
			end
else if(en && overflow_min_1)	begin
										if(minute_10==4'd5)	begin
																minute_10<=4'd0;
																overflow_min_10<=1'b1;
															end
										else	begin
													minute_10<=minute_10+1'b1;
													overflow_min_10<=1'b0;
												end
								end
	else
		overflow_min_10<=1'b0;

//hour.
reg overflow_hour_1;
reg overflow_hour_10;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				hour_1<=4'd0;
				overflow_hour_1<=1'b0;
			end
else if(en && overflow_min_10)	begin
									if(hour_1==4'd9)	begin
															hour_1<=4'd0;
															overflow_hour_1<=1'b1;
														end
									else	begin
												hour_1<=hour_1+1'b1;
												overflow_hour_1<=1'b0;
											end
								end
	else
		overflow_hour_1<=1'b0;
		
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				hour_10<=4'd0;
				overflow_hour_10<=1'b0;
			end
else if(en && overflow_hour_1)	begin
									if(hour_10==4'd9)	begin
															hour_10<=4'd0;
															overflow_hour_10<=1'b1;
														end
									else	begin
												hour_10<=hour_10+1'b1;
												overflow_hour_10<=1'b0;
											end
								end
	else
		overflow_hour_10<=1'b0;

endmodule
