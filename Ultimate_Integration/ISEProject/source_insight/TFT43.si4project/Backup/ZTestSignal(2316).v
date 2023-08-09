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

	output reg photon_pulse_simulate,
	output reg sync_50Hz_simulate
    );

//generate 100KHz photon_pulse_simulate.
//80MHz/100KHz=800
reg [19:0] cnt_100KHz;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_100KHz<='d0;
				photon_pulse_simulate<=1'b0;
			end
else if(cnt_100KHz=='d800-1) begin
							cnt_100KHz<='d0;
							photon_pulse_simulate<=~photon_pulse_simulate;
						 end
	else begin
			cnt_100KHz<=cnt_100KHz+1'b1;
		end

//generate 50Hz sync_50Hz_simulate.
//80MHz/50Hz/2=1_600_000=800_000
reg [23:0] cnt_50Hz;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_50Hz<='d0;
				sync_50Hz_simulate<=1'b0;
			end
else if(cnt_50Hz=='d800_000-1) begin
								cnt_50Hz<='d0;
								sync_50Hz_simulate<=~sync_50Hz_simulate;
							 end
	else begin
			cnt_50Hz<=cnt_50Hz+1'b1;
		end
endmodule
