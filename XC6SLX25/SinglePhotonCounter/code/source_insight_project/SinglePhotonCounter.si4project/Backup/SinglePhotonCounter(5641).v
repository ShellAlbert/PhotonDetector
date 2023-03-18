`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:28 02/15/2023 
// Design Name: 
// Module Name:    SinglePhotonCounter 
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
`include "zoled/ZOLED_CmdList.v"
//H4,50MHz input.
//H3,LED output.
//RES#(reset),T6.
//D0(SCLK),T8.
//D1(SDIN),T7.
//DC(data command),T5.
//CS,P5.
module SinglePhotonCounter(
   	input clk, //the main clock 50MHz, 
	input signal_pulse, //external pulse input signal,R1.
   	output cs_n, //OLED-SPI-CS. 
	output sclk, //OLED-SPI-D0.
	output dc, //OLED-SPI-DC. 
	output sdin,//OLED-SPI-D1.
	output oled_rst, //OLED-SPI-RES#.
	output led, //led.
	output test_pulse, //test pulse to simulate the real SAPD output.
	output geiger_mode_en, //to Enable Geiger Mode.
	output quench_voltage_down, //to pull down Two side voltage of SAPD.
	output reset_discharge, //to discharge parasite of capacity of SAPD.
	output tx_pin, //UART,tx pin.
	input rx_pin, //UART, rx pin.
	input key_pin //Key (Push Button Pin).
    );
//////////////////////////////////////////////////////////////
//generate reset signal.
wire rst_n;
ZReset_Module u0(
    .clk(clk), //input.
    .rst_n(rst_n) //output.
    );

/////////////////////////////////////////////////////////
//Pulse Counter Module.
wire [3:0] rq0;
wire [3:0] rq1;
wire [3:0] rq2;
wire [3:0] rq3;
wire [3:0] rq4;
wire [3:0] rq5;
wire [3:0] rq6;
wire [3:0] rq7;
wire rOverflow;
reg EnPulseCounter;
ZPulseCounter_Module u1(
    .clk(clk), //input. 50MHz.
    .rst_n(rst_n), //input.
    .en(EnPulseCounter), //input, Key down to reset Counter to zero.
    .pulse(signal_pulse),//external input signal pulse.
    .q0(rq0), //output, Ge wei.
    .q1(rq1), //output, Shi wei.
    .q2(rq2), //output, Bai wei.
    .q3(rq3), //output, Qian wei.
    .q4(rq4), //output, Wan wei.
    .q5(rq5), //output, Shiwan wei.
    .q6(rq6), //output, Baiwan wei.
    .q7(rq7), //output, WanWan Wei.
    .overflow(rOverflow) //output, overflow flag.
    );
    
/////////////////////////////////////////////////////////////
//OLED Controller.
ZOLED_Controller u2(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(1'b1), //input, always enabled.
    .char0(rq0), //input, Ge wei.
    .char1(rq1), //input, Shi wei.
	.char2(rq2), //input, Bai wei.
    .char3(rq3), //input, Qian wei.
    .char4(rq4), //input, Wan wei.
	.char5(rq5), //input, Shi wan wei.
    .char6(rq6), //input, Bai wan wei.
    .char7(rq7), //input, Qian wan wei.
    .cs_pin(cs_n), //output, SPI_CS.
    .sclk_pin(sclk), //ouptut, SPI_SCLK.
    .dc_pin(dc), //output, SPI_DC.
    .sdin_pin(sdin), //output, SPI_DIN.
    .rst_pin(oled_rst)  //output, OLED reset.
    );
//////////////////////////////////////////////////
//UART to transmit Pulse Counter to PC.
ZUART_Controller u3(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(1'b1), //input.
    .char0(rq0), //input, Gei wei.
    .char1(rq1), //input, Shi wei.
    .char2(rq2), //input, Bai wei.
    .char3(rq3), //input, Qian wei.
    .char4(rq4), //input, Wan wei.
    .char5(rq5), //input, Shi wan wei.
    .char6(rq6), //input, Bai wan wei.
    .char7(rq7), //input, Qian wan wei.
    .tx_pin(tx_pin), //output.
    .rx_pin(rx_pin) //input.
    );
//////////////////////////////////////////////
//Key (PushButton) Module.
wire key_down;
wire key_up;
ZKey_Module u4(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(1'b1), //input, always Enabled.
    .key_pin(key_pin), //input, physical key pin.
    .key_down(key_down), //output, one pulse.
    .key_up(key_up) //output, one pulse.
    );
//make connections between Key & Pulse_Counter.
//key down to reset Counter to zero.
//key up has nothing to do.
always @(posedge clk or negedge rst_n)
if(!rst_n)
	EnPulseCounter<=1'b1;
else if(key_down)
		EnPulseCounter<=1'b0;
	else
		EnPulseCounter<=1'b1;
////////////////////////////////////////////////////////////
//sys clk led indicator.
//50MHz/1Hz=50,000,000
reg rled;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	rled<=1'b0;
else if(key_down)
		rled<=1'b1;
else if(key_up)
		rled<=1'b0;
assign led=rled;
/////////////////////////////////////////////////////////////
//generate 1Hz signal.
//12MHz/1Hz/2=6,000,000
reg [23:0] cnt_1hz;
wire sig_1hz /* synthesis syn_keep = 1 */;
always @(posedge clk_12MHz or negedge rst_n)
if(!rst_n)
	cnt_1hz<=24'd0;
else if(cnt_1hz==24'd6000000-1)
		cnt_1hz<=24'd0;
	else
		cnt_1hz<=cnt_1hz+1'b1;
assign sig_1hz=(cnt_1hz==24'd6000000-1)?1'b1:1'b0;

/////////////////////////////////////////////////////////////
//IP cores are not available in ModelSim.
//50MHz/12MHz/2=2.
wire clk_12MHz;
reg [1:0] cnt_12MHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_12MHz<=2'd0;
else
begin
	if(cnt_12MHz==2'd2-1)
		cnt_12MHz<=2'd0;
	else
		cnt_12MHz<=cnt_12MHz+1'b1;
end
assign clk_12MHz=(cnt_12MHz==2'd2-1)?1'b1:1'b0;
//generate test pulse to work as the real SAPD output signal.
//12MHz/1Hz/2=12,000,000
//12MHz/10Hz/2=6,000,000
reg [23:0] cnt_test_pulse;
always @(posedge clk_12MHz or negedge rst_n)
if(!rst_n)
	cnt_test_pulse<=24'd0;
else if(cnt_test_pulse>=24'd2_000_000)
			cnt_test_pulse<=24'd0;
		else
			cnt_test_pulse<=cnt_test_pulse+1'b1;
assign test_pulse=(cnt_test_pulse<=24'd1_000_000)?1'b1:1'b0;

////////////////////////////////////
//quench and reset logic.
ZQuench_Module u1_ZQuenchModule(
	.clk(clk), //input, 50MHz.
	.rst_n(rst_n),//input, reset signal.
	.geiger_mode_en(geiger_mode_en), //output.
	.quench(quench_voltage_down), //output.
	.reset(reset_discharge) //output.
    );
	 

endmodule
