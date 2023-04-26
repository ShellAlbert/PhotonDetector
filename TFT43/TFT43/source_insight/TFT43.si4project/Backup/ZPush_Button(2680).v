`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:58 04/25/2023 
// Design Name: 
// Module Name:    zpush_button 
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
module ZPush_Button(
    input clk,
    input rst_n,
    input en,
    //[0]: Previous,[1]:Next,[2]:Okay,[3]:Cancel.
    input [3:0] iButton,
    output reg [3:0] oButton
    );

//delay 2 clk to sync to main clk.
reg [3:0] button_delay1;
reg [3:0] button_delay2;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			button_delay1<=4'b1111;
			button_delay2<=4'b1111;
		end
else if(en) begin
			button_delay1<=iButton;
			button_delay2<=button_delay1;
		 end
	else begin
			button_delay1<=4'b1111;
			button_delay2<=4'b1111;
		end
//button: normal(1), push down(0).
//rising edge
wire [3:0] rising_edge;
assign rising_edge=(button_delay1 & ~button_delay2);
wire [3:0] falling_edge;
assign falling_edge=(~button_delay1 & button_delay2);

//500ms to bypass noice.
//80MHz, 1s/80MHz=1000ms/80MHz=1000,000us/80,000,000Hz=1/80us=0.0125uS.
//500mS/0.0125uS=40,000,000.
//250mS/0.0125uS=20,000,000
///////////////////////////////////////////////////////
reg [31:0] cnt1;
reg [7:0] i1;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			cnt1<=0;
			i1<=0;
			oButton[0]<=1'b0;
		end
else if(en) begin
			case(i1)
				0: //detected falling edge.(High to Low)
					if(falling_edge) begin i1<=i1+1; end
				1: //delay 250ms.
					if(cnt1==20_000_000) begin cnt1<=0; i1<=i1+1; end
					else begin cnt1<=cnt1+1; end
				2: //re-check input state, if it's still low, button was pressed down indeed.
					if(!iButton[0]) begin i1<=i1+1; end
					else begin 
							i1<=0; //Noise. Re-detect.
						end
				3:
					begin oButton[0]<=1'b1; i1<=i1+1; end
				4:
					begin oButton[0]<=1'b0; i1<=0; end
			endcase
		end
	else begin
			cnt1<=0;
			i1<=0;
			oButton[0]<=1'b0;
		end
///////////////////////////////////////////////////////
reg [31:0] cnt2;
reg [7:0] i2;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			cnt2<=0;
			i2<=0;
			oButton[1]<=1'b0;
		end
else if(en) begin
			case(i2)
				0: //detected falling edge.(High to Low)
					if(falling_edge) begin i2<=i2+1; end
				1: //delay 250ms.
					if(cnt2==20_000_000) begin cnt2<=0; i2<=i2+1; end
					else begin cnt2<=cnt2+1; end
				2: //re-check input state, if it's still low, button was pressed down indeed.
					if(!iButton[1]) begin i2<=i2+1; end
					else begin 
							i2<=0; //Noise. Re-detect.
						end
				3:
					begin oButton[1]<=1'b1; i2<=i2+1; end
				4:
					begin oButton[1]<=1'b0; i2<=0; end
			endcase
		end
	else begin
			cnt2<=0;
			i2<=0;
			oButton[1]<=1'b0;
		end
///////////////////////////////////////////////////////
reg [31:0] cnt3;
reg [7:0] i3;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			cnt3<=0;
			i3<=0;
			oButton[2]<=1'b0;
		end
else if(en) begin
			case(i3)
				0: //detected falling edge.(High to Low)
					if(falling_edge) begin i3<=i3+1; end
				1: //delay 250ms.
					if(cnt3==20_000_000) begin cnt3<=0; i3<=i3+1; end
					else begin cnt3<=cnt3+1; end
				2: //re-check input state, if it's still low, button was pressed down indeed.
					if(!iButton[2]) begin i3<=i3+1; end
					else begin 
							i3<=0; //Noise. Re-detect.
						end
				3:
					begin oButton[2]<=1'b1; i3<=i3+1; end
				4:
					begin oButton[2]<=1'b0; i3<=0; end
			endcase
		end
	else begin
			cnt3<=0;
			i3<=0;
			oButton[2]<=1'b0;
		end
///////////////////////////////////////////////////////
reg [31:0] cnt4;
reg [7:0] i4;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			cnt4<=0;
			i4<=0;
			oButton[3]<=1'b0;
		end
else if(en) begin
			case(i4)
				0: //detected falling edge.(High to Low)
					if(falling_edge) begin i4<=i4+1; end
				1: //delay 250ms.
					if(cnt4==20_000_000) begin cnt4<=0; i4<=i4+1; end
					else begin cnt4<=cnt4+1; end
				2: //re-check input state, if it's still low, button was pressed down indeed.
					if(!iButton[3]) begin i4<=i4+1; end
					else begin 
							i4<=0; //Noise. Re-detect.
						end
				3:
					begin oButton[3]<=1'b1; i4<=i4+1; end
				4:
					begin oButton[3]<=1'b0; i4<=0; end
			endcase
		end
	else begin
			cnt4<=0;
			i4<=0;
			oButton[3]<=1'b0;
		end
endmodule
