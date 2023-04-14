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
    input [1:0] iCall,
    input iDone,
    output [1:0] oDone,
    output [3:0] oCall
    );


parameter 
IDLE=4'd0, //Idle State.
WRITE=4'd1, //SDRAM Write.
READ=4'd4, //SDRAM Read.
REFRESH=4'd7, //SDRAM Refresh.
INITIAL=4'd8; //SDRAM Initial.

//7.8125uS to refresh SDRAM.
parameter TREF=11'd1040;
reg [10:0] C1; //counter.

//[3]:Write, [2]:Read, [1]:Refresh, [0]:Initial.
reg [3:0] oCall_r;
assign oCall=oCall_r;

//Read & Write done signal.
reg [1:0] oDone_r;
assign oDone=oDone_r;

//driven by step i.
reg [3:0] i;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd8; //Initial.
				C1<=11'd0;
				oCall_r<=4'b0000;
				oDone_r<=2'b00;
			end
else case(i)
		4'd0:
			if(C1>=TREF)	begin 
								C1<=11'd0;
								i<=4'd7; //go to Refresh step.
							end
			else if(iCall[1])	begin 
									C1<=C1+1'b1;
									i<=4'd1; //go to Write step.
								end
			else if(iCall[0])	begin 
									C1<=C1+1'b1;
									i<=4'd4; //go to Read step.
								end
			else	begin
						C1<=C1+1'b1;
					end
			
		4'd1: //bit[3]=1: Write Operation.
			if(iDone) begin oCall_r[3]<=1'b0; C1<=C1+1'b1; i<=i+1'b1; end
			else begin oCall_r[3]<=1'b1; C1<=C1+1'b1; end

		4'd2: //generate Write done signal.
			begin oDone_r[1]<=1'b1; C1<=C1+1'b1; i<=i+1'b1; end

		4'd3:
			begin oDone_r[1]<=1'b0; C1<=C1+1'b1; i<=4'd0; end

		4'd4: //bit[2]=1: Read Operation.
			if(iDone) begin oCall_r[2]<=1'b0; C1<=C1+1'b1; i<=i+1'b1; end
			else begin oCall_r[2]<=1'b1; C1<=C1+1'b1; end

		4'd5: //generate Read done signal.
			begin oDone_r[0]<=1'b1; C1<=C1+1'b1; i<=i+1'b1; end

		4'd6:
			begin oDone_r[0]<=1'b0; C1<=C1+1'b1; i<=4'd0; end

		4'd7: //bit[1]=1: Refresh Operation.
			if(iDone) begin oCall_r[1]<=1'b0; C1<=C1+1'b1; i<=4'd0; end
			else begin oCall_r[1]<=1'b1; C1<=C1+1'b1; end

		4'd8: //bit[0]=1:Initial Operation.
			if(iDone) begin oCall_r[0]<=1'b0; i<=4'd0; end
			else begin oCall_r[0]<=1'b1; C1<=C1+1'b1; end
	endcase
endmodule
