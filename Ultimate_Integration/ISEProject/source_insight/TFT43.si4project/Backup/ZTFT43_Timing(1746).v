`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:33 03/20/2023 
// Design Name: 
// Module Name:    ZTFT43_Timing 
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
module ZTFT43_Timing(
    input clk,
    input rst_n,
    input en,
    //Input Trigger.
    //[0]=1:Only Write Command.
    //[1]=1:Write Command+Data.
    input [1:0] iTrigger,
    input [15:0] iCommand,
    input [15:0] iData,

    //physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA,

    output oDone //done signal.
    );
reg rLCD_RST;
reg rBL_CTR;
reg rLCD_CS;
reg rLCD_RS;
reg rLCD_WR;
reg rLCD_RD;
reg [15:0] rLCD_DATA;
reg roDone;

assign LCD_RST=rLCD_RST;
assign BL_CTR=rBL_CTR;
assign LCD_CS=rLCD_CS;
assign LCD_RS=rLCD_RS;
assign LCD_WR=rLCD_WR;
assign LCD_RD=rLCD_RD;
assign LCD_DATA=rLCD_DATA;
assign oDone=roDone;

//driven by step i.
reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				rLCD_CS<=1'b1;
				rLCD_RS<=1'b1;
				rLCD_WR<=1'b0;
				rLCD_RD<=1'b1;
				rLCD_DATA<=16'd0;
				roDone<=1'b0;

				i<=4'd0;
			end
else if(en)	begin
				case(iTrigger)
				2'b01: //Only Write Command.
					case(i)
						4'd0:
							begin
								rLCD_CS<=1'b0;
								rLCD_RS<=1'b0;//Cmd=0,Data=1.
								rLCD_DATA<=iCommand;
								rLCD_WR<=1'b0;
								i<=i+1'b1;
							end
						4'd1:
							begin
								rLCD_WR<=1'b1;
								i<=i+1'b1;
							end
						4'd2:
							begin
								rLCD_WR<=1'b0;
								rLCD_CS<=1'b1;
								roDone<=1'b1;
								i<=i+1'b1;
							end
						4'd3:
							begin
								roDone<=1'b0;
								i<=4'd0;
							end
					endcase
				2'b10: //Write Command+Data.
					case(i)
						4'd0:
							begin
								rLCD_CS<=1'b0;
								rLCD_RS<=1'b0;//Cmd=0,Data=1.
								rLCD_DATA<=iCommand;
								rLCD_WR<=1'b0;
								i<=i+1'b1;
							end
						4'd1:
							begin
								rLCD_WR<=1'b1;
								i<=i+1'b1;
							end
						4'd2:
							begin
								rLCD_WR<=1'b0;
								rLCD_RS<=1'b1;//Cmd=0,Data=1.
								rLCD_DATA<=iCommand;
								i<=i+1'b1;
							end
						4'd3:
							begin
								rLCD_WR<=1'b1;
								i<=i+1'b1;
							end
						4'd4:
							begin
								rLCD_WR<=1'b0;
								rLCD_CS<=1'b1;
								roDone<=1'b1;
								i<=i+1'b1;
							end
						4'd5:
							begin
								roDone<=1'b1;
								i<=i+4'd0;
							end
					endcase
				endcase
			end
endmodule

