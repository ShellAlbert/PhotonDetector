`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 09:30:08 AM
// Design Name: 
// Module Name: ZTest_Generator
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
//we use this module to generate inner fixed frequency for testing mode.
//In normal mode, this module will be shut down to reduce power consumption.

//50MHz
//t=1/f=1/50MHz(s)=1000/50MHz(ms)=1000,000/50MHz(us)=1000,000/50,000,000Hz(us)
//=1000,000,000/50,000,000Hz(ns)
//=20ns

module ZTest_Generator(
    input iClk,
    input iRst_N,
    input iEn,
    //iSelect=0, 1KHz.
    //iSelect=1, 100KHz.
    //iSelect=2, 1MHz.
    input [2:0] iSelect,
    output oFixedFreq, //inner use.
    output reg oFixedFreq_IO //output to IO pins.
    );

//iSelect=0, 50MHz/1KHz/2=25000
//iSelect=1, 50MHz/100KHz/2=250
//iSelect=2, 50MHz/1MHz/2=25
reg [31:0] CNT_Dest;
always @(*)
begin
    case(iSelect)
        0: CNT_Dest<=25000;
        1: CNT_Dest<=250;
        2: CNT_Dest<=25;
        default: CNT_Dest<=25;
    endcase
end

//generate Fixed Frequency Pulse.
reg [31:0] CNT;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    CNT<=0;
    oFixedFreq_IO<=1'b0;
end
else if(iEn) begin
                if(CNT==CNT_Dest) begin
                    CNT<=0;
                    oFixedFreq_IO<=~oFixedFreq_IO;
                end
                else begin
                    CNT<=CNT+1;
                end
    end
    else begin
        CNT<=0;
        oFixedFreq_IO<=1'b0;
    end

//This approach only generates a narrow clock pulse.
assign oFixedFreq=(CNT==CNT_Dest)?1'b1:1'b0;
endmodule
