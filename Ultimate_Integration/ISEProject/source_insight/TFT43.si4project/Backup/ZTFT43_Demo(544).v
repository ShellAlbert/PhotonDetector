`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:21 03/22/2023 
// Design Name: 
// Module Name:    ZTFT43_Demo 
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
module ZTFT43_Demo(
    input clk,

	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );

wire clk_20MHz;
wire rst_n;
ZsyPLL ic_PLL
(// Clock in ports
.CLK_IN1(clk),      // IN
// Clock out ports
.CLK_OUT1(clk_20MHz),     // OUT
// Status and control signals
.LOCKED(rst_n));      // OUT

reg en_TFT;
reg [3:0] trigger_TFT;
reg [15:0] data1_TFT;
reg [15:0] data2_TFT;
reg [15:0] data3_TFT;
reg [15:0] data4_TFT;
reg [15:0] data5_TFT;
wire done_TFT;
ZTFT43_Controller ic_TFT_Controller(
    .clk(clk_20MHz),
	.rst_n(rst_n),
	.en(en_TFT),
	
	//Trigger Command.
	//0: Initial TFT Module.
	//1: Set CASET/RASET, iData1=xStart,iData2=xEnd,iData3=yStart,iData4=yEnd.
	//2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
	//3. Draw A Line, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
	.iTrigger(trigger_TFT), //input.
	.iData1(data1_TFT),
	.iData2(data2_TFT),
	.iData3(data3_TFT),
	.iData4(data4_TFT),
	.iData5(data5_TFT),
	.oDone(done_TFT),
	
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST), //output.
    .BL_CTR(BL_CTR), //output, BackLight Ctrl.
    .LCD_CS(LCD_CS), //output.
    .LCD_RS(LCD_RS), //output.
    .LCD_WR(LCD_WR), //output.
    .LCD_RD(LCD_RD), //output.
    .LCD_DATA(LCD_DATA) //output.
    );

//driven by step i.
reg [3:0] i;
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				en_TFT<=1'b0;
				trigger_TFT<=4'd0;
			end
else case(i)
		4'd0: //Initial TFT.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd0; //0.Initial LCD.
				end
		/*
		4'd1: //Draw A Point (200,80) with RED color.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2.Draw A Point.
					data1_TFT<=16'd200; 
					data2_TFT<=16'd80;
					data3_TFT<=16'hF800; //RED.
				end
		4'd2: //Fill A Rectangle(200,200) -> (240,600).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4.Fill A Rectangle.
					data1_TFT<=16'd200; //(x1) 
					data2_TFT<=16'd200; //(y1)
					data3_TFT<=16'd240-1; //(x2)
					data4_TFT<=16'd600-1; //(y2)
					data5_TFT<=16'hFE00; //Color.
				end
		*/
		4'd1: //Fill A Rectangle(0,0) -> (40,600).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4.Fill A Rectangle.
					data1_TFT<=16'd240; //(x1) 
					data2_TFT<=16'd400; //(y1)
					data3_TFT<=16'd260-1; //(x2)
					data4_TFT<=16'd700-1; //(y2)
					data5_TFT<=16'hFE00; //Color.
				end
		4'd2:
			i<=i;
	endcase
endmodule
