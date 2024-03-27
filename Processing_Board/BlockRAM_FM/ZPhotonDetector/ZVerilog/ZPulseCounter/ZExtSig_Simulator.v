`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 09:50:30 AM
// Design Name: 
// Module Name: ZExtSig_Simulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//since we have no external human interaction accessories in this hardware version,
//we create this module to generate external signals to simulate a real scene.
//Simulated signals are described as follows:
//oTest_Mode
//[0]=0, Normal Mode, count external photon pulses.
//[0]=1, Test Mode, count inner fixed frequency. 

//oFixedFreq_Sel
//[2:0]=0, select 1KHz as inner fixed frequency.
//[2:0]=1, select 100KHz as inner fixed frequency.
//[2:0]=2, select 1MHz as inner fixed frequency.

//oTime_Interval, select the resetting gap time interval.
//[7:0]=0: 1uS.
//[7:0]=1: 10uS.
//[7:0]=2: 100uS.
//[7:0]=3: 1mS.
//[7:0]=4: 10mS.
//[7:0]=5: 100mS.
//[7:0]=6: 1000mS.

module ZExtSig_Simulator(
    input iClk,
    input iRst_N,
    output oTest_Mode,
    output [2:0] oFixedFreq_Sel,
    output [7:0] oTime_Interval
    );

//oTest_Mode=0: iSig1, External Photon Pulse.
//assign oTest_Mode=1'b0;

//oTest_Mode=1: iSig2, Inner Fixed Frequency Signal.
assign oTest_Mode=1'b1;


//oFixedFreq_Sel
//iSelect=0, 50MHz/1KHz/2=25000
//iSelect=1, 50MHz/100KHz/2=250
//iSelect=2, 50MHz/1MHz/2=25
assign oFixedFreq_Sel=0;

//oTime_Interval.
//0: 1uS.
//1: 10uS.
//2: 100uS.
//3: 1mS.
//4: 10mS.
//5: 100mS.
//6: 1000mS.
assign oTime_Interval=6;
endmodule
