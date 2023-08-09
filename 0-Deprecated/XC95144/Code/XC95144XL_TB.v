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
module XC95144XL_TB;
//input 
reg clk;
reg rst_n;

//output
wire [3:0] led;
wire quench_en_n;
wire quench_pwm;
wire rst_en;
wire rst_pwm;

XC95144XL inst(
    .clk(clk),
    .rst_n(rst_n),
    .led(led),
	.quench_en_n(quench_en_n),
	.quench_pwm(quench_pwm),
	.rst_en(rst_en),
	.rst_pwm(rst_pwm)
    );
initial begin
	clk=0;
	forever #50 clk=~clk;
end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#20;
        rst_n =1;
	end
endmodule
