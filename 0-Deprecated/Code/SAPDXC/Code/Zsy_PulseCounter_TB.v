`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:15 11/02/2022
// Design Name:   Zsy_PulseCounter
// Module Name:   D:/Work/GitHub/PhotonDetector/Code/SAPDXC/Code/Zsy_PulseCounter_TB.v
// Project Name:  SAPDXC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Zsy_PulseCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Zsy_PulseCounter_TB;

	// Inputs
	reg clk;
	reg rst_n;
	reg en;
	reg pulse;

	// Outputs
	wire [3:0] q0;
	wire [3:0] q1;
	wire [3:0] q2;
	wire [3:0] q3;
	wire [3:0] q4;
	wire [3:0] q5;
	wire [3:0] q6;
	wire [3:0] q7;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	Zsy_PulseCounter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.en(en), 
		.pulse(pulse), 
		.q0(q0), 
		.q1(q1), 
		.q2(q2), 
		.q3(q3), 
		.q4(q4), 
		.q5(q5), 
		.q6(q6), 
		.q7(q7), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		en = 0;
		pulse = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst_n=1;
		en=1;
		
		// Add stimulus here

	end
initial begin
			forever #50 clk=~clk;
		end

initial begin
			forever #124 pulse=~pulse;
		end
endmodule

