`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:56 03/16/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Ctrl 
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
module ZSDRAM_Module_Ctrl(
    input clk,
    input rst_n,
    
	//[1]=Word(s) Write, [0]=Word(s) Read.
    input [1:0] iReq,
    input iDone,
	
	//[1]=Word(s) Write done,[0]=Word(s) Read one.
    output reg [1:0] oDone,
	//initial[0], refresh[1], read[2], write[3].
    output reg [3:0] oReq
    );


parameter 
IDLE=4'd0, //Idle State.
WRITE=4'd1, //SDRAM Write.
READ=4'd4, //SDRAM Read.
REFRESH=4'd7, //SDRAM Refresh.
INITIAL=4'd8; //SDRAM Initial.

//7.8125uS to refresh SDRAM.
//parameter TREF=11'd1040;
//if we write one word each time, 11'd1040 refresh period is okay.
//but if we write four words each time, 11'd1040 is too large.
//it causes SDRAM data change,
//in order to keep data safety, reduce refresh period down to 11'd1000.
//it's okay.
//parameter TREF=11'd1000; //133MHz.


parameter TREF=11'd600; //80MHz.
reg [10:0] C1; //counter.


//driven by step i.
reg [3:0] i;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd8; //Initial.
				C1<=11'd0;
				oReq<=4'b0000;
				oDone<=2'b00;
			end
else case(i)
		4'd0:
			if(C1>=TREF)	begin 
								C1<=11'd0;
								i<=4'd7; //go to Refresh.
							end
			else if(iReq[1])	begin 
									C1<=C1+1'b1;
									i<=4'd1; //go to Word(s) Write.
								end
			else if(iReq[0])	begin 
									C1<=C1+1'b1;
									i<=4'd4; //go to Word(s) Read.
								end
			else	begin
						C1<=C1+1'b1;
					end
			
		4'd1: //bit[3]=1: Word(s) Write Operation.
			if(iDone) begin oReq[3]<=1'b0; C1<=C1+1'b1; i<=i+1'b1; end
			else begin oReq[3]<=1'b1; C1<=C1+1'b1; end

		4'd2: //generate Write done signal.
			begin oDone[1]<=1'b1; C1<=C1+1'b1; i<=i+1'b1; end

		4'd3:
			begin oDone[1]<=1'b0; C1<=C1+1'b1; i<=4'd0; end

		4'd4: //bit[2]=1: Word(s) Read Operation.
			if(iDone) begin oReq[2]<=1'b0; C1<=C1+1'b1; i<=i+1'b1; end
			else begin oReq[2]<=1'b1; C1<=C1+1'b1; end

		4'd5: //generate Read done signal.
			begin oDone[0]<=1'b1; C1<=C1+1'b1; i<=i+1'b1; end

		4'd6:
			begin oDone[0]<=1'b0; C1<=C1+1'b1; i<=4'd0; end

		4'd7: //bit[1]=1: Refresh Operation.
			if(iDone) begin oReq[1]<=1'b0; C1<=C1+1'b1; i<=4'd0; end
			else begin oReq[1]<=1'b1; C1<=C1+1'b1; end

		4'd8: //bit[0]=1:Initial Operation.
			if(iDone) begin oReq[0]<=1'b0; i<=4'd0; end
			else begin oReq[0]<=1'b1; C1<=C1+1'b1; end
	endcase
endmodule

