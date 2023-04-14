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

	input photon_pulse, //E2, external photon pulse input pin.
	input sync_50Hz, //F2, External 50Hz Sync Signal.
	
	output photon_pulse_simulate, //E1, simulate signal to work as photon_pulse for testing.
	output sync_50Hz_simulate, //F1, simulate signal to work as sync_50Hz for testing.
	output reg time_cost, //E3, used to check time cost. 
	
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


//Pulse Counter.
wire data_update;
wire [31:0] dout_PulseCounter;
ZPulseCounter_Adapter ic_PulseCounter_Adapter(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(1'b1), //Always Enabled.
    
    //External Photon Pulse.
    .photon_pulse(photon_pulse),

	//Output data every x seconds.
	.data_update(data_update),
    .dout(dout_PulseCounter)
    );

//Test Signal.
ZTestSignal ic_TestSignal(
    .clk(clk_80MHz),
    .rst_n(rst_n),

	.photon_pulse_simulate(photon_pulse_simulate),
	.sync_50Hz_simulate(sync_50Hz_simulate)
    );


//photon_pulse Sync.
wire photon_pulse_synced;
ZExSignalSync ic_ExSync1(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .sig_in(photon_pulse),
   	.sig_out(photon_pulse_synced)
    );
//sync_50Hz Sync.
wire sync_50Hz_synced;
ZExSignalSync ic_ExSync2(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .sig_in(sync_50Hz),
   	.sig_out(sync_50Hz_synced)
    );

//Adapter for TFT4.3" Module.
reg en_Adapter;
reg [3:0] trigger_Adapter;
wire done_Adapter;
ZTFT43_Adapter ic_Adapter(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(en_Adapter),

    .photon_pulse(photon_pulse_synced), //external photon pulse input pin.
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
			begin
				time_cost<=1'b1;
				if(done_Adapter) begin en_Adapter<=1'b0; i<=i+1'b1; end
				else begin en_Adapter<=1'b1; trigger_Adapter<=4'd2; end
			end
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
				time_cost<=1'b0;
				i<=i+1'b1;
			end
		'd6:
			if(sync_50Hz_synced) 
				i<='d1;
			else 
				i<=i;
		'd7: //Never reach here. 
			if(CNT1==960_000) begin
								CNT1<=0;
								i<=4'd1;
							end
			else
				CNT1<=CNT1+1'b1;
			
	endcase
endmodule
