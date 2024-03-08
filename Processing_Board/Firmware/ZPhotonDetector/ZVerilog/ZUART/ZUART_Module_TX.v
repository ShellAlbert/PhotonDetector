`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:17 02/17/2023 
// Design Name: 
// Module Name:    ZUART_Module_TX 
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
module ZUART_Module_TX(
    input clk,
    input rst_n,
    input en,
    input bps_clk,
    input [7:0] data,
    output tx_pin,
    output done
    );
	 
reg rtx_pin;
reg rdone;

//driven by step i.
reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
					i<=4'd0;
					rtx_pin<=1'b1; //tx_pin is 1 at idle.
					rdone<=1'b0;
				end
else	if(en)	begin  //active when enable.
					case(i)
					4'd0: //start bit.
							if(bps_clk)	begin
											rtx_pin<=1'b0; 
											i<=i+1'b1;
										end
					4'd1,4'd2,4'd3,4'd4,4'd5,4'd6,4'd7,4'd8: //8 bit data bits.
							if(bps_clk)	begin
											rtx_pin<=data[i-1]; //LSB first.
											i<=i+1'b1;
										end
					4'd9: //parity bit.
							if(bps_clk)	begin
											rtx_pin<=1'b1;
											i<=i+1'b1;
										end
					4'd10: //stop bit.
							if(bps_clk)	begin
											rtx_pin<=1'b1;
											i<=i+1'b1;
										end
					4'd11: //take up one clk to generate done.
							if(bps_clk)	begin
											rdone<=1'b1;
											i<=i+1'b1;
										end
					4'd12: //take up one clk to generate done.
							begin
								rdone<=1'b0;
								i<=4'd0;
							end
					endcase
				end
		else	begin
					i<=4'd0;
					rtx_pin<=1'b1; //tx_pin is 1 at idle.
					rdone<=1'b0;
				end
				
//output signal.
assign tx_pin=rtx_pin;
assign done=rdone;
endmodule
