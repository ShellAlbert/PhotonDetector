`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:00 04/02/2023 
// Design Name: 
// Module Name:    ZSinglePhotonCounter 
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
module ZSinglePhotonCounter(
    input clk,

	input ex_pulse, //external photon pulse input pin.
	output test_pulse, //test pulse output, short connect to pulse.
	output reg time_cost, //used to check time cost.
	
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );

//On-board Clock=50MHz.
wire clk_80MHz;
wire rst_n;
ZsyPLL ic_PLL
(// Clock in ports
.CLK_IN1(clk),      // IN
// Clock out ports
.CLK_OUT1(clk_80MHz),     // OUT
// Status and control signals
.LOCKED(rst_n));      // OUT


//Adapter for TFT4.3" Module.
reg en_Adapter;
reg [3:0] trigger_Adapter;
wire done_Adapter;
ZTFT43_Adapter ic_Adapter(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(en_Adapter),

    .ex_pulse(ex_pulse), //external photon pulse input pin.
    //0: Idle.
    //1: Draw fixed (not changed) parts.
    //2: Draw SIN WAVE.
    //3. Draw RTC.
    //4. Draw PulseCounter.
    .iTrigger(trigger_Adapter),
    .done(done_Adapter),

	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST),
    .BL_CTR(BL_CTR), //BackLight Ctrl.
    .LCD_CS(LCD_CS),
    .LCD_RS(LCD_RS),
    .LCD_WR(LCD_WR),
    .LCD_RD(LCD_RD),
    .LCD_DATA(LCD_DATA)
    );


//generate 1Hz Test Pulse, short connect to ex_pulse.
//80MHz/1Hz=80_000_000
reg [27:0] cnt_1Hz;
always@(posedge clk_80MHz or negedge rst_n)
if(!rst_n)
	cnt_1Hz<=28'd0;
else if(cnt_1Hz==28'd80_000_000) 
		cnt_1Hz<=28'd0;
	else
		cnt_1Hz<=cnt_1Hz+1'b1;
assign test_pulse=(cnt_1Hz==28'd80_000_000)?1'b1:1'b0;


//wire pulse_60Hz;
//assign pulse_60Hz=(cnt_1Hz==28'd1_333_333)?1'b1:1'b0;		

//60Hz Refresh Rate: 1s/60Hz=1000ms/60Hz=17ms.
//80MHz/60Hz=1_333_333
reg [19:0] CNT1;

//driven by step i.
reg [3:0] i;
always @(posedge clk_80MHz or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				time_cost<=1'b0;
				CNT1<=0;
			end
else case(i)
		'd0: //0: Draw fixed (not changed) parts.
			if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
			else begin en_Adapter<=1'b1; trigger_Adapter<=4'd1; end
		'd1: //1: Draw SIN WAVE.
			if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
			else begin en_Adapter<=1'b1; trigger_Adapter<=4'd2; end
		'd2: //2. Draw RTC.
			if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
			else begin en_Adapter<=1'b1; trigger_Adapter<=4'd3; end
		'd3: //3. Draw PulseCounter.
			if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
			else begin en_Adapter<=1'b1; trigger_Adapter<=4'd4; end
		'd4: //4. Draw PulseCounter Curve.
			if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
			else begin en_Adapter<=1'b1; trigger_Adapter<=4'd5; end
		'd5:
			begin
				time_cost<=~time_cost;
				i<='d1;
			end
		4'd6: 
			if(CNT1==960_000) begin
								CNT1<=0;
								i<=4'd1;
							end
			else
				CNT1<=CNT1+1'b1;
			
	endcase
endmodule
