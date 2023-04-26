`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:03 04/25/2023 
// Design Name: 
// Module Name:    ZPushButton_Adapter 
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
`include "../ColorTable/ZRGB565_ColorTable.v"
module ZPushButton_Adapter(
    input clk,
    input rst_n,
    input en,

    //[0]: Previous,[1]:Next,[2]:Okay,[3]:Cancel.
    input [3:0] iButton,
    output reg[3:0] oCursor_Index,
    //How many SIN periods we draw on LCD.
    //Period1,Period2,Period3,Period4,Period5.
    output reg [2:0] oActive_Periods_Num,

    //PulseCounter Gain Divider.
    output reg [1:0] oPulseCounter_Gain_Divider
    );

////////////////////////////
wire [3:0] button_state;
ZPush_Button ic_PushButton(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    //[0]: Previous,[1]:Next,[2]:Okay,[3]:Cancel.
    .iButton(iButton),
    .oButton(button_state)
    );
////////////////////////////
parameter MAX_CURSOR_INDEX=10;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			oCursor_Index<=0;
			oActive_Periods_Num<=0;
		end
else if(en) begin
			if(button_state[0]) begin
				if(oCursor_Index>=1)
					oCursor_Index<=oCursor_Index-1;
				else
					oCursor_Index<=MAX_CURSOR_INDEX;
							end
			else if(button_state[1]) begin
				if(oCursor_Index<=MAX_CURSOR_INDEX-1)
					oCursor_Index<=oCursor_Index+1;
				else
					oCursor_Index<=0;
								end
			//////////////////////////////////////////////////////////////////
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_PERIOD1) begin
					oActive_Periods_Num<=0;
																		end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_PERIOD2) begin
					oActive_Periods_Num<=1;
																		end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_PERIOD3) begin
					oActive_Periods_Num<=2;
																		end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_PERIOD4) begin
					oActive_Periods_Num<=3;
																		end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_PERIOD5) begin
					oActive_Periods_Num<=4;
																		end
			//////////////////////////////////////////////////////////////////
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_DIV0) begin
					oPulseCounter_Gain_Divider<=0;
																	end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_DIV2) begin
					oPulseCounter_Gain_Divider<=1;
																	end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_DIV4) begin
					oPulseCounter_Gain_Divider<=2;
																	end
			else if(button_state[2] && oCursor_Index==`ZCURSOR_INDEX_DIV8) begin
					oPulseCounter_Gain_Divider<=3;
																	end
		 end
	else begin
			oCursor_Index<=0;
			oActive_Periods_Num<=0;
			oPulseCounter_Gain_Divider<=0;
		end
endmodule
