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
    input iClk,
    input iRst_N,
    input iEn,

    input [7:0] iTxData,
    output reg oTxPin,
    output reg oTxDone
    );
parameter BPS1Mbps=100; //100MHz/1MHz=100.

//driven by step i.
reg [7:0] step_i;
reg [10:0] D1;//start(1)+data(8)+stop(1).
reg [7:0] C1;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N)	begin
	step_i<=0;
	C1<=0;
	oTxPin<=1'b1; //Idle=1.
	oTxDone<=1'b0;
end
else if(iEn) begin  //active when enable.
				case(step_i)
				0: //start bit=0, stop bit=1.
				begin
					D1<={1'b1,iTxData[7:0],1'b0}; //LSB First.
					C1<=0;
					step_i<=step_i+1;
				end
				1,2,3,4,5,6,7,8,9,10: //1+8+1=10bits.
				begin
					if(C1==BPS1Mbps) begin C1<=0; step_i<=step_i+1; end
					else begin oTxPin<=D1[step_i-1]; C1<=C1+1; end
				end
				11: //Single Pulse Done Signal -- HIGH.
				begin oTxDone<=1'b1; step_i<=step_i+1; end
				12: //Single Pulse Done Signal -- LOW.
				begin oTxDone<=1'b0; step_i<=0; end
				endcase
			end
	else begin
			step_i<=0;
			oTxPin<=1'b1; //Idle=1.
			oTxDone<=1'b0;
	end
endmodule
