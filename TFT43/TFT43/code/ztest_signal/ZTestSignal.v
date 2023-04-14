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
//80MHz/10MHz/=8
//80MHz/1MHz=80
//80MHz/100KHz=800
//80MHz/10KHz=8000
//80MHz/1KHz=80000
//80MHz/100Hz=800_000
//80MHz/10Hz=8_000_000
reg [31:0] cnt_freq;
reg [7:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_freq<=0;
				photon_pulse_simulate<=1'b0;
			end
else begin
		if(cnt_freq=='d80-1) begin
							cnt_freq<='d0;
							photon_pulse_simulate<=~photon_pulse_simulate;
						 end
		else begin
				cnt_freq<=cnt_freq+1'b1;
			end
	end
/*

always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_freq<=0;
				photon_pulse_simulate<=1'b0;
			end
else case(i)
		0: //No Signal.
			photon_pulse_simulate<=1'b0;
			
		1: //1MHz.
			if(cnt_freq=='d80-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
				
		2: //No Signal.
			photon_pulse_simulate<=1'b0;
			
		3: //1KHz.
			if(cnt_freq=='d80000-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
			
		4: //No Signal.
			photon_pulse_simulate<=1'b0;
			
		5: //100KHz.
			if(cnt_freq=='d800-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
			
		6: //No Signal.
			photon_pulse_simulate<=1'b0;
		7: //10MHz.
			if(cnt_freq=='d8-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
		8: //No Signal.
			photon_pulse_simulate<=1'b0;
		9: //10Hz.
			if(cnt_freq=='d8_000_000-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
		10: //No Signal.
			photon_pulse_simulate<=1'b0;
		11: //100Hz.
			if(cnt_freq=='d800_000-1) begin
								cnt_freq<='d0;
								photon_pulse_simulate<=~photon_pulse_simulate;
							 end
			else begin
					cnt_freq<=cnt_freq+1'b1;
				end
		12:
			photon_pulse_simulate<=1'b0;
		default:
			photon_pulse_simulate<=1'b0;
	endcase
//delay control.
reg [7:0] i_delay;
reg [31:0] CNT1;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i_delay<=0;
				i<=0;
				CNT1<=0;
			end
else case(i_delay)
		0:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		1:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		2:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		3:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		4:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		5:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		6:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		7:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		8:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		9:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		10:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		11:
			if(CNT1==40_000_000) begin CNT1<=0; i_delay<=i_delay+1'b1; i<=i+1'b1; end
			else begin CNT1<=CNT1+1; end
		12:
			begin i_delay<=0; i<=0; end
		default: 
			begin i_delay<=0; i<=0; end
	endcase
*/

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
