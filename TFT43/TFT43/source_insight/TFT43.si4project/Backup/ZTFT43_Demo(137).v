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

//60Hz Refresh Rate.
//20MHz/60Hz=333333.333~=333334.
reg [18:0] cnt_60Hz;
always@(posedge clk_20MHz or negedge rst_n)
if(!rst_n)
	cnt_60Hz<=19'd0;
else if(cnt_60Hz==19'd333334-1)
		cnt_60Hz<=19'd0;
	else
		cnt_60Hz<=cnt_60Hz+1'b1;

//ZiMo 32x32.
reg [9:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
M9K_ZiMo3232 ic_M9K_ZiMo3232 (
  .a(addr_ZiMo3232), // input [9 : 0] a
  .spo(data_ZiMo3232) // output [7 : 0] spo
);
reg [9:0] zimo_x_addr; //range:0~480-1
reg [9:0] zimo_y_addr; //range:0~800-1


//FIFO to save Pulse Counter.
reg [7:0] data_in_FIFO;
reg wr_en_FIFO;
reg rd_en_FIFO;
wire [7:0] data_out_FIFO;
wire full_FIFO;
wire empty_FIFO;

ZFIFO_PulseCounter ic_FIFO_PulseCounter (
  .clk(clk_20MHz), // input clk
  .rst(rst_n), // input rst
  .din(data_in_FIFO), // input [7 : 0] din
  .wr_en(wr_en_FIFO), // input wr_en
  .rd_en(rd_en_FIFO), // input rd_en
  .dout(data_out_FIFO), // output [7 : 0] dout
  .full(full_FIFO), // output full
  .empty(empty_FIFO) // output empty
);

//make SIN wave looking bold.
reg [2:0] x_bold;
reg [2:0] y_bold;

reg [7:0] cnt;
//driven by step i.
reg [7:0] i;
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				i<=8'd0;
				en_TFT<=1'b0;
				cnt<=8'd0;

				x_bold<=3'd3;
				y_bold<=3'd3;

				//ZiMo 32x32.
				addr_ZiMo3232<=9'd0;
				cnt_addr_ZiMo3232<=8'd0;
				zimo_x_addr<=10'd0;
				zimo_y_addr<=10'd0;
			end
else 	case(i)
			8'd0: //0:Initial TFT.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd0; //0:Initial TFT.
					end
			8'd1: //1:Clear Screen with Color.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd1; //1:Clear Screen with Color.
						data1_TFT<=16'h0000;
					end
			8'd2: //60Hz Refresh Rate.
				if(cnt_60Hz==19'd1000)
					i<=i+1'b1;
			8'd3: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd2; //2:Draw A Point.
						data1_TFT<=16'd10-1;
						data2_TFT<=16'd10-1;
						data3_TFT<=16'hFE00;
					end
			8'd4: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd2; //2:Draw A Point.
						data1_TFT<=16'd470-1;
						data2_TFT<=16'd10-1;
						data3_TFT<=16'hFE00;
					end
			8'd5: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd2; //2:Draw A Point.
						data1_TFT<=16'd10-1;
						data2_TFT<=16'd790-1;
						data3_TFT<=16'hFE00;
					end
			8'd6: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd2; //2:Draw A Point.
						data1_TFT<=16'd470-1;
						data2_TFT<=16'd790-1;
						data3_TFT<=16'hFE00;
					end
			8'd7: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd3; //3:Draw A VLine. (5,5)->(5,795)
						data1_TFT<=16'd5-1;
						data2_TFT<=16'd5-1;
						data3_TFT<=16'd795-1;
						data4_TFT<=16'hFE00;
					end
			8'd8: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd3; //3:Draw A VLine. (475,5)->(475,795)
						data1_TFT<=16'd475-1;
						data2_TFT<=16'd5-1;
						data3_TFT<=16'd795-1;
						data4_TFT<=16'hFE00;
					end
			8'd9: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd4; //4: Draw A HLine. (5,5)->(475,5)
						data1_TFT<=16'd5-1;
						data2_TFT<=16'd475-1;
						data3_TFT<=16'd5-1;
						data4_TFT<=16'hFE00;
					end
			8'd10: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd4; //4: Draw A HLine. (5,795)->(475,795)
						data1_TFT<=16'd5-1;
						data2_TFT<=16'd475-1;
						data3_TFT<=16'd795-1;
						data4_TFT<=16'hFE00;
					end
			8'd11: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(x_bold==3'd0) begin x_bold<=3'd0; i<=i+1'b1; end
				else begin
					if(done_TFT) begin en_TFT<=1'b0; x_bold<=x_bold-1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd5; //4: Draw SIN Wave.
							data1_TFT<=16'd10-1+x_bold; //xOffset. x_shift + x_bold.
							data2_TFT<=16'd10-1; //yOffset.
							data3_TFT<=16'hF8B2; //Color.
						end
					end
			8'd12: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(x_bold==3'd0) begin x_bold<=3'd0; i<=i+1'b1; end
				else begin
					if(done_TFT) begin en_TFT<=1'b0; x_bold<=x_bold-1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd5; //4: Draw SIN Wave.
							data1_TFT<=16'd10-1-x_bold; //xOffset. x_shift - x_bold.
							data2_TFT<=16'd10-1; //yOffset.
							data3_TFT<=16'hF8B2; //Color.
						end
					end
			8'd13: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(y_bold==3'd0) begin y_bold<=3'd0; i<=i+1'b1; end
				else begin
					if(done_TFT) begin en_TFT<=1'b0; y_bold<=y_bold-1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd5; //4: Draw SIN Wave.
							data1_TFT<=16'd10-1; //xOffset. 
							data2_TFT<=16'd10-1+y_bold; //yOffset. y_shift + y_bold.
							data3_TFT<=16'hF8B2; //Color.
						end
					end
			8'd14: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(y_bold==3'd0) begin y_bold<=3'd0; i<=i+1'b1; end
				else begin
					if(done_TFT) begin en_TFT<=1'b0; y_bold<=y_bold-1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd5; //4: Draw SIN Wave.
							data1_TFT<=16'd10-1; //xOffset. 
							data2_TFT<=16'd10-1-y_bold; //yOffset. y_shift - y_bold.
							data3_TFT<=16'hF8B2; //Color.
						end
					end
			8'd15: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
			//draw two times with a 1 pixel xoffset to make sin wave looks bold.
				if(x_bold==3'd0) begin x_bold<=3'd3; i<=i+1'b1; end
				else begin
						if(done_TFT) begin en_TFT<=1'b0; x_bold<=x_bold-1'b1; end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd5; //4: Draw SIN Wave.
								data1_TFT<=16'd240-1+x_bold; //xOffset. x shift + x_bold.
								data2_TFT<=16'd10-1; //yOffset.
								data3_TFT<=16'h7E0; //Color.
							end
					end
			8'd16: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
			//draw two times with a 1 pixel xoffset to make sin wave looks bold.
				if(x_bold==3'd0) begin x_bold<=3'd3; i<=i+1'b1; end
				else begin
						if(done_TFT) begin en_TFT<=1'b0; x_bold<=x_bold-1'b1; end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd5; //4: Draw SIN Wave.
								data1_TFT<=16'd240-1-x_bold; //xOffset. x shift - x_bold.
								data2_TFT<=16'd10-1; //yOffset.
								data3_TFT<=16'h7E0; //Color.
							end
					end
			8'd17: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(y_bold==3'd0) begin y_bold<=3'd3; i<=i+1'b1; end
				else begin
						if(done_TFT) begin en_TFT<=1'b0; y_bold<=y_bold-1'b1; end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd5; //4: Draw SIN Wave.
								data1_TFT<=16'd240-1; //xOffset. 
								data2_TFT<=16'd10-1+y_bold; //yOffset. y shift + y_bold.
								data3_TFT<=16'h7E0; //Color.
							end
					end

			8'd18: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
				if(y_bold==3'd0) begin 
									y_bold<=3'd3; 

									//PreSet ZiMo x&y address.
									zimo_x_addr<=10'd430;
									zimo_y_addr<=10'd10;

									//next step.
									i<=i+1'b1;
								end
				else begin
						if(done_TFT) begin en_TFT<=1'b0; y_bold<=y_bold-1'b1; end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd5; //4: Draw SIN Wave.
								data1_TFT<=16'd240-1; //xOffset. 
								data2_TFT<=16'd10-1-y_bold; //yOffset. y shift - y_bold.
								data3_TFT<=16'h7E0; //Color.
							end
					end
			////first character:Gong,32*32=1024bits/8bits=128bytes.
			8'd19: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1;
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd20: //7: Fill Data to Write Area, iData1=data, iData2=Color.
				if(cnt_addr_ZiMo3232==8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'h7E0; //Color.
							end
					end
			8'd21: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end
 
			////second character:Pin,32*32=1024bits/8bits=128bytes.
			8'd22: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd23: //7: Fill Data to Write Area, iData1=data, iData2=Color.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'h7E0; //Color.
							end
					end
			8'd24: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			////third character:Tong,32*32=1024bits/8bits=128bytes.
			8'd25: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd26: //7: Fill Data to Write Area, iData1=data, iData2=Color.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'h7E0; //Color.
							end
					end
			8'd27: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			////fourth character:Bu,32*32=1024bits/8bits=128bytes.
			8'd28: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd29: //7: Fill Data to Write Area, iData1=data, iData2=Color.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'h7E0; //Color.
							end
					end
			8'd30: //8: End Area Write.
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								
								//PreSet ZiMo x&y address.
								zimo_x_addr<=10'd160;
								zimo_y_addr<=10'd10;

								//next step.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 

			////First character:Guang,32*32=1024bits/8bits=128bytes.
			8'd31: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd32: //7: Fill Data to Write Area, iData1=data.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'hF8B2; //Color.
							end
					end
			8'd33: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			////Second character:Zi,32*32=1024bits/8bits=128bytes.
			8'd34: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd35: //7: Fill Data to Write Area, iData1=data.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'hF8B2; //Color.
							end
					end
			8'd36: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			////Third character:Mai,32*32=1024bits/8bits=128bytes.
			8'd37: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd38: //7: Fill Data to Write Area, iData1=data.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'hF8B2; //Color.
							end
					end
			8'd39: //8: End Area Write.
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			////Fourth character:Chong,32*32=1024bits/8bits=128bytes.
			8'd40: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+32; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'b000000, zimo_x_addr}; //(x1)
						data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
						data3_TFT<={6'b000000, zimo_x_addr+32-1};//(x2)
						data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
					end
			8'd41: //7: Fill Data to Write Area, iData1=data.
				if(cnt_addr_ZiMo3232>=8'd128 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
				else begin
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										cnt_addr_ZiMo3232<=cnt_addr_ZiMo3232+1'b1; 
										addr_ZiMo3232<=addr_ZiMo3232+1'b1;
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd7; //7: Fill Data to Write Area.
								data1_TFT<={8'h00,data_ZiMo3232};
								data2_TFT<=16'hF8B2; //Color.
							end
					end
			8'd42: //8: End Area Write.
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_y_addr<=10'd0; 
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			//Read Pulse Counter from FIFO.
			8'd43: //Read PulseCounter from FIFO.
				if(empty_FIFO==1'b1) begin 
										i<=i; 
									end
				else
					begin 
						rd_en_FIFO<=1'b1; 
						i<=i+1'b1; 
					end					
			8'd44:
				begin 
					rd_en_FIFO<=1'b0; 
					i<=i+1'b1; 
				end
			8'd45:
				i<=i+1'b1;
			8'd46: //Draw A HLine, iData1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd4; //4: Draw A HLine. 
						data1_TFT<=16'd5; //(x1).
						data2_TFT<={8'h00,data_out_FIFO}; //(x2).
						//data2_TFT<={8'h00,8'd100}; //(x2).
						data3_TFT<={6'd0,zimo_y_addr}; //(y1).
						data4_TFT<=16'hF800; //(Color).
					end
			8'd47:
				begin
					if(zimo_y_addr=='d800-1) zimo_y_addr<='d0;
					else zimo_y_addr<=zimo_y_addr+1'b1;
					
					i<=8'd43;  //5'd2; //goto 60Hz refresh.
					//i<=i;
				end
		endcase

//Process to write data into FIFO.
//driven by step i.
reg [7:0] iFIFO;
always @(posedge clk_20MHz or negedge rst_n)
if(!rst_n)	begin
				iFIFO<=8'd0;
				data_in_FIFO<=8'd0;
				wr_en_FIFO<=1'b0;
			end
else case(iFIFO)
		8'd0:
			if(full_FIFO==1'b1) begin 
									data_in_FIFO<=data_in_FIFO+1'b1; //generate RANDOM.
								end
			else begin 
					wr_en_FIFO<=1'b1; 
					iFIFO<=iFIFO+1'b1; 
				end 
		8'd1:
			begin wr_en_FIFO<=1'b0; iFIFO<=iFIFO+1'b1; end
		8'd2:
			begin iFIFO<=8'd0; end
	endcase
endmodule
