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
	output quench_en_n,
	output quench_pwm,
	output rst_en,
	output rst_pwm
    );

reg [3:0] rled;


//50MHz/1MHz/2=25
//50MHz/2MHz/2=12.5
//50MHz/10MHz/2=2.5 (2=>12.5MHz)
//50MHz/10KHz/2=2500
//50MHz/100KHz/2=250
reg [7:0] cnt_1MHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1MHz<=8'd0;
else if(cnt_1MHz>=8'd12-1)
	cnt_1MHz<=8'd0;
else
	cnt_1MHz<=cnt_1MHz+1'b1;

//quench.
reg rquench_pwm;

always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					rled<=4'b1111; //all off.
					rquench_pwm<=1'b0;
				end
else if(cnt_1MHz>=8'd12-1)	begin
												rled<=rled+1'b1;
												rquench_pwm<=~rquench_pwm;
									end
//led.
assign led=rled;

assign quench_en_n=1'b0;
assign quench_pwm=rquench_pwm;
//assign quench_pwm=1'b0;

//because the rst_pwm pin was shorted to GND due to soldering error.
//so rst_pwm can't output 1.
//output 1 will increase 100mA current, CPLD's temperature will raise.
assign rst_en=1'b0;
//assign rst_pwm=1'b0;
assign rst_pwm=rquench_pwm;
endmodule
