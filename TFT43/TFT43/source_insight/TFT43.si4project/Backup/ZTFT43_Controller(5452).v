`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:32 03/21/2023 
// Design Name: 
// Module Name:    ZTFT43_Controller 
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
module ZTFT43_Controller(
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

reg en_TFT43;
reg [3:0] iTrigger_TFT43;
reg [15:0] iData1_TFT43;
reg [15:0] iData2_TFT43;
wire oDone_TFT43;
ZTFT43_Module ic_TFT43(
    .clk(clk_20MHz), //input.
    .rst_n(rst_n), //input.
    .en(en_TFT43), //input.
	//0: Idle.
	//1: Reset LCD.
	//2: Initial All Registers.
	//3: Set Column Start/End Address, xStart=0, xEnd=800-1.
	//4: Set Page Start/End Address, yStart=0, yEnd=480-1.
	//5: GRAM Operation, iData1=0:start to read GRAM, iData1=1, start to Write GRAM.
	//6: Display Operation, iData1=0:Display OFF, iData1=1:Display ON.
	//7: Write Data, iData1 as Data.
	.iTrigger(iTrigger_TFT43), //input.
	.iData1(iData1_TFT43), //input.
	.iData2(iData2_TFT43), //input.
	.oDone(oDone_TFT43), //output.
	
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST), //output.
    .BL_CTR(BL_CTR), //output, BackLight Ctrl.
    .LCD_CS(LCD_CS), //output.
    .LCD_RS(LCD_RS), //output.
    .LCD_WR(LCD_WR), //output.
    .LCD_RD(LCD_RD), //output.
    .LCD_DATA(LCD_DATA) //output.
    );

reg [15:0] x_addr;
reg [15:0] y_addr;

//driven by step i.
reg [3:0] i;
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				x_addr<=16'd0;
				y_addr<=16'd0;
			end
else case(i)
		4'd0: //Reset LCD.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin en_TFT43<=1'b1; iTrigger_TFT43<=4'd1; end
		4'd1: //Initial All Registers.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin en_TFT43<=1'b1; iTrigger_TFT43<=4'd2; end
		4'd2: //Set Column Start/End Address, xStart=0, xEnd=480-1. (480*800,0~480-1/0x1DF)
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd3;
					iData1_TFT43<=16'd0; //xStart.
					iData2_TFT43<=16'd800-1; //xEnd.
				end
		4'd3: //Set Page Start/End Address, yStart=0, yEnd=800-1. (480*800,0~800-1/0x31F)
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd4; 
					iData1_TFT43<=16'd0; //yStart.
					iData2_TFT43<=16'd480-1; //yEnd.
				end
		4'd4: //Start Write Memory.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd5; //GRAM Operation.
					iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.
				end
		4'd5: //Fill GRAM with Black color.
			if(x_addr==16'd800-1) begin x_addr<=16'd0; i<=i+1'b1; end
			else if(y_addr==16'd480-1) begin y_addr<=16'd0; x_addr<=x_addr+1'b1; end
				else begin
						if(oDone_TFT43) begin en_TFT43<=1'b0; y_addr<=y_addr+1'b1; end
						else begin 
								en_TFT43<=1'b1; 
								iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
								iData1_TFT43<=16'h07E0;
							end
					end
		4'd6: //Fill Rect. (10,10) -> (100,100), then xStart=10,xEnd=100,yStart=10,yEnd=100.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd3; //Set Column Address. //X-Y Change,so here is Y.
					iData1_TFT43<=16'd0; //xStart. (Actually yStart)
					iData2_TFT43<=16'd100; //xEnd. (Actually yEnd)
				end
		4'd7: //Fill Rect. (10,10) -> (100,100), then xStart=10,xEnd=100,yStart=10,yEnd=100.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd4; //Set Page Address. //X-Y Change,so here is X.
					iData1_TFT43<=16'd0; //yStart. (Actually xStart)
					iData2_TFT43<=16'd200; //yEnd. (Actually xEnd)
				end
		4'd8: //Start Write Memory.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; x_addr<=16'd0; y_addr<=16'd0; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd5; //GRAM Operation.
					iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.
				end
		4'd9: //Loop to Tx Data.
			if(x_addr==16'd200-1) begin x_addr<=16'd0; i<=i+1'b1; end
			else if(y_addr==16'd100-1) begin y_addr<=16'd0; x_addr<=x_addr+1'b1; end
				else begin
						if(oDone_TFT43) begin en_TFT43<=1'b0; y_addr<=y_addr+1'b1; end
						else begin 
								en_TFT43<=1'b1; 
								iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
								iData1_TFT43<=16'hFFE3;
							end
					end
		4'd10: //Display ON.
			if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT43<=1'b1; 
					iTrigger_TFT43<=4'd6; ////Display Operation.
					iData1_TFT43<=16'd1; //iData1=1:Display ON.
				end
		4'd11:
			i<=i;
	endcase
endmodule
