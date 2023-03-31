`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:05 03/16/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Demo 
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
module ZSDRAM_Module_Demo(
    input clk,

    //physical pins used to connect to SDRAM chip.
    output S_CLK,
    output S_CKE,
    output S_nCS,
    output S_nRAS,
    output S_nCAS,
    output S_nWE,
    output [12:0] S_A,
    output [1:0] S_BA,
    output [1:0] S_DQM,
    inout [15:0] S_DQ,
    output LED, 
    output TXD
    );

wire clock1, clock2;
wire rst_n;

//PLL 50MHz->133MHz.
  ZsyPLL u1 
   (// Clock in ports
    .CLK_IN1(clk),      // 50MHz IN.
    // Clock out ports
    .CLK_OUT1(clock1),     // OUT, 133MHz-210 degree phase.
    .CLK_OUT2(clock2),     // OUT, 133MHz, drive S_CLK.
    // Status and control signals
    .LOCKED(rst_n));      // OUT

wire clk_out;
ODDR2 oddr2_inst(
.D0(1'b1),
.D1(1'b0),
.CE(1'b1),
.C0(clock2),
.C1(!clock2),
.R(1'b0),
.S(1'b0),
.Q(clk_out));
assign S_CLK=clk_out;

parameter B115K2=11'd1157,TXFUNC=6'd16;
reg [1:0] isCall;
reg [23:0] addr_r; //SDRAM Address.
reg [15:0] data_wr_to; //Data write to SDRAM.
reg [15:0] data_rd_back; //Data read from SDRAM.
reg rTXD;
assign TXD=rTXD;

wire [1:0] doneU2;
wire [15:0] dataU2;

ZSDRAM_Module_Base u2(
    .clk(clock1),
    .rst_n(rst_n),

    .iAddr(addr_r), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData(data_wr_to), //input data, write to SDRAM.
    .oData(dataU2), //output, read back data from SDRAM.

    .iCall(isCall), //input, [1]=1:Write, [0]=1:Read.
    .oDone(doneU2), //output,[1]=1:write done, [0]=1:read done.
    
    .S_CKE(S_CKE),
    .S_nCS(S_nCS),
    .S_nRAS(S_nRAS),
    .S_nCAS(S_nCAS),
    .S_nWE(S_nWE),
    .S_BA(S_BA),
    .S_A(S_A),
    .S_DQM(S_DQM),
    .S_DQ(S_DQ)
    );

//driven by step i.
reg [5:0] i;
reg [5:0] Go;
reg [10:0] C1;
reg [10:0] T;
reg [31:0] Cnt;
always @(posedge clock1 or negedge rst_n)
if(!rst_n)	begin
				i<=6'd0;
				addr_r<=24'd0;
				data_wr_to<=16'd0;
				data_rd_back<=16'd0;
				isCall<=2'b00;
				rTXD<=1'b1;
				Go<=6'd0;
				C1<=11'd0;
				T<=11'd0;
				Cnt<=32'd0;
			end
else	case(i)
			6'd0: //Write 0xABCD to Address 0.
				if(doneU2[1]) begin isCall[1]<=1'b0; i<=i+1'b1; end
				else begin isCall[1]<=1'b1; end
		
			6'd1: //Read from Address 0 to D3.
				if(doneU2[0]) begin data_rd_back<=dataU2; isCall[0]<=1'b0; i<=i+1'b1; end
				else begin isCall[0]<=1'b1; end
			6'd2:
				begin
					if(data_rd_back==data_wr_to) begin
						T<={2'b11,data_rd_back[15:8],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
						end
					else begin
						T<={2'b11,8'hEE,1'b0};
						i<=6'd28;
						end
				end
				
			6'd3:
				begin
					if(data_rd_back==data_wr_to) begin
						T<={2'b11,data_rd_back[7:0],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
						end
					else begin
						T<={2'b11,8'hFF,1'b0};
						i<=6'd28;
						end
				end
				
			6'd4: //1s delay. 32'd133333333 //500ms  32'd66,666,666
				if(Cnt==32'd6666666) 	begin 
											Cnt<=32'd0; i<=6'd0;

				//OLED:128x64
				//128/8=8, 64/16=4. => 8*4=32.
											//increase address.
											//1MB=1024*1024=1048576
											if(addr_r==24'd1048576)
												addr_r<=24'd0;
											else
												addr_r<=addr_r+1'b1;
											//increase data.
											data_wr_to<=data_wr_to+1'b1;
										end
				else begin Cnt<=Cnt+1'b1; end
				
			6'd16,6'd17,6'd18,6'd19,6'd20,6'd21,6'd22,6'd23,6'd24,6'd25,6'd26:
				if(C1==B115K2-1) begin C1<=11'd0; i<=i+1'b1; end
				else begin rTXD<=T[i-16]; C1<=C1+1'b1; end
				
			6'd27: 
				i<=Go;
			6'd28:
				//error halt here.
				i<=6'd28;
		endcase

reg rled;
assign LED=rled;
always @(posedge clock1 or negedge rst_n)
if(!rst_n)	begin
				rled<=1'b0;
			end
else	begin
			rled<=1'b1;
		end
endmodule
