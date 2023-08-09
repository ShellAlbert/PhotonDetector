`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:01 03/20/2023 
// Design Name: 
// Module Name:    ZTFT43_Module 
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
module ZTFT43_Module(
    input clk,
    input rst_n,
    input en,
	//0: Reset LCD.
	//1: Initial All Registers.
    //2: LCD_CS, iData=1,High; iData=0,Low.
	//3: Write data, iData=data.
	//4: Write command, iData=command.
	//5: CA_RA_SET, iData1=xStart, iData2=xEnd, iData3=yStart, iData4=yEnd.
	input [3:0] iTrigger,
	input [15:0] iData,
	output oDone,
	
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );
reg oDone_r;
assign oDone=oDone_r;

reg rLCD_RST;
reg rBL_CTR;
reg rLCD_CS;
reg rLCD_RS;
reg rLCD_WR;
reg rLCD_RD;
reg [15:0] rLCD_DATA;

assign LCD_RST=rLCD_RST;
assign BL_CTR=rBL_CTR;
assign LCD_CS=rLCD_CS;
assign LCD_RS=rLCD_RS;
assign LCD_WR=rLCD_WR;
assign LCD_RD=rLCD_RD;
assign LCD_DATA=rLCD_DATA;
////////////////////////////////
//M9K Configure Register Address+Data.
reg [8:0] index;
wire [15:0] regAddr;
wire [15:0] regData;
ZTFT43_CfgData ic_CfgData(
    .iIndex(index), //input.
    .oRegAddr(regAddr), //output, register address.
    .oRegData(regData) //output, register data.
    );

//driven by step i.
reg [3:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				rBL_CTR<=1'b0; //BackLight OFF.
				rLCD_RST<=1'b1; //Low to Reset.
				rLCD_CS<=1'b1; //Active Low.
				rLCD_RS<=1'b1;
				rLCD_WR<=1'b1;
				rLCD_RD<=1'b1;
				rLCD_DATA<=16'd0;

				i<=4'd0;
				oDone_r<=1'b0;
				index<=9'd0;
			end
else if(en)	begin
				case(iTrigger)
					4'd0: //0: Reset LCD.
						case(i)
							4'd0:
								begin rLCD_RST<=1'b0; i<=i+1'b1; end
							4'd1:
								//use rLCD_DATA as Counter to save resource.
								if(rLCD_DATA==16'hFFFF) begin rLCD_DATA<=16'd0; i<=i+1'b1; end
								else begin rLCD_RST<=1'b0; rLCD_DATA<=rLCD_DATA+1'b1; end
							4'd2:
								begin rLCD_RST<=1'b1; i<=i+1'b1; end
							4'd3:
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd4:
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd1: //1: Initial All Registers.
						case(i)
							4'd0:
								begin 
									rLCD_CS<=1'b0; 
									rLCD_RS<=1'b0; //Command.
									rLCD_DATA<=regAddr;
									rLCD_WR<=1'b0;
									i<=i+1'b1;
								end
							4'd1: //Generate Rising edge of WR.
								begin rLCD_WR<=1'b1; i<=i+1'b1; end
							4'd2:
								begin 
									rLCD_RS<=1'b1; //Data.
									rLCD_DATA<=regData; 
									rLCD_WR<=1'b0;
									i<=i+1'b1;
								end
							4'd3: //Generate Rising edge of WR.
								begin rLCD_WR<=1'b1; i<=i+1'b1; end
							4'd4: 
								if(index==9'd380+1) begin index<=9'd0; rLCD_CS<=1'b1; i<=i+1'b1; end
								else begin index<=index+1'b1; i<=4'd0; end
 							4'd5: //Exit Here.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd6: //BackLight ON.
								begin oDone_r<=1'b0; i<=4'd0; rBL_CTR<=1'b1; end
						endcase
					4'd2: //2: LCD_CS, iData=1,High; iData=0,Low.
						case(i)
							4'd0:
								begin rLCD_CS<=(iData==16'd1) ? 1'b1: 1'b0; i<=i+1'b1; end
							4'd1:
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd2:
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd3: //3: Write data, iData=data.
						case(i)
							4'd0: //RS=1:Data.
								begin rLCD_WR<=1'b0; rLCD_RS<=1'b1; rLCD_DATA<=iData; i<=i+1'b1; end
							4'd1: //generate Rising edge of WR.
								begin rLCD_WR<=1'b1; i<=i+1'b1; end
							4'd2:
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd3:
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd4: //4: Write command, iData=command.
						case(i)
							4'd0: //RS=0:CMD.
								begin rLCD_WR<=1'b0; rLCD_RS<=1'b0; rLCD_DATA<=iData; i<=i+1'b1; end
							4'd1: //generate Rising edge of WR.
								begin rLCD_WR<=1'b1; i<=i+1'b1; end
							4'd2:
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd3:
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd5: //Other Command.
						begin rLCD_DATA<=iData; end
				endcase
			end
//////////////////////////////////////////////
endmodule
