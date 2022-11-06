`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:23 11/02/2022 
// Design Name: 
// Module Name:    Zsy_PulseCounter 
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
module Zsy_PulseCounter(
    input clk,
    input rst_n,
    input en,
    input pulse,
    output [3:0] q0,
    output [3:0] q1,
    output [3:0] q2,
    output [3:0] q3,
    output [3:0] q4,
    output [3:0] q5,
    output [3:0] q6,
    output [3:0] q7,
    output overflow
    );

//100MHz clock.
//Maxmimum frequency of pulse is 50MHz.
reg pulse_f1;
reg pulse_f2;

//xxxx,xxxx.
reg [3:0] rq0;
reg [3:0] rq1;
reg [3:0] rq2;
reg [3:0] rq3;
reg [3:0] rq4;
reg [3:0] rq5;
reg [3:0] rq6;
reg [3:0] rq7;
reg rq_overflow[7:0];

//output drive.
assign q0=rq0;
assign q1=rq1;
assign q2=rq2;
assign q3=rq3;
assign q4=rq4;
assign q5=rq5;
assign q6=rq6;
assign q7=rq7;
assign overflow=rq_overflow[7];
//generate 1KHz from 10MHz as test signal to bypass pulse input.
//10MHz/1KHz/2=5,000
reg [12:0] cnt_1khz;
wire sig_1khz;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1khz<=13'd0;
else	begin
			if(en)	begin
						if(cnt_1khz>=13'd2-1)
							cnt_1khz<=13'd0;
						else
							cnt_1khz<=cnt_1khz+1'b1;
					end
			else
				cnt_1khz<=13'd0;
		end
assign sig_1khz=(cnt_1khz>=13'd2-1)?1'b1:1'b0;

//external pulse sync to clk.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				pulse_f1<=1'b0;
				pulse_f2<=1'b0;
			end
else 	if(en)	begin
					pulse_f1<=/*pulse*/sig_1khz;
					pulse_f2<=pulse_f1;
				end
		else	begin
					pulse_f1<=1'b0;
					pulse_f2<=1'b0;
				end
//generate 1Hz from 10MHz.
//10MHz/1Hz/2=5,000,000
reg [22:0] cnt_1hz;
wire sig_1hz;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1hz<=23'd0;
else	begin
			if(en)	begin
						if(cnt_1hz>=23'd5_000_000)
							cnt_1hz<=23'd0;
						else
							cnt_1hz<=cnt_1hz+1'b1;
					end
			else
				cnt_1hz<=23'd0;
		end
assign sig_1hz=(cnt_1hz>=23'd5_000_000)?1'b1:1'b0;

//rq0.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq0<=4'd0;
				rq_overflow[0]<=1'b0;
			end
else	begin
			if(en)	begin
						if(sig_1hz)		begin
											rq0<=4'd0;
										end
						else 	if(pulse_f2)	begin
													if(rq0>=4'd9)	begin
																		rq0<=4'd0;
																		rq_overflow[0]<=1'b1;
																	end
													else	begin
																rq0<=rq0+1'b1;
																rq_overflow[0]<=1'b0;
															end
												end
								else
									rq_overflow[0]<=1'b0;
					end
			else	begin
						rq0<=4'd0;
						rq_overflow[0]<=1'b0;
					end
		end
	
//rq1.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq1<=4'd0;
				rq_overflow[1]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq1<=4'd0;
								end
					else	if(rq_overflow[0])	begin
													if(rq1>=4'd9)	begin
																		rq1<=4'd0;
																		rq_overflow[1]<=1'b1;
																	end
													else	begin
																rq1<=rq1+1'b1;
																rq_overflow[1]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[1]<=1'b0;
				end
		else	begin
					rq1<=4'd0;
					rq_overflow[1]<=1'b0;
				end

//rq2.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq2<=4'd0;
				rq_overflow[2]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq2<=4'd0;
								end
					else	if(rq_overflow[1])	begin
													if(rq2>=4'd9)	begin
																		rq2<=4'd0;
																		rq_overflow[2]<=1'b1;
																	end
													else	begin
																rq2<=rq2+1'b1;
																rq_overflow[2]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[2]<=1'b0;
				end
		else	begin
					rq2<=4'd0;
					rq_overflow[2]<=1'b0;
				end

//rq3.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq3<=4'd0;
				rq_overflow[3]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq3<=4'd0;
								end
					else	if(rq_overflow[2])	begin
													if(rq3>=4'd9)	begin
																		rq3<=4'd0;
																		rq_overflow[3]<=1'b1;
																	end
													else	begin
																rq3<=rq3+1'b1;
																rq_overflow[3]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[3]<=1'b0;
				end
		else	begin
					rq3<=4'd0;
					rq_overflow[3]<=1'b0;
				end
			
//rq4.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq4<=4'd0;
				rq_overflow[4]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq4<=4'd0;
								end
					else	if(rq_overflow[3])	begin
													if(rq4>=4'd9)	begin
																		rq4<=4'd0;
																		rq_overflow[4]<=1'b1;
																	end
													else	begin
																rq4<=rq4+1'b1;
																rq_overflow[4]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[4]<=1'b0;
				end
		else	begin
					rq4<=4'd0;
					rq_overflow[4]<=1'b0;
				end
			
//rq5.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq5<=4'd0;
				rq_overflow[5]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq5<=4'd0;
								end
					else	if(rq_overflow[4])	begin
													if(rq5>=4'd9)	begin
																		rq5<=4'd0;
																		rq_overflow[5]<=1'b1;
																	end
													else	begin
																rq5<=rq5+1'b1;
																rq_overflow[5]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[5]<=1'b0;
				end
		else	begin
					rq5<=4'd0;
					rq_overflow[5]<=1'b0;
				end
			
//rq6.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq6<=4'd0;
				rq_overflow[6]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq6<=4'd0;
								end
					else	if(rq_overflow[5])	begin
													if(rq6>=4'd9)	begin
																		rq6<=4'd0;
																		rq_overflow[6]<=1'b1;
																	end
													else	begin
																rq6<=rq6+1'b1;
																rq_overflow[6]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[6]<=1'b0;
				end
		else	begin
					rq6<=4'd0;
					rq_overflow[6]<=1'b0;
				end
			
//rq7.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq7<=4'd0;
				rq_overflow[7]<=1'b0;
			end
else	if(en)	begin
					if(sig_1hz) begin
									rq7<=4'd0;
								end
					else	if(rq_overflow[6])	begin
													if(rq7>=4'd9)	begin
																		rq7<=4'd0;
																		rq_overflow[7]<=1'b1;
																	end
													else	begin
																rq7<=rq7+1'b1;
																rq_overflow[7]<=1'b0;
															end
												
												
												end
							else
								rq_overflow[7]<=1'b0;
				end
		else	begin
					rq7<=4'd0;
					rq_overflow[7]<=1'b0;
				end

endmodule
