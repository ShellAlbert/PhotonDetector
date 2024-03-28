`timescale 1ns / 1ps

module ZTick_Trigger(
    input iClk,  //100MHz System Clock.
    input iRst_N,

    input iSync50Hz, //External 50Hz Sync.

    output oTickGap, //333uS Tick.
    output oTickReSample, //Start A New Sample.

    //Connect this port to a physical pin to measure how many clocks a series of actions take.
    output reg oClkUsed
    );

//The Main Clock is 100MHz,
//so t=(1/100MHz)S=(1000/100MHz)mS=(1000,000/100MHz)us=(1/100)uS=0.01uS=10nS

//20mS/60 numbers=333.333uS
//333.333uS/0.01uS=33333.
parameter CNT_333uS=33333;
//1S/333uS=1000mS/333uS=1000,000uS/333uS=3003.
parameter CNT_1S=3003;

reg [23:0] CNT1;
reg [7:0] CNT2;

////////////////////////////////////////
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT1<=0;
end
else begin
    if(iSync50Hz) begin
        CNT1<=0;
        //oClkUsed<=1'b0;
    end
    else begin
            if(CNT1==CNT_333uS-1) begin
                CNT1<=0;
                //oClkUsed<=~oClkUsed;
            end
            else begin
                CNT1<=CNT1+1;
            end
    end
end
assign oTickGap=(CNT1==CNT_333uS-1)?1'b1:1'b0;
/////////////////////////////////////////////
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT2<=0;
end
else begin
    if(iSync50Hz) begin
        CNT2<=0;
        //oClkUsed<=1'b0;
    end
    else begin
        if(CNT2==60-1) begin
            CNT2<=0; //60*333uS=20ms
            //oClkUsed<=~oClkUsed;
        end
        else if(CNT1==CNT_333uS-1) begin
            CNT2<=CNT2+1; //CNT2 increase every 333uS.
        end
    end
end
wire tick20mS_i;
assign tick20mS_i=(CNT2==60-1)?1'b1:1'b0;


//for debugging, we use 5seconds here.
//5s/20ms=5000ms/20ms=250
reg [7:0] CNT_ReSample;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT_ReSample<=0;
    oClkUsed<=1'b0;
end
else begin
    if(CNT_ReSample==250-1) begin
        CNT_ReSample<=0;
        oClkUsed<=~oClkUsed;
    end
    else if(tick20mS_i) begin
        CNT_ReSample<=CNT_ReSample+1;
    end
end
assign oTickReSample=(CNT_ReSample==250-1)?(1'b1):(1'b0);
endmodule
