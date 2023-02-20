`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:08 02/15/2023 
// Design Name: 
// Module Name:    ZQuench_Module 
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
module ZQuench_Module(
	input clk,
	input rst_n,
	input en,
	output geiger_mode_en,
	output quench,
	output reset
    );


reg rquench;
reg rreset;

//50MHz/1MHz/2=25
//50MHz/2MHz/2=12.5
//50MHz/10MHz/2=2.5 (2=>12.5MHz)
//50MHz/1KHz=50,000
//50MHz/10KHz/2=2500
//50MHz/100KHz/2=250
//1KHz generator.
reg [15:0] cnt_1KHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1KHz<=16'd0;
else if(cnt_1KHz>=16'd50_000-1)
	cnt_1KHz<=16'd0;
else
	cnt_1KHz<=cnt_1KHz+1'b1;

//another counter to slow down 1KHz.
reg [2:0] counter;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					counter<=3'd0;
				end
else if(cnt_1KHz>=16'd50_000-1)	begin
									counter<=counter+1'b1;
								end
//driven by Step i.
//quench=1, Vsapd=Vhvps-17.5V
//reset=1,	Vsapd=Vhvps
//				  _____
//quench	_____|     |_________________
//							  _____
//reset		_________________|     |_____
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rreset<=1'b0;
				rquench<=1'b0;
			end
else 	begin
			case(counter)
				3'd0:			begin	rquench<=1'b0; rreset<=1'b0; end
				3'd1,3'd2: 		begin	rquench<=1'b1; rreset<=1'b0; end
				3'd3,3'd4: 		begin	rquench<=1'b0; rreset<=1'b0; end
				3'd5,3'd6: 		begin	rquench<=1'b0; rreset<=1'b1; end
				default: 		begin	rquench<=1'b0; rreset<=1'b0; end
			endcase
		end


//always Enable Geiger Mode.
assign geiger_mode_en=1'b1;

//for single step debug.
assign reset=1'b0;
assign quench=1'b0;

//for continuous running.
//assign reset=rreset;
//assign quench=rquench;

endmodule
