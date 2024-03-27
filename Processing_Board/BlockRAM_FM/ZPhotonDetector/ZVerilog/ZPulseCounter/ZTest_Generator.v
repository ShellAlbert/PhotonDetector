`timescale 1ns / 1ps

//we use this module to generate inner fixed frequency for testing mode.
//In normal mode, this module will be shut down to reduce power consumption.

//The Main Clock is 100MHz,
//so t=(1/100MHz)S=(1000/100MHz)mS=(1000,000/100MHz)us=(1/100)uS=0.01uS=10nS
module ZTest_Generator(
    input iClk,
    input iRst_N,
    input iEn,

    //Short-connect this pin to iSync50Hz if no external 50Hz Sync Signal was offered.
    output reg oSync50Hz,
    output reg oPulseCounter
    );

//100MHz/50Hz/2=1_000_000
parameter CNT_50Hz=1_000_000;
//100MHz/1MHz/2=50
parameter CNT_1MHz=50;

//generate Fixed Frequency Pulse.
reg [31:0] CNT1;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT1<=0;
    oSync50Hz<=1'b0;
end
else if(iEn) begin
                if(CNT1==CNT_50Hz) begin
                    CNT1<=0;
                    oSync50Hz<=~oSync50Hz;
                end
                else begin
                    CNT1<=CNT1+1;
                end
    end
    else begin
        CNT1<=0;
        oSync50Hz<=1'b0;
    end
///////////////////////////////////////////////
reg [31:0] CNT2;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT2<=0;
    oPulseCounter<=1'b0;
end
else if(iEn) begin
                if(CNT2==CNT_1MHz) begin
                    CNT2<=0;
                    oPulseCounter<=~oPulseCounter;
                end
                else begin
                    CNT2<=CNT2+1;
                end
    end
    else begin
        CNT2<=0;
        oPulseCounter<=1'b0;
    end
endmodule
