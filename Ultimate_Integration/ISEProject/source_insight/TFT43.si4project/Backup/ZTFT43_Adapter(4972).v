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

    input photon_pulse, //external photon pulse input pin.
    
    //0: Idle.
    //1: Draw fixed (not changed) parts.
    //2: Draw SIN WAVE.
    //3: Draw RTC.
    //4. Draw PulseCounter.
    //5. Draw PulseCounter Curve.
    input [3:0] iTrigger,
    output done,

	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );

reg done_r;
assign done=done_r;
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


//ZiMo 32x32.
reg [10:0] addr_ZiMo3232;
wire [7:0] data_ZiMo3232;
reg [7:0] cnt_addr_ZiMo3232;
M9K_ZiMo3232 ic_M9K_ZiMo3232 (
  .a(addr_ZiMo3232), // input [10 : 0] a
  .spo(data_ZiMo3232) // output [7 : 0] spo
);
reg [9:0] zimo_x_addr; //range:0~480-1
reg [9:0] zimo_y_addr; //range:0~800-1

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



//xxxxxxxxxx=10bits.
//0000000000~9999999999
reg [3:0] cnt_10bits;

//20MHz/10Hz=2000,000
reg [23:0] CNT_FPS;

//External Photon Pulse Counter.
wire [3:0] cnt_q0; //LSB.
wire [3:0] cnt_q1;
wire [3:0] cnt_q2;
wire [3:0] cnt_q3;
wire [3:0] cnt_q4;
wire [3:0] cnt_q5;
wire [3:0] cnt_q6;
wire [3:0] cnt_q7; //MSB.
wire cnt_overflow;
ZPulseCounter ic_PulseCounter(
    .clk(clk),
    .rst_n(rst_n),
    .en(1'b1), //always enable.
    .pulse(photon_pulse), //external photon pulse.
    .q0(cnt_q0), //LSB.
    .q1(cnt_q1),
    .q2(cnt_q2),
    .q3(cnt_q3),
    .q4(cnt_q4),
    .q5(cnt_q5),
    .q6(cnt_q6),
    .q7(cnt_q7), //MSB.
    .overflow(cnt_overflow)
    );

//PulseCounter 8bits Multiplex.
reg [3:0] select_PulseCounter;
wire [3:0] dout_PulseCounter;
ZPulseCounter_Mux10to1 ic_PulseCounter_Mux(
	//0: q0
	//1: q1
	//2: q2
	//3: q3
	//4: q4
	//5: q5
	//6: q6
	//7: q7
    .select(select_PulseCounter),
    
    .q0(cnt_q0),
    .q1(cnt_q1),
    .q2(cnt_q2),
    .q3(cnt_q3),
    .q4(cnt_q4),
    .q5(cnt_q5),
    .q6(cnt_q6),
    .q7(cnt_q7),
    
    .dout(dout_PulseCounter)
    );


//make SIN wave looking bold.
reg [2:0] x_bold;
reg [2:0] y_bold;

reg [7:0] cnt;
//driven by step i.
reg [7:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=8'd0;
				done_r<=1'b0;
				en_TFT<=1'b0;
				cnt<=8'd0;

				x_bold<=3'd3;
				y_bold<=3'd3;

				//ZiMo 32x32.
				addr_ZiMo3232<=11'd0;
				cnt_addr_ZiMo3232<=8'd0;
				zimo_x_addr<=10'd0;
				zimo_y_addr<=10'd0;

				CNT_FPS<=24'd0;
				cnt_10bits<=4'd0;

				select_RTCMux<=4'd0;
			end
else if(en)
	case(iTrigger)
		4'd0: //0:Idle.
			case(i)
				8'd0: begin done_r<=1'b1; i<=i+1'b1; end
				8'd1: begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd1: //1: Draw fixed (not changed) parts.
			case(i)
				8'd0: //0:Initial TFT.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd0; //0:Initial TFT.
						end
				8'd1: //1:Clear Screen with Color.(0,0) (480-1, 800-1).
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
				8'd2: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point.
							data1_TFT<=16'd10-1;
							data2_TFT<=16'd10-1;
							data3_TFT<=16'hFE00;
						end
				8'd3: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point.
							data1_TFT<=16'd470-1;
							data2_TFT<=16'd10-1;
							data3_TFT<=16'hFE00;
						end	
				8'd4: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point.
							data1_TFT<=16'd10-1;
							data2_TFT<=16'd790-1;
							data3_TFT<=16'hFE00;
						end
				8'd5: //2:Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd2; //2:Draw A Point.
							data1_TFT<=16'd470-1;
							data2_TFT<=16'd790-1;
							data3_TFT<=16'hFE00;
						end
				8'd6: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (5,5)->(5,795)
							data1_TFT<=16'd5-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=16'hFE00;
						end
				8'd7: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (475,5)->(475,795)
							data1_TFT<=16'd475-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=16'hFE00;
						end
				8'd8: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd4; //4: Draw A HLine. (5,5)->(475,5)
							data1_TFT<=16'd5-1;
							data2_TFT<=16'd475-1;
							data3_TFT<=16'd5-1;
							data4_TFT<=16'hFE00;
						end
				8'd9: //4: Draw A HLine, iDAta1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									//PreSet x & y position.
									zimo_x_addr<=10'd424;
									zimo_y_addr<=10'd10;
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
				//First character:Gong,32*32=1024bits/8bits=128bytes.
				8'd10: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update x.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1;
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1) 460-1-32=428. 460-1-428+1=32.
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2) 460-1.
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd11: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
				8'd12: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end
				////Second character:Pin,32*32=1024bits/8bits=128bytes.
				8'd13: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update x.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd14: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
				8'd15: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////Third character:Tong,32*32=1024bits/8bits=128bytes.
				8'd16: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update x.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd17: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
				8'd18: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////Fourth character:Bu,32*32=1024bits/8bits=128bytes.
				8'd19: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update x.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd20: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
				8'd21: //8: End Area Write.
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									
									//PreSet ZiMo x&y address.
									zimo_x_addr<=10'd184-1;
									zimo_y_addr<=10'd10;

									//next step.
									i<=i+1'b1;
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////First character:Guang,32*32=1024bits/8bits=128bytes.
				8'd22: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update X.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd23: //7: Fill Data to Write Area, iData1=data.
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
				8'd24: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////Second character:Zi,32*32=1024bits/8bits=128bytes.
				8'd25: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update X.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
							data4_TFT<={6'b000000, zimo_y_addr+32-1};//(y2)
						end
				8'd26: //7: Fill Data to Write Area, iData1=data.
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
				8'd27: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////Third character:Mai,32*32=1024bits/8bits=128bytes.
				8'd28: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update X.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'd0, zimo_y_addr}; //(y1)
							data3_TFT<={6'd0, zimo_x_addr};//(x2)
							data4_TFT<={6'd0, zimo_y_addr+32-1};//(y2)
						end
				8'd29: //7: Fill Data to Write Area, iData1=data.
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
				8'd30: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				////Fourth character:Chong,32*32=1024bits/8bits=128bytes.
				8'd31: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr-32; //update X.
									zimo_y_addr<=zimo_y_addr; //keep y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'b000000, zimo_x_addr-32+1}; //(x1)
							data2_TFT<={6'b000000, zimo_y_addr}; //(y1)
							data3_TFT<={6'b000000, zimo_x_addr};//(x2)
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
					if(done_TFT) begin 
									en_TFT<=1'b0; 

									//next step.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd8; //End Area Write.
						end 
				8'd34: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd3; //3:Draw A VLine. (5,5)->(5,795)
							data1_TFT<=16'd240-1;
							data2_TFT<=16'd5-1;
							data3_TFT<=16'd795-1;
							data4_TFT<=16'hFE00;
						end
				8'd35: 
					begin done_r<=1'b1; i<=i+1'b1; end
				8'd36:
					begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd2: //2: Draw SIN WAVE.
			//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
			//If we want to draw 5 periods on screen, so 5*120=600.
			//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
			case(i) 
				8'd0: 
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd9; //9: Fast draw SIN wave.
							data1_TFT<=16'd250; //(x1): xOffset.
							data2_TFT<= 16'd100; //(y1): yOffset.
							data3_TFT<=16'd378-1; //(x2) 2^7=128, 244+128=372
							data4_TFT<=16'd700-1; //(y2)
							data5_TFT<=`Color_Black; //Color.
						end
				8'd1: 
					begin done_r<=1'b1; i<=i+1'b1; end
				8'd2:
					begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd3: //Draw RTC.
			//23:59:59  Font Size: 24*12.
			//Clear the area before writing.
			//(x1,y1)=(464-24,680) (x2,y2)=(464,680+8*12)=(464,776).
			//(440,680)-(464-1,776-1)
			case(i)
				8'd0: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<=440; //(x1)
							data2_TFT<=680; //(y1)
							data3_TFT<=(464-1); //(x2)
							data4_TFT<=(776-1); //(y2)
						end
				8'd1: 
					begin 
						//choose 0~9 ZiMo offset.
						addr_ZiMo3232<=dout_RTC_ZiMo_Addr;
						
						//reset counter.
						cnt_addr_ZiMo3232<=8'd0;
						i<=i+1'b1;
					end
				8'd2: //7: Fill Data to Write Area, iData1=data, iData2=Color.
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
				8'd3:
					if(select_RTCMux==4'd7) begin select_RTCMux<=4'd0; i<=i+1'b1; end
					else begin 
							select_RTCMux<=select_RTCMux+1'b1; 
							i<=8'd1; //Loop.
						end
				8'd4: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin en_TFT<=1'b1; trigger_TFT<=4'd8; end //End Area Write. 

				8'd5: 
					begin done_r<=1'b1; i<=i+1'b1; end
				8'd6:
					begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd4: //4. Draw PulseCounter.
			case(i)
				8'd0: //PreSet x & y position.
					begin
						zimo_x_addr<=10'd230-1; 
						zimo_y_addr<=10'd680;

						select_PulseCounter<=4'd0;
						i<=i+1'b1;
					end
				8'd1: //choose 0~9 ZiMo offset.
					begin
						case(dout_PulseCounter)
							4'd0: addr_ZiMo3232<='d1024; //0 start from 1024 offset.
							4'd1: addr_ZiMo3232<='d1060; //1024+36=1060.
							4'd2: addr_ZiMo3232<='d1096;
							4'd3: addr_ZiMo3232<='d1132;
							4'd4: addr_ZiMo3232<='d1168;
							4'd5: addr_ZiMo3232<='d1204;
							4'd6: addr_ZiMo3232<='d1240;
							4'd7: addr_ZiMo3232<='d1276;
							4'd8: addr_ZiMo3232<='d1312;
							4'd9: addr_ZiMo3232<='d1348; //:1384.
						endcase
						cnt_addr_ZiMo3232<=8'd0;
						i<=i+1'b1;
					end
				8'd2: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
					if(done_TFT) begin 
									en_TFT<=1'b0; 
									zimo_x_addr<=zimo_x_addr; //keep X.
									zimo_y_addr<=zimo_y_addr+12; //update y.
									i<=i+1'b1; 
								end
					else begin 
							en_TFT<=1'b1; 
							trigger_TFT<=4'd6; //6: PreSet Write Area.
							data1_TFT<={6'd0, zimo_x_addr-24+1}; //(x1)
							data2_TFT<={6'd0, zimo_y_addr}; //(y1)
							data3_TFT<={6'd0, zimo_x_addr};//(x2)
							data4_TFT<={6'd0, zimo_y_addr+12-1};//(y2)
						end
				8'd3: //7: Fill Data to Write Area, iData1=data, iData2=Color.
					if(cnt_addr_ZiMo3232>=8'd36 ) begin 
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
				8'd4: //8: End Area Write.
					if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
					else begin en_TFT<=1'b1; trigger_TFT<=4'd8; end //End Area Write. 
				8'd5:
					if(select_PulseCounter==4'd7) begin select_PulseCounter<=4'd0; i<=i+1'b1; end
					else begin select_PulseCounter<=select_PulseCounter+1'b1; i<=8'd1; end
				8'd6: 
					begin done_r<=1'b1; i<=i+1'b1; end
				8'd7:
					begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd5: //5: Draw PulseCounter Curve.
			//Draw PulseCounter Curve in rectangle (10,100)-(10+190,100+600)=(200,700).
			case(i) 
				8'd0: 
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
				8'd1: 
					begin done_r<=1'b1; i<=i+1'b1; end
				8'd2:
					begin done_r<=1'b0; i<=8'd0; end
			endcase
		4'd6: 
			i<=i;
	endcase
////////////////////////
/*
else 	case(i)

			8'd2: //60Hz Refresh Rate.
				//if(cnt_60Hz==19'd1000)
					i<=i+1'b1;

			8'd43: //Begin to write 0~9. Pulse Accumulation Counter.
				begin 
					zimo_x_addr<=10'd430; 
					zimo_y_addr<=10'd400;

					cnt_addr_ZiMo3232<=8'd0;
					addr_ZiMo3232<=11'd1024; //0 start from 1024 offset.
					i<=i+1'b1; 
				end
			8'd44: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
				if(done_TFT) begin 
								en_TFT<=1'b0; 
								zimo_x_addr<=zimo_x_addr; //keep X.
								zimo_y_addr<=zimo_y_addr+12; //update y.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd6; //6: PreSet Write Area.
						data1_TFT<={6'd0, zimo_x_addr-24+1}; //(x1)
						data2_TFT<={6'd0, zimo_y_addr}; //(y1)
						data3_TFT<={6'd0, zimo_x_addr};//(x2)
						data4_TFT<={6'd0, zimo_y_addr+12-1};//(y2)
					end
			8'd45: //7: Fill Data to Write Area, iData1=data.
				if(cnt_addr_ZiMo3232>=8'd36 ) begin cnt_addr_ZiMo3232<=8'd0; i<=i+1'b1; end
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
			8'd46: //8: End Area Write.
				if(done_TFT) begin 
								en_TFT<=1'b0; 



								//next step.
								i<=i+1'b1; 
							end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd8; //End Area Write.
					end 
			8'd47:
				if(cnt_10bits==4'd9) begin 
										cnt_10bits<=4'd0; 
										//Initial y offset=42.
										zimo_y_addr<=10'd42; 
										i<=i+1'b1; 
									end
				else begin cnt_10bits<=cnt_10bits+1'b1; i<=8'd44; end
				
			//Read Pulse Counter from FIFO.
			8'd48: //Read PulseCounter from FIFO.
				if(empty_FIFO==1'b1) begin 
										i<=i; 
									end
				else
					begin 
						rd_en_FIFO<=1'b1; 
						PulseCounter<=data_out_FIFO;
						i<=i+1'b1; 
					end					
			8'd49:
				begin 
					rd_en_FIFO<=1'b0; 
					i<=i+1'b1; 
				end
			8'd50:
				begin
				//PulseCounter<=8'd20;//data_out_FIFO; //8'd10;
				i<=i+1'b1;
				end
			8'd51: //Draw A HLine, iData1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=i+1'b1; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd4; //4: Draw A HLine. 
						data1_TFT<=16'd0+10; //(x1). +10 offset.
						data2_TFT<={8'h00,PulseCounter+10}; //(x2).
						//data2_TFT<={8'h00,8'd100}; //(x2).
						data3_TFT<={6'd0,zimo_y_addr}; //(y1).
						data4_TFT<=16'hF800; //(Color).
					end
			8'd52:
				if(zimo_y_addr==10'd760-1) begin 
											zimo_y_addr<=10'd42; //Initial Value.
											i<=i+1'b1; 
										end
				else begin 
						zimo_y_addr<=zimo_y_addr+1'b1;
						i<=8'd48; //paint next PulseCounter.
					end 
			8'd53: //9: Fast Clear Screen, iData1=(x1),iData2=(y1),iData3=(x2),iData4=(y2),iData5=(Background Color).
				if(done_TFT) begin en_TFT<=1'b0; i<=8'd48; end
				else begin 
						en_TFT<=1'b1; 
						trigger_TFT<=4'd9; //9.Fast Clear Screen.
						data1_TFT<=16'd10; //(x1)
						data2_TFT<=16'd50; //(y1)
						data3_TFT<=16'd240-1; //(x2)
						data4_TFT<=16'd760-1; //(y2)
						data5_TFT<=16'h0000; //Black.
					end
		endcase
*/

endmodule
