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
module ZPushButton_Adapter(
    input clk,
    input rst_n,
    input en,

    //[0]: Previous,[1]:Next,[2]:Okay,[3]:Cancel.
    input [3:0] iButton,
    output reg[3:0] oCursor_Index,
    output [1:0] oOkayCancel;
    );

////////////////////////////
wire [3:0] button_state;
assign oOkayCancel=button_state[3:2];
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
		 end
	else begin
			oCursor_Index<=0;
		end
endmodule
