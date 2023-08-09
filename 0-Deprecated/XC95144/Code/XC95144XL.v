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
    output [3:0] led,
	 output geiger_mode_en,
	output quench,
	output reset
    );

reg [3:0] rled;
reg rquench;
reg rreset;

//50MHz/1MHz/2=25
//50MHz/2MHz/2=12.5
//50MHz/10MHz/2=2.5 (2=>12.5MHz)
//50MHz/1KHz=50,000
//50MHz/10KHz/2=2500
//50MHz/100KHz/2=250
reg [15:0] cnt_1KHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1KHz<=16'd0;
else if(cnt_1KHz>=16'd50_000-1)
	cnt_1KHz<=16'd0;
else
	cnt_1KHz<=cnt_1KHz+1'b1;

//use counter to drive design.
reg [2:0] counter;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					counter<=3'd0;
				end
else if(cnt_1KHz>=16'd50_000-1)	begin
												counter<=counter+1'b1;
											end
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					rreset<=1'b0;
					rquench<=1'b0;
				end
else 	begin
			case(counter)
				3'd0:				begin	rquench<=1'b0; rreset<=1'b0; end
				3'd1,3'd2: 		begin	rquench<=1'b1; rreset<=1'b0; end
				3'd3,3'd4: 			begin	rquench<=1'b0; rreset<=1'b0; end
				3'd5,3'd6: 		begin	rquench<=1'b0; rreset<=1'b1; end
				default: 		begin	rquench<=1'b0; rreset<=1'b0; end
			endcase
		end
//2Hz to drive LED.
//1KHz/500=2Hz.
reg [8:0] cnt_2Hz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					cnt_2Hz<=9'd0; 
				end
else if(cnt_1KHz>=16'd50_000-1)	begin
												if(cnt_2Hz>=9'd500)	begin
																				cnt_2Hz<=9'd0;
																			end
												else	begin
															cnt_2Hz<=cnt_2Hz+1'b1;
														end
											end
//led4: sysclk.
//led3: geiger_mode_en, always be 1.
//led2: quench.
//led1: reset.
assign led[3]=(cnt_2Hz>9'd200)?1'b1:1'b0;
//led.
assign led[2:0]={1'b1,rled[1],rled[0]};
//always Enable Geiger Mode.
//assign geiger_mode_en=1'b1;
assign reset=rreset;
//assign reset=1'b0;
assign quench=rquench;
//assign quench=1'b0;
endmodule
