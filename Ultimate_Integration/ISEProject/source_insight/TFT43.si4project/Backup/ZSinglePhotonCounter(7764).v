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
	//use an oscilloscope to check how many clks were used.
    output clk_used, //E3, used to check time cost. 

	output uart_txd, //E4.
	
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

//Sync 50Hz.
wire sync_50Hz_rising;
wire sync_50Hz_falling;
ZEdgeDetect ic_sync_50Hz(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(1'b1),
    .sig_in(sync_50Hz),
    .rising_edge(sync_50Hz_rising),
    .falling_edge(sync_50Hz_falling)
    );
 
//FIFO for PulseCounter.
wire [31:0] din_FIFO;
wire wr_fifo;
wire rd_fifo;
wire [31:0] dout_FIFO;
wire fifo_is_empty;
wire fifo_is_full;
ZPulseCounter_FIFO ic_PulseCounter_FIFO (
  .rst(rst_n), // input rst
  .wr_clk(clk_80MHz), // input wr_clk
  .rd_clk(clk_80MHz), // input rd_clk
  .din(din_FIFO), // input [31 : 0] din
  .wr_en(wr_fifo), // input wr_en
  .rd_en(rd_fifo), // input rd_en
  .dout(dout_FIFO), // output [31 : 0] dout
  .full(fifo_is_full), // output full
  .empty(fifo_is_empty) // output empty
);

//Pulse Counter, Write to FIFO.
wire data_update;
wire [31:0] dout_PulseCounter;
ZPulseCounter_Adapter ic_PulseCounter_Adapter(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(1'b1), //Always Enabled.
    
    //External Photon Pulse.
    .photon_pulse(photon_pulse),
    
    //50Hz sync.
    .sync_50Hz(sync_50Hz_rising),

	//FIFO Glue Logic (Writing).
	.fifo_is_full(fifo_is_full),
	.wr_fifo(wr_fifo),
    .dout(din_FIFO)
    );

//Adapter for TFT4.3" Module, Read from FIFO.
ZTFT43_Adapter ic_Adapter(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(1'b1),

	//External 50Hz Sync Signal.
	.sync_50Hz(sync_50Hz_rising), 
    
	//FIFO Glue Logic (Reading).
	.fifo_is_empty(fifo_is_empty),
	.rd_fifo(rd_fifo),
	.fifo_data(dout_FIFO), 
    
    //use an oscilloscope to check how many clks were used.
    .clk_used(clk_used), 
    
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST),
    .BL_CTR(BL_CTR), //BackLight Ctrl.
    .LCD_CS(LCD_CS),
    .LCD_RS(LCD_RS),
    .LCD_WR(LCD_WR),
    .LCD_RD(LCD_RD),
    .LCD_DATA(LCD_DATA)
    );

ZUART_Controller ic_UART(
    .clk(clk_80MHz),
    .rst_n(rst_n),
    .en(1'b1),
    
    .char0(dout_FIFO[3:0]),
    .char1(dout_FIFO[7:4]),
    .char2(dout_FIFO[11:8]),
    .char3(dout_FIFO[15:12]),
    .char4(dout_FIFO[19:16]),
    .char5(dout_FIFO[23:20]),
    .char6(dout_FIFO[27:24]),
    .char7(dout_FIFO[31:28]),
    .tx_pin(uart_txd)
    );

//Test Signal.
ZTestSignal ic_TestSignal(
    .clk(clk_80MHz),
    .rst_n(rst_n),

	.photon_pulse_simulate(photon_pulse_simulate),
	.sync_50Hz_simulate(sync_50Hz_simulate)
    );
endmodule
