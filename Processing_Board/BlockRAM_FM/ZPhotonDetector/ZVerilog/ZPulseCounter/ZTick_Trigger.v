`timescale 1ns / 1ps


module ZTick_Trigger(
    input iClk,  //100MHz System Clock.
    input iRst_N,

    input iSync50Hz, //External 50Hz Sync.

    output oTick333uS, //333uS Tick.
    output oTick1S,//1S Tick.

    output oTickSample //Start A New Sample.
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

//driven by step i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    step_i<=0;
    CNT1<=0;
end
else begin
    case(step_i)
    0: //Waiting 50Hz Sync.
        begin
            if(iSync50Hz) begin
                CNT1<=0;
                step_i<=step_i+1;
            end
        end
    1: //Do Counting.
        begin
            if(CNT1==CNT_333uS-1) begin
                CNT1<=0;
            end
            else begin
                CNT1<=CNT1+1;
            end
            if(CNT2==60-1) begin
                step_i<=0;
            end
        end
    default:
        begin
            step_i<=0;
        end
    endcase
end
assign oTick333uS=(CNT1==CNT_333uS-1)?1'b1:1'b0;

reg [7:0] step_i2;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    step_i2<=0;
    CNT2<=0;
end
else begin
    case(step_i2)
    0: //Waiting 50Hz Sync.
        begin
            if(iSync50Hz) begin
                CNT2<=0;
                step_i2<=step_i2+1;
            end
        end
    1: //20mS/60 numbers=333uS.
        begin
            if(CNT2==60-1) begin
                CNT2<=0;                
                step_i2<=0;
            end
            else if(CNT1==CNT_333uS-1) begin
                CNT2<=CNT2+1;
            end
        end
    default:
        begin
            step_i2<=0;
        end
    endcase
end
assign oTick1S=(CNT2==60-1)?1'b1:1'b0;


//for debugging, we use 10seconds here.
//10s/1s=10.
reg [7:0] CNT_Sample;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT_Sample<=0;
end
else begin
    if(CNT_Sample==10-1) begin
        CNT_Sample<=0;
    end
    else if(CNT2==60-1) begin
        CNT_Sample<=CNT_Sample+1;
    end
end
assign oTickSample=(CNT_Sample==10-1)?(1'b1):(1'b0);
endmodule
