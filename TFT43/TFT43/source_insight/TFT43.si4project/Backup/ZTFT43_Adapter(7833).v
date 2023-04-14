`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:21 03/22/2023 
// Design Name: 
// Module Name:    ZTFT43_Adapter 
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
`include "ColorTable/ZRGB565_ColorTable.v"

module ZTFT43_Adapter(
    input clk,
    input rst_n,
    input en,

	input sync_50Hz,
	
	//New Pulse Counter data arrived.
    input data_update,
    input [31:0] din_PulseCounter,
    
    //use an oscilloscope to check how many clks were used.
    output reg clk_used, 
    
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );

//////////////////////////////////////////////////
//FIFO: 32 bits *1024 depth.
//for writing.
reg wr_fifo;
wire is_fifo_full;
//for reading.
reg rd_fifo;
wire is_fifo_empty;
wire [31:0] dout_fifo;
ZPulseCounter_FIFO ic_PulseCounter_FIFO (
  .clk(clk), // input clk
  .rst(rst_n), // input rst
  .din(din_PulseCounter), // input [31 : 0] din
  .wr_en(wr_fifo), // input wr_en
  .rd_en(rd_fifo), // input rd_en
  .dout(dout_fifo), // output [31 : 0] dout
  .full(is_fifo_full), // output full
  .empty(is_fifo_empty) // output empty
);
//Self Aux Logic to help to write PulseCounter to FIFO.
reg [2:0] i_wr_fifo;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i_wr_fifo<=0;
				wr_fifo<=1'b0;
			end
else	begin
			case(i_wr_fifo)
				0:
					if(data_update && !is_fifo_full) begin
					 								wr_fifo<=1'b1; 
					 								i_wr_fifo<=i_wr_fifo+1'b1; 
					 							end						
				1:
					begin wr_fifo<=1'b0; i_wr_fifo<=i_wr_fifo+1'b1; end
				2:
					begin i_wr_fifo<=0; end
			endcase

		end
/////////////////////////////////////////////////////
//PulseCounter Address Mux, Combination Logic, No clock.
reg [3:0] select_PulseCounterMux;
wire [3:0] dout_PulseCounter_Addr;
ZPulseCounter_Mux10to1 ic_PulseCounter_Mux(
	//0: q0
	//1: q1
	//2: q2
	//3: q3
	//4: q4
	//5: q5
	//6: q6
	//7: q7
    .select(select_PulseCounterMux),
    
    .q0(dout_fifo[3:0]),
    .q1(dout_fifo[7:4]),
    .q2(dout_fifo[11:8]),
    .q3(dout_fifo[15:12]),
    .q4(dout_fifo[19:16]),
    .q5(dout_fifo[23:20]),
    .q6(dout_fifo[27:24]),
    .q7(dout_fifo[31:28]),
    
    .dout(dout_PulseCounter_Addr)
    );
 
///////////////////////////////////////////////////////////////////
//RTC Module.
wire [3:0] hour_10;
wire [3:0] hour_1;
wire [3:0] minute_10;
wire [3:0] minute_1;
wire [3:0] second_10;
wire [3:0] second_1;
ZRTC_Counter ic_RTC(
    .clk(clk),
    .rst_n(rst_n),
    .en(1'b1), //Always Enable.
    .hour_10(hour_10),
    .hour_1(hour_1),
    .minute_10(minute_10),
    .minute_1(minute_1),
    .second_10(second_10),
    .second_1(second_1));
 
//RTC: xx:xx:xx ZiMo Address Mux.
reg [3:0] select_RTCMux;
wire [10:0] dout_RTC_ZiMo_Addr;
ZRTC_Mux8to1 ic_RTC_Mux(
    .select(select_RTCMux),
    .hour_10(hour_10),
    .hour_1(hour_1),
    .minute_10(minute_10),
    .minute_1(minute_1),
    .second_10(second_10),
    .second_1(second_1),
    .dout(dout_RTC_ZiMo_Addr)
    );

 ////////////////////////////////////////////////////////
 //ZiMo 32x32.
reg [10:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
M9K_ZiMo3232 ic_M9K_ZiMo3232 (
  .a(addr_ZiMo3232), // input [10 : 0] a
  .spo(data_ZiMo3232) // output [7 : 0] spo
);

/////////////////////////////////
reg en_TFT;
reg [3:0] trigger_TFT;
reg [15:0] data1_TFT;
reg [15:0] data2_TFT;
reg [15:0] data3_TFT;
reg [15:0] data4_TFT;
reg [15:0] data5_TFT;
wire done_TFT;
ZTFT43_Controller ic_TFT_Controller(
    .clk(clk),
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

///////////////////////////////////////////////////////////////////
reg [9:0] lcd_x_addr; //range:0~480-1
reg [9:0] lcd_y_addr; //range:0~800-1
 

//make SIN wave looking bold.
reg [2:0] x_bold;
reg [2:0] y_bold;


///////////////////////////////////////////////
//Self Aux Logic driven by step i.
reg [15:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<='d0;
				en_TFT<=1'b0; 

				x_bold<=3'd3;
				y_bold<=3'd3;

				//ZiMo 32x32.
				addr_ZiMo3232<=11'd0;
				cnt_addr_ZiMo3232<=8'd0;
				lcd_x_addr<=10'd0;
				lcd_y_addr<=10'd0;
				
				select_PulseCounterMux<='d0;
				select_RTCMux<='d0;

				clk_used<=1'b0;
			end
else if(en) begin
			case(i)
				0: //0:Initial TFT.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd0; //0:Initial TFT.
						end
				1: //1:Clear Screen with Color.(0,0) (480-1, 800-1).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd1; //1:Clear Screen with Color.
							data1_TFT<=16'd0; //(x1)
							data2_TFT<=16'd0; //(y1)
							data3_TFT<=16'd480-1; //(x2)
							data4_TFT<=16'd800-1; //(y2)
							data5_TFT<=`Color_Black; //Color.
						end
				2: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point at (10,10).
							data1_TFT<=16'd10-1;
							data2_TFT<=16'd10-1;
							data3_TFT<=`Color_Yellow;
						end
				3: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point at (470,10).
							data1_TFT<=16'd470-1;
							data2_TFT<=16'd10-1;
							data3_TFT<=`Color_Yellow;
						end	
				4: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point at (10,790).
							data1_TFT<=16'd10-1;
							data2_TFT<=16'd790-1;
							data3_TFT<=`Color_Yellow;
						end
				5: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point at(470,790).
							data1_TFT<=16'd470-1;
							data2_TFT<=16'd790-1;
							data3_TFT<=`Color_Yellow;
						end
				6: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (5,5)->(5,795)
							data1_TFT<=16'd5-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=`Color_Yellow;
						end
				7: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (475,5)->(475,795)
							data1_TFT<=16'd475-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=`Color_Yellow;
						end
				8: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4: Draw A HLine. (5,5)->(475,5)
							data1_TFT<=16'd5-1;
							data2_TFT<=16'd475-1;
							data3_TFT<=16'd5-1;
							data4_TFT<=16'hFE00;
						end
				9: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									//PreSet x & y position.
									lcd_x_addr<=10'd424;
									lcd_y_addr<=10'd10;
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4: Draw A HLine. (5,795)->(475,795)
							data1_TFT<=16'd5-1;
							data2_TFT<=16'd475-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=16'hFE00;
						end
				10: //First character:Gong,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update x.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1;
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1) 460-1-32=428. 460-1-428+1=32.
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2) 460-1.
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				11: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
									data2_TFT<=`Color_Green; //Color.
								end
						end
				12: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end
				13: //Second character:Pin,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update x.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, lcd_y_addr}; //(y1)
							data3_TFT<={6'b000000, lcd_x_addr};//(x2)
							data4_TFT<={6'b000000, lcd_y_addr+32-1};//(y2)
						end
				14: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
									data2_TFT<=`Color_Green; //Color.
								end
						end
				15: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				16: //Third character:Tong,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update x.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				17: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
									data2_TFT<=`Color_Green; //Color.
								end
						end
				18: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				19: //Fourth character:Bu,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update x.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				20: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
									data2_TFT<=`Color_Green; //Color.
								end
						end
				21: //8: End Area Write.
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									
									//PreSet ZiMo x&y address.
									lcd_x_addr<=10'd184-1;
									lcd_y_addr<=10'd10;

									i<=i+1'b1; //next step.
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				22: //First character:Guang,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update X.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				23: //7: Fill Data to Write Area, iData1=data.
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
									data2_TFT<=`Color_Pink; //Color.
								end
						end
				24: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				25: //Second character:Zi,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update X.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				26: //7: Fill Data to Write Area, iData1=data.
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
									data2_TFT<=`Color_Pink; //Color.
								end
						end
				27: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				28: //Third character:Mai,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update X.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				29: //7: Fill Data to Write Area, iData1=data.
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
									data2_TFT<=`Color_Pink; //Color.
								end
						end
				30: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				31: //Fourth character:Chong,32*32=1024bits/8bits=128bytes.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									lcd_x_addr<=lcd_x_addr-32; //update X.
									lcd_y_addr<=lcd_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, lcd_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, lcd_y_addr}; //(y1)
							data3_TFT<={6'd0, lcd_x_addr};//(x2)
							data4_TFT<={6'd0, lcd_y_addr+32-1};//(y2)
						end
				32: //7: Fill Data to Write Area, iData1=data.
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
									data2_TFT<=`Color_Pink; //Color.
								end
						end
				33: //8: End Area Write.
					if(done_TFT) begin 
									en_TFT<=1'b0; 

									//next step.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				34: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (240,5)->(240,795)
							data1_TFT<=16'd240-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=`Color_Yellow;
						end
				35: //Draw SIN WAVE.			
				//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
				//If we want to draw 5 periods on screen, so 5*120=600.
				//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
					begin
						//pull high to start count how many clks did the following logic use? 
						clk_used<=1'b1;
					
						if(done_TFT) begin 
										en_TFT<=1'b0; 
										i<=i+1'b1; 
									end
						else begin 
								en_TFT<=1'b1; 
								trigger_TFT<=4'd9; //9: Fast draw SIN wave.
								data1_TFT<=16'd250; //(x1): xOffset.
								data2_TFT<= 16'd100; //(y1): yOffset.
								data3_TFT<=16'd378-1; //(x2) 2^7=128, 244+128=372
								data4_TFT<=16'd700-1; //(y2)
								data5_TFT<=`Color_Black; //Color.
							end
					end
				36: //Draw RTC.
				//23:59:59  Font Size: 24*12.
				//Clear the area before writing.
				//(x1,y1)=(464-24,680) (x2,y2)=(464,680+8*12)=(464,776).
				//(440,680)-(464-1,776-1)
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<=440; //(x1)
							data2_TFT<=680; //(y1)
							data3_TFT<=(464-1); //(x2)
							data4_TFT<=(776-1); //(y2)
						end
				37:
					begin 
						//choose 0~9 ZiMo offset.
						addr_ZiMo3232<=dout_RTC_ZiMo_Addr;
						
						//reset counter.
						cnt_addr_ZiMo3232<=8'd0;
						i<=i+1'b1;
					end
				38: //7: Fill Data to Write Area, iData1=data, iData2=Color.
					if(cnt_addr_ZiMo3232==8'd36 ) begin 
													cnt_addr_ZiMo3232<=8'd0; 
													i<=i+1'b1; 
												end
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
									data2_TFT<=`Color_Green; //Color.
								end
						end
				39:
					if(select_RTCMux==4'd8) begin select_RTCMux<=4'd0; i<=i+1'b1; end
					else begin 
							select_RTCMux<=select_RTCMux+1'b1; 
							i<=37; //Loop.
						end
				40: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write. 
						end 
						
				41: //Draw PulseCounter.
				//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end	
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<=(206); //(x1)
							data2_TFT<=(680); //(y1)
							data3_TFT<=(230-1);//(x2)
							data4_TFT<=(776-1);//(y2)
						end
				42: //fetch one PulseCounter from FIFO.
					begin
						if(!is_fifo_empty) begin 
											rd_fifo<=1'b1; 
											i<=i+1'b1; 
										end		
						select_PulseCounterMux<=4'd0;
					end
				43:
					begin 
						rd_fifo<=1'b0; 

						//choose 0~9 ZiMo offset.
						addr_ZiMo3232<=dout_PulseCounter_Addr;
						//Reset Counter.
						cnt_addr_ZiMo3232<=8'd0;
						
						i<=i+1'b1; 
					end

				44: //7: Fill Data to Write Area, iData1=data, iData2=Color.
					if(cnt_addr_ZiMo3232==8'd36-1) begin 
													cnt_addr_ZiMo3232<=8'd0; 
													i<=i+1'b1; 
												end
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
									data2_TFT<=`Color_Pink; //Color.
								end
						end
				45: //Loop to Draw.
					if(select_PulseCounterMux==4'd8-1) begin 
													select_PulseCounterMux<=4'd0; 
													i<=i+1'b1; 
												end
					else begin 
							//Mux Select Next Digit.
							select_PulseCounterMux<=select_PulseCounterMux+1'b1; 
							i<=43; //Draw Next Digit.
						end
				46: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin en_TFT<=1'b1; trigger_TFT<=4'd8; end //End Area Write. 
				47: //5: Draw PulseCounter Curve.
				//Draw PulseCounter Curve in rectangle (10,100)-(10+190,100+600)=(200,700).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd10; //10. Draw PulseCounter Curve.
							data1_TFT<=16'd10; //(x1): xOffset.
							data2_TFT<= 16'd100; //(y1): yOffset.
							data3_TFT<=16'd200-1; //(x2) 
							data4_TFT<=16'd700-1; //(y2)
							data5_TFT<=`Color_Black; //Color.
						end
				48: 
					begin
						clk_used<=1'b0;
						if(sync_50Hz)
							i<=35; //Loop to Refresh 50Hz.
					end
			endcase
		 end 
endmodule
