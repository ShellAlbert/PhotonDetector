`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:26 02/22/2023 
// Design Name: 
// Module Name:    ZKey_Module_Delay 
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
module ZKey_Module_Delay(
    input clk,
    input rst_n,
    input en,
    input key_down,
    input key_up,
    output delayed_key_down,
    output delayed_key_up
    );
reg rdelayed_key_down;
reg rdelayed_key_up;
assign delayed_key_down=rdelayed_key_down;
assign delayed_key_up=rdelayed_key_up;

//to filter more signals, only keeps one.
//                            _    ___      _
//pulse             _________| |__|   |____| |___________
//                                               _
//delayed_pulse     ____________________________| |______

//filter period: 500ms.
//t=500ms,f=1/t=2Hz.
//50MHz/2Hz=25,000,000
reg [24:0] cnt_2Hz;
reg EnCount;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_2Hz<=25'd0;
			end
else if(EnCount)	begin
						if(cnt_2Hz>=25'd25_000_000)
							cnt_2Hz<=25'd0;
						else
							cnt_2Hz<=cnt_2Hz+1'b1;
					end
	else	begin
				cnt_2Hz<=25'd0;
			end
//output delayed signal after 500ms to filter noise.
reg [2:0] cnt_i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				rdelayed_key_down<=1'b0;
				cnt_i<=3'd0;
			end
else if(en)	begin
				case(cnt_i)
					3'd0:
						if(key_down)	begin 
										EnCount<=1'b1; 
										cnt_i<=cnt_i+1'b1; 
									end
					3'd1:
						if(cnt_2Hz>=25'd25_000_000)	begin
														cnt_i<=cnt_i+1'b1;
														EnCount<=1'b0;
													end
					3'd2:
						begin
							rdelayed_key_down<=1'b1;
							cnt_i<=cnt_i+1'b1;
						end
					3'd3:
						begin
							rdelayed_key_down<=1'b0;
							cnt_i<=3'd0;
						end
				endcase
			end
	else	begin
				rdelayed_key_down<=1'b0;
			end

//filter period: 500ms.
//t=500ms,f=1/t=2Hz.
//50MHz/2Hz=25,000,000
reg [24:0] cnt2_2Hz;
reg EnCount2;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt2_2Hz<=25'd0;
			end
else if(EnCount2)	begin
						if(cnt2_2Hz>=25'd25_000_000)
							cnt2_2Hz<=25'd0;
						else
							cnt2_2Hz<=cnt2_2Hz+1'b1;
					end
	else	begin
				cnt2_2Hz<=25'd0;
			end
//output delayed signal after 500ms to filter noise.
reg [2:0] cnt2_i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				rdelayed_key_up<=1'b0;
				cnt2_i<=3'd0;
			end
else if(en)	begin
				case(cnt2_i)
					3'd0:
						if(key_up)	begin 
										EnCount2<=1'b1; 
										cnt2_i<=cnt2_i+1'b1; 
									end
					3'd1:
						if(cnt2_2Hz>=25'd25_000_000)	begin
															cnt2_i<=cnt2_i+1'b1;
															EnCount2<=1'b0;
														end
					3'd2:
						begin
							rdelayed_key_up<=1'b1;
							cnt2_i<=cnt2_i+1'b1;
						end
					3'd3:
						begin
							rdelayed_key_up<=1'b0;
							cnt2_i<=3'd0;
						end
				endcase
			end
	else	begin
				rdelayed_key_up<=1'b0;
			end
endmodule
