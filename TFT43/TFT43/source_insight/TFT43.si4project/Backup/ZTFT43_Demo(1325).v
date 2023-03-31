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
	//1: Clear Screen, iData1=Color.
	//2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
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


reg [7:0] cnt;
//driven by step i.
reg [4:0] i;
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				i<=5'd0;
				en_TFT<=1'b0;
				cnt<=8'd0;
			end
else case(i)
		5'd0: //0:Initial TFT.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd0; //0:Initial TFT.
				end
		5'd1: //1:Clear Screen with Color.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd1; //1:Clear Screen with Color.
					data1_TFT<=16'h0000;
				end
		5'd2: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2:Draw A Point.
					data1_TFT<=16'd10-1;
					data2_TFT<=16'd10-1;
					data3_TFT<=16'hFE00;
				end
		5'd3: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2:Draw A Point.
					data1_TFT<=16'd470-1;
					data2_TFT<=16'd10-1;
					data3_TFT<=16'hFE00;
				end
		5'd4: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2:Draw A Point.
					data1_TFT<=16'd10-1;
					data2_TFT<=16'd790-1;
					data3_TFT<=16'hFE00;
				end
		5'd5: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2:Draw A Point.
					data1_TFT<=16'd470-1;
					data2_TFT<=16'd790-1;
					data3_TFT<=16'hFE00;
				end
		5'd6: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd3; //3:Draw A VLine. (5,5)->(5,795)
					data1_TFT<=16'd5-1;
					data2_TFT<=16'd5-1;
					data3_TFT<=16'd795-1;
					data4_TFT<=16'hFE00;
				end
		5'd7: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd3; //3:Draw A VLine. (475,5)->(475,795)
					data1_TFT<=16'd475-1;
					data2_TFT<=16'd5-1;
					data3_TFT<=16'd795-1;
					data4_TFT<=16'hFE00;
				end
		5'd8: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4: Draw A HLine. (5,5)->(475,5)
					data1_TFT<=16'd5-1;
					data2_TFT<=16'd475-1;
					data3_TFT<=16'd5-1;
					data4_TFT<=16'hFE00;
				end
		5'd9: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4: Draw A HLine. (5,795)->(475,795)
					data1_TFT<=16'd5-1;
					data2_TFT<=16'd475-1;
					data3_TFT<=16'd795-1;
					data4_TFT<=16'hFE00;
				end
		5'd10: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd5; //4: Draw SIN Wave.
					data1_TFT<=16'd10-1; //xOffset.
					data2_TFT<=16'd10-1; //yOffset.
					data3_TFT<=16'hFE00; //Color.
				end
		5'd11: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd5; //4: Draw SIN Wave.
					data1_TFT<=16'd240-1; //xOffset.
					data2_TFT<=16'd10-1; //yOffset.
					data3_TFT<=16'hF800; //Color.
				end
		5'd12: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
		//draw two times with a 1 pixel xoffset to make sin wave looks bold.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd5; //4: Draw SIN Wave.
					data1_TFT<=16'd240-1+1; //xOffset.
					data2_TFT<=16'd10-1; //yOffset.
					data3_TFT<=16'hF800; //Color.
				end
		5'd13: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
		//draw two times with a 1 pixel xoffset to make sin wave looks bold.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd5; //4: Draw SIN Wave.
					data1_TFT<=16'd240-1+2; //xOffset.
					data2_TFT<=16'd10-1; //yOffset.
					data3_TFT<=16'hF800; //Color.
				end
		5'd14:
			i<=i;
	endcase

/*
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				en_TFT<=1'b0;
				trigger_TFT<=4'd0;
				addr_SIN<=8'd0;
				y_addr<=16'd10; //y offset of first pixel.
				cnt<=8'd0;
			end
else case(i)
		5'd0: //Initial TFT.
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd0; //0.Initial LCD.
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

		5'd1: //4. Fill A Rectangle, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).

			i<=i+1'b1;
		5'd2: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2.Draw A Point.(10,10)
					data1_TFT<=16'd10-1; 
					data2_TFT<=16'd10-1; 
					data3_TFT<=16'hFE00; //FE00:Yellow, F800:Red.
				end
		5'd3: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2.Draw A Point.(470,10)
					data1_TFT<=16'd470-1; 
					data2_TFT<=16'd10-1; 
					data3_TFT<=16'hFE00; //FE00:Yellow, F800:Red.
				end
		5'd4: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2.Draw A Point. (10,790)
					data1_TFT<=16'd10-1; 
					data2_TFT<=16'd790-1; 
					data3_TFT<=16'hFE00; //FE00:Yellow, F800:Red.
				end
		5'd5: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd2; //2.Draw A Point. (470,790)
					data1_TFT<=16'd470-1; 
					data2_TFT<=16'd790-1; 
					data3_TFT<=16'hFE00; //FE00:Yellow, F800:Red.
				end
		5'd6: //3.Draw A Horizontal Line, iData1=(x), iData2=(y), iData3=(length), iData4=(not used), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd3; //3.Draw A Horizontal Line. (5,5),length=470.
					data1_TFT<=16'd0; //(x)
					data2_TFT<=16'd0; //(y)
					data3_TFT<=16'd480; //(length)
					data5_TFT<=16'h7E0; //(Color).
				end
		5'd7: //3.Draw A Horizontal Line, iData1=(x), iData2=(y), iData3=(length), iData4=(not used), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd3; //3.Draw A Horizontal Line. (5,795),length=460.
					data1_TFT<=16'd0; //(x)
					data2_TFT<=16'd800-1; //(y)
					data3_TFT<=16'd480; //(length)
					data5_TFT<=16'h7E0; //(Color).
				end
		5'd8: //4. Draw A Vertical Line, iData1=(x), iData2=(y), iData3=(length), iData4=(not used), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4.Draw A Vertical Line. (15,15),length=770.
					data1_TFT<=16'd0; //(x)
					data2_TFT<=16'd0; //(y)
					data3_TFT<=16'd800-1; //(length)
					data5_TFT<=16'h7E0; //(Color)
				end
		5'd9: //4. Draw A Vertical Line, iData1=(x), iData2=(y), iData3=(length), iData4=(not used), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4.Draw A Vertical Line. (465,15),length=770.
					data1_TFT<=16'd480-1; //(x)
					data2_TFT<=16'd0; //(y)
					data3_TFT<=16'd800-1; //(length)
					data5_TFT<=16'h7E0; //(Color)
				end
		5'd10: //4. Draw A Vertical Line, iData1=(x), iData2=(y), iData3=(length), iData4=(not used), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd4; //4.Draw A Vertical Line. (240,400),length=400.
					data1_TFT<=16'd240-1; //(x)
					data2_TFT<=16'd0; //(y)
					data3_TFT<=16'd800-1; //(length)
					data5_TFT<=16'h7E0; //(Color)
				end
		5'd11: //draw two periods SIN wave.
			if(addr_SIN==8'd240)	begin 
										addr_SIN<=8'd0;
										y_addr<=16'd10; //y offset +10.
										i<=i+1'b1;
									end
			else begin 
					if(done_TFT)	begin 
										en_TFT<=1'b0; 
										addr_SIN<=addr_SIN+1'b1; 
										y_addr<=y_addr+'d3; //next pixel +3 offset.
									end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2.Draw A Point. (470,790)
							data1_TFT<=data_SIN+16'd20; //(x,) +x offset.
							data2_TFT<=y_addr; //(,y)
							data3_TFT<=16'hFE00; //FE00:Yellow, F800:Red.
						end
				end
		5'd12: //draw two periods SIN wave.
			if(addr_SIN==8'd240)	begin 
										addr_SIN<=8'd0; 
										i<=i+1'b1;
									end
			else begin 
					if(done_TFT)	begin 
										en_TFT<=1'b0; 
										addr_SIN<=addr_SIN+1'b1;
										y_addr<=y_addr+'d3; //next pixel +3 offset.
									end
					else begin 
							en_TFT<=1'b1;
							trigger_TFT<=4'd2; //2.Draw A Point. (470,790)
							data1_TFT<=data_SIN+16'd260; //(x,) +x offset.
							data2_TFT<=y_addr; //(,y)
							data3_TFT<=16'hFFFF; //FE00:Yellow, F800:Red.
						end
				end
		5'd13: //Fill A Rect. (240,400) (260,600).
			begin
				cnt<=8'd0; //260-240=20.
				i<=i+1'b1;
			end
		5'd14: //Fill A Rect. (240,400) (260,600).
			if(cnt==8'd1) begin cnt<=8'd0; i<=i+1'b1; end
			else begin 
					if(done_TFT) begin en_TFT<=1'b0; cnt<=cnt+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4.Draw A Vertical Line. (465,15),length=770.
							data1_TFT<=16'd100+cnt; //(x)
							data2_TFT<=16'd200; //(y)
							data3_TFT<=16'd400; //(length)
							data5_TFT<=16'hFE00; //(Color)
						end
				end
		5'd15: //Fill A Rect. (240,400) (260,600).
			if(cnt==8'd20) begin cnt<=8'd0; i<=i+1'b1; end
			else begin 
					if(done_TFT) begin en_TFT<=1'b0; cnt<=cnt+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4.Draw A Vertical Line. (465,15),length=770.
							data1_TFT<=16'd300+cnt; //(x)
							data2_TFT<=16'd100; //(y)
							data3_TFT<=16'd200; //(length)
							data5_TFT<=16'hFE00; //(Color)
						end
				end
		5'd16: //Fill A Rect. (240,400) (260,600).
			if(cnt==8'd20) begin cnt<=8'd0; i<=i+1'b1; end
			else begin 
					if(done_TFT) begin en_TFT<=1'b0; cnt<=cnt+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4.Draw A Vertical Line. (465,15),length=770.
							data1_TFT<=16'd450+cnt; //(x)
							data2_TFT<=16'd400; //(y)
							data3_TFT<=16'd300; //(length)
							data5_TFT<=16'hF800; //(Color)
						end
				end
		5'd20: //5. Draw A Line, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2), iData5=(Color).
			if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
			else begin 
					en_TFT<=1'b1; 
					trigger_TFT<=4'd5; //5.Draw A Line.
					data1_TFT<=16'd0; //(x1)
					data2_TFT<=16'd0; //(y1)
					data3_TFT<=16'd200-1; //(x2)
					data4_TFT<=16'd200-1; //(y2)
					data5_TFT<=16'h7E0; //(Color)
				end
		5'd17:
			i<=i;
	endcase

*/
endmodule
