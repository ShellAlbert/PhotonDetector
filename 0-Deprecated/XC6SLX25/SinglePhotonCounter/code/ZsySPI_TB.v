`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:50:24 10/28/2022
// Design Name:   ZsySPI
// Module Name:   D:/Work/GitHub/SAPDXC/SAPDXC/Code/ZsySPI_TB.v
// Project Name:  SAPDXC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ZsySPI
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ZsySPI_TB;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire cs_n;
	wire sclk;
	wire dc;
	wire sdin;
	wire isDone;

	reg en;
	reg [7:0] txByte;
	reg dc_flag;
	// Instantiate the Unit Under Test (UUT)
	ZsySPI_TxByte uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.en(en),
		.txByte(txByte),
		.dc_flag(dc_flag),
		.cs_n(cs_n), 
		.sclk(sclk), 
		.dc(dc), 
		.sdin(sdin), 
		.isDone(isDone)
	);


initial begin
	forever #50 clk=~clk;
end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        rst_n =1;
		// Add stimulus here
        
		//100ms=100,000us=100,000,000ns
		//#100000000;
		//1s=1000ms=1000,000us=1000,000,000ns
		#1000000000;
		
		//don't use $finish(x) it will force ModelSim to quit.
		//$finish(0);
		//$stop(0);
        
	end
reg [2:0] i;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=3'd0;
				en<=1'b0;
			end
else	case(i)
			3'd0:
				if(isDone)	begin
								en<=1'b0;
								i<=i+1;
							end
				else	begin
							en<=1'b1;
							dc_flag<=1'b1;
							txByte<=8'h55;
						end
			3'd1:
				if(isDone)	begin
								en<=1'b0;
								i<=i+1;
							end
				else	begin
							en<=1'b1;
							dc_flag<=1'b1;
							txByte<=8'haa;
						end
			default:
				i<=i;
		endcase
endmodule

