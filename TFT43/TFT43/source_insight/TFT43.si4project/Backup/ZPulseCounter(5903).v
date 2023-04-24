`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:23 11/02/2022 
// Design Name: 
// Module Name:    ZPulseCounter
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
module ZPulseCounter(
    input clk,
    input rst_n,
    input en,
    //80MHz clock.
	//Maxmimum frequency of input pulse is 40MHz.
    input pulse,

    //output for drawing LCD to avoid divider.
    output [3:0] q0_LCD,
    output [3:0] q1_LCD,
    output [3:0] q2_LCD,
    output [3:0] q3_LCD,
    output [3:0] q4_LCD,
    output [3:0] q5_LCD,
    output [3:0] q6_LCD,
    output [3:0] q7_LCD,
    output overflow,
    //output for uploading data via Network.
    output reg [31:0] oPulseCounter_Single, //maximum 9999,9999.
   	output oDataUpdate,

	//Accumulated PulseCounter. Never Reset to 0.
   	output [31:0] oPulseCouter_LCD_Accumulated
    );


//xxxx,xxxx.  maximum value is 99999999.
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
assign q0_LCD=rq0;
assign q1_LCD=rq1;
assign q2_LCD=rq2;
assign q3_LCD=rq3;
assign q4_LCD=rq4;
assign q5_LCD=rq5;
assign q6_LCD=rq6;
assign q7_LCD=rq7;
assign overflow=rq_overflow[7];

//assign oPulseCouter_LCD_Accumulated=32'h12345678;
//Because One Period of SIN is 120 Points.
//SIN frequency = 50Hz. (t=20mS)
//So, 120 Points / 20mS = 6 Points / 1mS
//Then, 1000uS /6 Points = 166uS. 
//PulseCounter Module needs to output one new point every 166uS.
//f=80MHz
//t=1/80MHz(s)=1/80*10^6Hz(s)=1*10^-6/80*10^6*10^-6Hz=1/80(uS)=0.0125uS

//Counter Reset to Zero every 166uS.
//166uS/0.0125uS=13280

//Since the mimum passive quench is 50uS.
//So here we extend it to 1mS.
//1000uS/0.0125uS=80_000
//80MHz/80,000=1000Hz.
//t=1/1000Hz(s)=0.001s=1ms.
reg [27:0] CNT;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				CNT<='d0;
			end
else if(en)	begin
				if(CNT=='d80_000-1)
					CNT<='d0;
				else
					CNT<=CNT+1'b1;
			end
	else
		CNT<='d0;
///////////////////////////////////////////
//output data update signal before 1 clk to avoid to be reset to zero.
assign oDataUpdate=(CNT=='d80_000-2)?1'b1:1'b0;
//////////////////////////////////////////
wire zero_signal;
assign zero_signal=(CNT=='d80_000-1)?1'b1:1'b0;

//rq0.
always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
			rq0<=4'd0;
			rq_overflow[0]<=1'b0;
			
			oPulseCounter_Single<=0;
			oDataUpdate<=0;
		end
else if(en) begin
			if(zero_signal) begin
							rq0<=4'd0;
							rq_overflow[0]<=1'b0;
						 end
			else if(pulse) begin
							if(rq0>=4'd9) begin
											rq0<=4'd0;
											rq_overflow[0]<=1'b1;
										end
							else begin
									rq0<=rq0+1'b1;
									rq_overflow[0]<=1'b0;
								end
								////////////////////////////////////
								oPulseCounter_Single<=oPulseCounter_Single+1'b1; 
						end
			else begin
					rq_overflow[0]<=1'b0;
				end
		 end
	else begin
			rq0<=4'd0;
			rq_overflow[0]<=1'b0;
			oPulseCounter_Single<=0;
		end

//rq1.
always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
			rq1<=4'd0;
			rq_overflow[1]<=1'b0;
		end
else if(en) begin
			if(zero_signal) begin
							rq1<=4'd0;
							rq_overflow[1]<=1'b0;
						 end
			else if(rq_overflow[0]) begin
									if(rq1>=4'd9) begin
													rq1<=4'd0;
													rq_overflow[1]<=1'b1;
												end
									else begin
											rq1<=rq1+1'b1;
											rq_overflow[1]<=1'b0;
										end
								end
			else begin
					rq_overflow[1]<=1'b0;
				end
		 end
	else begin
			rq1<=4'd0;
			rq_overflow[1]<=1'b0;
		end

//rq2.
always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
			rq2<=4'd0;
			rq_overflow[2]<=1'b0;
		end
else if(en) begin
			if(zero_signal) begin
							rq2<=4'd0;
							rq_overflow[2]<=1'b0;
						 end
			else if(rq_overflow[1]) begin
									if(rq2>=4'd9) begin
													rq2<=4'd0;
													rq_overflow[2]<=1'b1;
												end
									else begin
											rq2<=rq2+1'b1;
											rq_overflow[2]<=1'b0;
										end
								end
			else begin
					rq_overflow[2]<=1'b0;
				end
			end
	else begin
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
						if(zero_signal)	begin
											rq3<=4'd0;
											rq_overflow[3]<=1'b0;
										end
						else if(rq_overflow[2])	begin
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
					if(zero_signal)	begin
										rq4<=4'd0;
										rq_overflow[4]<=1'b0;
									end
					else if(rq_overflow[3])	begin
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
					if(zero_signal)	begin
										rq5<=4'd0;
										rq_overflow[5]<=1'b0;
									end
					else if(rq_overflow[4])	begin
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
					if(zero_signal)	begin
										rq6<=4'd0;
										rq_overflow[6]<=1'b0;
									end
					else if(rq_overflow[5])	begin
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
					if(zero_signal)	begin
										rq7<=4'd0;
										rq_overflow[7]<=1'b0;
									end
					else if(rq_overflow[6])	begin
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
//////////////////////////////////////////////////////////////////////////
//Accumulated PulseCounter for drawing on LCD.
reg [3:0] rq0_acc;
reg [3:0] rq1_acc;
reg [3:0] rq2_acc;
reg [3:0] rq3_acc;
reg [3:0] rq4_acc;
reg [3:0] rq5_acc;
reg [3:0] rq6_acc;
reg [3:0] rq7_acc;
reg rq_acc_overflow[7:0];
assign oPulseCouter_LCD_Accumulated={rq7_acc,rq6_acc,rq5_acc,rq4_acc,rq3_acc,rq2_acc,rq1_acc,rq0_acc};

//rq0_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq0_acc<=4'd0;
				rq_acc_overflow[0]<=1'b0;
			end
else	begin
			if(en)	begin
							if(pulse)	begin
											////////////////////////////////////
											if(rq0_acc>=4'd9)	begin
																	rq0_acc<=4'd0;
																	rq_acc_overflow[0]<=1'b1;
															end
											else	begin
														rq0_acc<=rq0_acc+1'b1;
														rq_acc_overflow[0]<=1'b0;
													end
										end
							else
								rq_acc_overflow[0]<=1'b0;
						end
			else	begin
						rq0_acc<=4'd0;
						rq_acc_overflow[0]<=1'b0;
					end
		end
	
//rq1_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq1_acc<=4'd0;
				rq_acc_overflow[1]<=1'b0;
			end
else	if(en)	begin
						if(rq_acc_overflow[0])	begin
														if(rq1_acc>=4'd9) begin
																			rq1_acc<=4'd0;
																			rq_acc_overflow[1]<=1'b1;
																		end
														else	begin
																	rq1_acc<=rq1_acc+1'b1;
																	rq_acc_overflow[1]<=1'b0;
																end
												end
						else
							rq_acc_overflow[1]<=1'b0;
					end
		else	begin
					rq1_acc<=4'd0;
					rq_acc_overflow[1]<=1'b0;
				end

//rq2_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq2_acc<=4'd0;
				rq_acc_overflow[2]<=1'b0;
			end
else	if(en)	begin
						if(rq_acc_overflow[1])	begin
													if(rq2_acc>=4'd9) begin
																		rq2_acc<=4'd0;
																		rq_acc_overflow[2]<=1'b1;
																	end
													else	begin
																rq2_acc<=rq2_acc+1'b1;
																rq_acc_overflow[2]<=1'b0;
															end
												end
						else
							rq_acc_overflow[2]<=1'b0;
					end
		else	begin
					rq2_acc<=4'd0;
					rq_acc_overflow[2]<=1'b0;
				end

//rq3_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq3_acc<=4'd0;
				rq_acc_overflow[3]<=1'b0;
			end
else	if(en)	begin
						if(rq_acc_overflow[2])	begin
													if(rq3_acc>=4'd9) begin
																		rq3_acc<=4'd0;
																		rq_acc_overflow[3]<=1'b1;
																	end
													else	begin
																rq3_acc<=rq3_acc+1'b1;
																rq_acc_overflow[3]<=1'b0;
															end
												end
						else
							rq_acc_overflow[3]<=1'b0;
				end
		else	begin
					rq3_acc<=4'd0;
					rq_acc_overflow[3]<=1'b0;
				end
			
//rq4_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq4_acc<=4'd0;
				rq_acc_overflow[4]<=1'b0;
			end
else	if(en)	begin
					if(rq_acc_overflow[3])	begin
												if(rq4_acc>=4'd9) begin
																	rq4_acc<=4'd0;
																	rq_acc_overflow[4]<=1'b1;
																end
												else	begin
															rq4_acc<=rq4_acc+1'b1;
															rq_acc_overflow[4]<=1'b0;
														end
											end
					else
						rq_acc_overflow[4]<=1'b0;
				end
		else	begin
					rq4_acc<=4'd0;
					rq_acc_overflow[4]<=1'b0;
				end
	
//rq5_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq5_acc<=4'd0;
				rq_acc_overflow[5]<=1'b0;
			end
else	if(en)	begin
					if(rq_acc_overflow[4])	begin
												if(rq5_acc>=4'd9) begin
																rq5_acc<=4'd0;
																rq_acc_overflow[5]<=1'b1;
															end
												else	begin
															rq5_acc<=rq5_acc+1'b1;
															rq_acc_overflow[5]<=1'b0;
														end
											end
					else
						rq_acc_overflow[5]<=1'b0;
				end
		else	begin
					rq5_acc<=4'd0;
					rq_acc_overflow[5]<=1'b0;
				end
			
//rq6_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq6_acc<=4'd0;
				rq_acc_overflow[6]<=1'b0;
			end
else	if(en)	begin
					if(rq_acc_overflow[5])	begin
												if(rq6_acc>=4'd9) begin
																	rq6_acc<=4'd0;
																	rq_acc_overflow[6]<=1'b1;
																end
												else	begin
															rq6_acc<=rq6_acc+1'b1;
															rq_acc_overflow[6]<=1'b0;
														end
											end
					else
						rq_acc_overflow[6]<=1'b0;
				end
		else	begin
					rq6_acc<=4'd0;
					rq_acc_overflow[6]<=1'b0;
				end
			
//rq7_acc.
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rq7_acc<=4'd0;
				rq_acc_overflow[7]<=1'b0;
			end
else	if(en)	begin
					if(rq_acc_overflow[6])	begin
												if(rq7_acc>=4'd9) begin
																	rq7_acc<=4'd0;
																	rq_acc_overflow[7]<=1'b1;
																end
												else	begin
															rq7_acc<=rq7_acc+1'b1;
															rq_acc_overflow[7]<=1'b0;
														end
											end
					else
						rq_acc_overflow[7]<=1'b0;
				end
		else	begin
					rq7_acc<=4'd0;
					rq_acc_overflow[7]<=1'b0;
				end

endmodule

