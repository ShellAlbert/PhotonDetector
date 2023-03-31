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
    //[10]=01:Only Write Command, iData1 as command.
    //[10]=10:Only Write Data, iData1 as data.
    //[10]=11:Write Command+Data, iData1 as command, iData2 as data.
    //[10]=00: Reset LCD.
    input [1:0] iTrigger,
    input [15:0] iData1,
    input [15:0] iData2,

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
				rLCD_WR<=1'b1;
				rLCD_RD<=1'b1;
				rLCD_DATA<=16'd0;
				rLCD_RST<=1'b1;
				rBL_CTR<=1'b0;
				roDone<=1'b0;
				i<=4'd0;
			end
else if(en)	begin
				case(iTrigger)
				2'b00: //Reset LCD.
					case(i)
						4'd0:
							begin rLCD_RST<=1'b1; rBL_CTR<=1'b0; i<=i+1'b1; end
						4'd1:
							//use rLCD_DATA as Counter to save resource.
							if(rLCD_DATA==16'hFFFF) begin rLCD_DATA<=16'd0; i<=i+1'b1; end
							else begin rLCD_RST<=1'b0; rLCD_DATA<=rLCD_DATA+1'b1; end
						4'd2:
							begin rLCD_RST<=1'b1; i<=i+1'b1; end
						4'd3:
							begin roDone<=1'b1; i<=i+1'b1; end
						4'd4:
							begin 
								roDone<=1'b0; 
								rBL_CTR<=1'b1; //BackLight ON.
								i<=4'd0; 
							end
					endcase
				2'b01: //Only Write Command.
					case(i)
						4'd0:
							begin
								rLCD_CS<=1'b0;
								rLCD_RS<=1'b0;//Cmd=0,Data=1.
								rLCD_DATA<=iData1;
								rLCD_WR<=1'b0;
								i<=i+1'b1;
							end
						4'd1:
							begin rLCD_WR<=1'b1; i<=i+1'b1; end
						4'd2:
							begin rLCD_WR<=1'b0; rLCD_CS<=1'b1; roDone<=1'b1; i<=i+1'b1; end
						4'd3:
							begin roDone<=1'b0; i<=4'd0; end
					endcase
				2'b10: //Only Write Data.
					case(i)
						4'd0:
							begin
								rLCD_CS<=1'b0;
								rLCD_RS<=1'b1;//Cmd=0,Data=1.
								rLCD_DATA<=iData1;
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
							begin roDone<=1'b0; i<=i+4'd0; end
					endcase
				2'b11: //Write Command+Data.
					case(i)
						4'd0:
							begin
								rLCD_CS<=1'b0;
								rLCD_RS<=1'b0;//Cmd=0,Data=1.
								rLCD_DATA<=iData1; //Command.
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
								rLCD_DATA<=iData2; //Data.
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
							begin roDone<=1'b0; i<=i+4'd0; end
					endcase
				endcase
			end
	else begin 
			roDone<=1'b0;
			i<=4'd0;
		end
endmodule
