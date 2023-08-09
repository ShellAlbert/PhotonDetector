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
	input rst_n,
	input en,
	//Trigger Command.
	//0: Initial TFT Module.
	//1: Set CASET/RASET, iData1=xStart,iData2=xEnd,iData3=yStart,iData4=yEnd.
	//2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
	//3. Draw A Line, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
	//4. Fill A Rectangle, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
	input [3:0] iTrigger,
	input [15:0] iData1,
	input [15:0] iData2,
	input [15:0] iData3,
	input [15:0] iData4,
	input [15:0] iData5,
	
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
/////////////////////////////////////
reg en_TFT43;
reg [3:0] iTrigger_TFT43;
reg [15:0] iData1_TFT43;
reg [15:0] iData2_TFT43;
wire oDone_TFT43;
ZTFT43_Module ic_TFT43(
    .clk(clk), //input.
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
reg [15:0] x_delta;
reg [15:0] y_delta;
reg x_sign;
reg y_sign;
reg [15:0] error;
reg [15:0] error2;

//driven by step i.
reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				x_addr<=16'd0;
				y_addr<=16'd0;
				oDone_r<=1'b0;
			end
else if(en)	begin
				case(iTrigger)
					4'd0: //0: Initial TFT Module.
						case(i)
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
										iTrigger_TFT43<=4'd3; //CASET,X-Y Exchange Enabled,so here is RASET.
										iData1_TFT43<=16'd0; //xStart.
										iData2_TFT43<=16'd480-1; //xEnd.
									end
									
							4'd3: //Set Page Start/End Address, yStart=0, yEnd=800-1. (480*800,0~800-1/0x31F)
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd4; //RASET:X-Y Exchange Enabled, so here is CASET.
										iData1_TFT43<=16'd0; //yStart.
										iData2_TFT43<=16'd800-1; //yEnd.
									end
									
							4'd4: //Start Write Memory.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd5; //GRAM Operation.
										iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.
									end
									
							4'd5: //Fill GRAM with Black color.
								if(y_addr==16'd800) begin y_addr<=16'd0; i<=i+1'b1; end
								else if(x_addr==16'd480) begin x_addr<=16'd0; y_addr<=y_addr+1'b1; end
									else begin
											if(oDone_TFT43) begin en_TFT43<=1'b0; x_addr<=x_addr+1'b1; end
											else begin 
													en_TFT43<=1'b1; 
													iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
													iData1_TFT43<=16'h0000; //All Black.
												end
										end
							4'd6: //Display ON.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd6; ////Display Operation.
										iData1_TFT43<=16'd1; //iData1=1:Display ON.
									end
							4'd7: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd8: //Done Signal.
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd1: //1: Set CASET/RASET, iData1=xStart,iData2=xEnd,iData3=yStart,iData4=yEnd.
						case(i)
							4'd0: //Fill Rect. (10,10) -> (100,100), then xStart=10,xEnd=100,yStart=10,yEnd=100.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd3; //CASET=Column Address Set.
										iData1_TFT43<=iData1; //XStart
										iData2_TFT43<=iData2; //xEnd
									end
									
							4'd1: //Fill Rect. (10,10) -> (100,100), then xStart=10,xEnd=100,yStart=10,yEnd=100.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd4; //RASET=Row Address Set.
										iData1_TFT43<=iData3; //yStart
										iData2_TFT43<=iData4; //yEnd
									end
									
							4'd2: //Start Write Memory.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd5; //GRAM Operation.
										iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.
									end
							4'd3: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd4: //Done Signal.
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd2: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
						case(i)
							4'd0: //Draw Point: Step1: Set CASET/RASET.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd3; //CASET=Column Address Set.
										iData1_TFT43<=iData1; //XStart
										iData2_TFT43<=iData1; //xEnd
									end
							4'd1: //Draw Point: Step2: Set CASET/RASET.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd4; //RASET=Row Address Set.
										iData1_TFT43<=iData2; //yStart
										iData2_TFT43<=iData2; //yEnd
									end
							4'd2: //Draw Point: Step3: Start to Write GRAM.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd5; //GRAM Operation.
										iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.
									end
							4'd3: //Draw Point: Step4: Write Point Color Data.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
										iData1_TFT43<=iData3; //Color.
									end
							4'd4: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd5: //Done Signal.
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd3: //3. Draw A Line, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
						case(i)
							4'd0:
								begin
									x_delta<=(iData1<iData3) ? (iData3-iData1) : (iData1-iData3);
									y_delta<=(iData2<iData4) ? (iData4-iData2) : (iData2-iData4);
									x_sign<=(iData1<iData3) ? 1'b1 : 1'b0;
									y_sign<=(iData2<iData4) ? 1'b1 : 1'b0;
									i<=i+1'b1;
								end
							4'd1:
								begin
									error<=x_delta-y_delta;
									i<=i+1'b1;
								end
							4'd2:
								i<=4'd0;
						endcase
					4'd4: //4. Fill A Rectangle, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
						case(i)
							4'd0: //Step1: Set CASET.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd3; //CASET=Column Address Set.
										iData1_TFT43<=16'd240; //iData1; //XStart
										iData2_TFT43<=16'd260-1; //iData3; //xEnd
									end
							4'd1: //Step2: Set RASET.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd4; //RASET=Row Address Set.
										iData1_TFT43<=16'd200 //iData2; //yStart
										iData2_TFT43<=16'd600-1; //iData4; //yEnd
									end
							4'd2: //Step3: Start to Write GRAM.
								if(oDone_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin 
										en_TFT43<=1'b1; 
										iTrigger_TFT43<=4'd5; //GRAM Operation.
										iData1_TFT43<=16'd1; //iData1=1, start to Write GRAM.

										x_addr<=16'd0;
										y_addr<=16'd0;
									end
							4'd3: //Step4: Loop to Tx Data. iData4-iData2  iData3-iData1
								if(y_addr==400) begin y_addr<=16'd0; i<=i+1'b1; end
								else if(x_addr==20) begin x_addr<=16'd0; y_addr<=y_addr+1'b1; end
									else begin
											if(oDone_TFT43) begin en_TFT43<=1'b0; x_addr<=x_addr+1'b1; end
											else begin 
													en_TFT43<=1'b1;
													iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
													iData1_TFT43<=16'hF800; //iData5; //Color.
												end
										end
							4'd4: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							4'd5: //Done Signal.
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd5:
						i<=i;
				endcase
			end
//////////////////////////////
/*
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				x_addr<=16'd0;
				y_addr<=16'd0;
			end
else case(i)


				
		4'd10: //Loop to Tx Data.
			if(x_addr==16'd800) begin x_addr<=16'd0; i<=i+1'b1; end
			else if(y_addr==16'd20) begin y_addr<=16'd0; x_addr<=x_addr+1'b1; end
				else begin
						if(oDone_TFT43) begin en_TFT43<=1'b0; y_addr<=y_addr+1'b1; end
						else begin 
								en_TFT43<=1'b1; 
								iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
								iData1_TFT43<=16'h320;
							end
					end
					

	endcase
*/
endmodule
