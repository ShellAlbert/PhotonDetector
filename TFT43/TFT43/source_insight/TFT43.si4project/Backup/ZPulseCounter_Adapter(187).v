`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:41 04/06/2023 
// Design Name: 
// Module Name:    ZPulseCounter_Adapter 
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
module ZPulseCounter_Adapter(
    input clk,
    input rst_n,
    input en,
    //External Photon Pulse.
    input photon_pulse,
    //50Hz sync.
    input sync_50Hz,
    output reg oExtSyncLost,

    //Time Interval Selection.
    input [7:0] iTime_Interval_Selection,
    
	//Pulse Counter Output.
	output oDataUpdate,
    output [31:0] oPulseCouter_LCD,
    output [15:0] oPulseCouter_Single,

    //Accumulated PulseCounter. Never Reset to 0.
   	output [31:0] oPulseCouter_LCD_Accumulated
    );

//Ext AC50Hz Edge Detect.
wire Ext50Hz_rising_edge;
wire Ext50Hz_falling_edge;
ZEdgeDetect ic_Ext50HzEdgeDetect(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .sig_in(sync_50Hz), //External AC50Hz Sync Signal Input.
    .rising_edge(Ext50Hz_rising_edge),
    .falling_edge(Ext50Hz_falling_edge)
    );

//Edge Detect.
wire pulse_rising_edge;
wire pulse_falling_edge;
ZEdgeDetect ic_EdgeDetect(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .sig_in(photon_pulse), //External Photon Pulse Signal Input.
    .rising_edge(pulse_rising_edge),
    .falling_edge(pulse_falling_edge)
    );

//Pulse Counter.
wire overflow;
ZPulseCounter ic_PulseCounter(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .pulse(pulse_rising_edge),
    
     //Time Interval Selection.
    .iTime_Interval_Selection(iTime_Interval_Selection),
    
    .q0_LCD(oPulseCouter_LCD[3:0]),
    .q1_LCD(oPulseCouter_LCD[7:4]),
    .q2_LCD(oPulseCouter_LCD[11:8]),
    .q3_LCD(oPulseCouter_LCD[15:12]),
    .q4_LCD(oPulseCouter_LCD[19:16]),
    .q5_LCD(oPulseCouter_LCD[23:20]),
    .q6_LCD(oPulseCouter_LCD[27:24]),
    .q7_LCD(oPulseCouter_LCD[31:28]),
    .overflow(overflow),
    .oPulseCounter_Single(oPulseCouter_Single),
   	.oDataUpdate(oDataUpdate),
   	
   	//Accumulated PulseCounter. Never Reset to 0.
   	.oPulseCouter_LCD_Accumulated(oPulseCouter_LCD_Accumulated)
    );

//if no Ext AC50Hz Input within 1 seconds,
//it means it losts External Sync Signal.
//80MHz/1Hz=80_000_000
reg [31:0] cnt_1Hz;
reg [7:0] cnt_50Hz;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			oExtSyncLost<=1'b0;
			cnt_1Hz<=0;
			cnt_50Hz<=0;
		end
else if(en) begin
			if(cnt_1Hz>=80_000_000) begin
									cnt_1Hz<=0;
									//////////////////////////////
									//if the count equals 0 within 1 seconds,
									//it means we lost Ext AC50Hz Sync Signal.
									if(cnt_50Hz==0)
										oExtSyncLost<=1'b1; //Lost.
									else
										oExtSyncLost<=1'b0; 
									////////////////////////////
									cnt_50Hz<=0;
								 end
			else begin
					cnt_1Hz<=cnt_1Hz+1'b1;
					///////////////////////////////
					if(Ext50Hz_rising_edge)
						cnt_50Hz<=cnt_50Hz+1'b1;
				end
		 end
	else begin //if(en)
			oExtSyncLost<=1'b0;
			cnt_1Hz<=0;
			cnt_50Hz<=0;
		end
endmodule
