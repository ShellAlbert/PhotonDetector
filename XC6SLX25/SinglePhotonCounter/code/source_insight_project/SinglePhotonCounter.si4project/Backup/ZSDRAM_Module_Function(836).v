`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:58 03/16/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Function 
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
module ZSDRAM_Module_Function(
    input clk,
    input rst_n,

	input [3:0] iCall, //initial,refresh,read,write.
    output oDone, //done pulse.
    input [23:0] iAddr, //Bank(2)+Row(13)+Column(9)=(24).
    input [15:0] iData, //input data, write to SDRAM.
    output [15:0] oData, //read back data from SDRAM.
    
    //Physical Pins connect to SDRAM Integrated Chip.
    output S_CKE, //SDRAM_SCKE, Clock Enable.
    output S_nCS, //SDRAM_nSCS, Chip Select.
    output S_nRAS, //SDRAM_nSRAS, Raw Address Strobe.
    output S_nCAS, //SDRAM_nSCAS, Column Address Strobe.
    output S_nWE, //SDRAM_nWE, Write Enalbe.
    output [1:0] S_BA, //SDRAM_BA0, SDRAM_BA1, Bank Address.
    output [12:0] S_A, //SDRAM_A[12:0], Address Bus.
    output [1:0] S_DQM, //SDRAM_LDQM/UDQM, low/high byte mask.
    output [15:0] S_DQ //SDRAM_DQ[15:0], Data Bus.
    );

reg isOut;
reg isDone;

reg [1:0] BA_r;
assign S_BA=BA_r;

reg [12:0] ADDR_r;
assign S_A=ADDR_r;

//Attention Here!
//iData drives S_DQ directly.
assign S_DQ=isOut ? iData : 16'hzzzz;

reg [1:0] DQM_r;
assign S_DQM=DQM_r;

reg [15:0] rdData_r;
assign oData=rdData_r;

//SDRAM command: CKE,CS_N,RAS_N,CAS_N,WE_N.
parameter 
CMD_INIT=5'b01111, //Power on initial ports.
CMD_NOP=5'b10111, //Empty Command.
CMD_ACT=5'b10011, //Active Command, select Bank and Row Address.
CMD_WR=5'b10100, //Write Command.
CMD_RD=5'b10101, //Read Command.
CMD_BSTP=5'b10110, //Burst Stop.
CMD_PR=5'b10010, //Precharge Command.
CMD_AR=5'b10001, //Auto-Refresh command.
CMD_LMR=5'b10000; //Load Mode Register command.
reg [4:0] cmd_r;
assign {S_CKE,S_nCS,S_nRAS,S_nCAS,S_nWE}=cmd_r;

//accurate counter from 133MHz clock.
parameter T100US=14'd13300;
//tRP-20nS, tRRC-63nS, tRCD-20nS, tMRD-2 CLK, tWR/tDPL-2 CLK, CAS Latency-3 CLK.
parameter TRP=14'd3, TRRC=14'd9, TMRD=14'd2, TRCD=14'd3, TWR=14'd2, CL=14'd3;

reg [4:0] i; //driven by step i.
reg [13:0] C1; //counter.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				C1<=14'd0;
				cmd_r<=CMD_NOP;
				BA_r<=2'b11;
				ADDR_r<=13'h1fff;
				DQM_r<=2'b00;
				isOut<=1'b1; //output state at default.
				isDone<=1'b1;
			end
else	begin
			if(iCall[3])	begin  //bit[3]=1: Write Operation.
								case(i)
									4'd0: //Set IO to output state.
										begin isOut<=1'b1; i<=i+1'b1; end
										
									4'd1: //Send Active Command with Bank and Row Address.
										begin 
											cmd_r<=CMD_ACT; 
											BA_r<=iAddr[23:22]; //Bank Address.
											ADDR_r<=iAddr[21:9]; //Row Address.
											i<=i+1'b1;
										end
										
									4'd2: //wait TRCD 20ns.
										if(C1==TRCD-1) begin C1<=14'd0; i<=i+1'b1; end
										else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
										
									4'd3: //Send Write cmd with Column Address, pull up A10 1 clk to PR.
										begin
											cmd_r<=CMD_WR;
											BA_r<=iAddr[23:22]; //Bank Address.
											ADDR_r<={4'b0010,iAddr[8:0]}; //Column Address.
											i<=i+1'b1;
										end

									4'd4: //wait TWR 2 clock.
										if(C1==TWR-1) begin C1<=14'd0; i<=i+1'b1; end
										else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

									4'd5: //wait TRP 20ns.
										if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
										else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

									4'd6: //generate done signal.
										begin isDone<=1'b1; i<=i+1'b1; end

									4'd7: 
										begin isDone<=1'b0; i<=4'd0; end
								endcase
							end
			else if(iCall[2])	begin //bit[2]=1:Read Operation.
									case(i)
										4'd0: //Set IO to input state.
											begin isOut<=1'b0; i<=i+1'b1; end
											
										4'd1: //Send Active Command with Bank & Row Address.
											begin
												cmd_r<=CMD_ACT; //Active Command.
												BA_r<=iAddr[23:22]; //Bank Address.
												ADDR_r<=iAddr[21:9]; //Row Address.
												i<=i+1'b1;
											end
											
										4'd2: //wait TRCD 20ns.
											if(C1==TRCD-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

										4'd3: //Send Read command and Column Address, Pull up A10 to RP.
											begin
												cmd_r<=CMD_RD; //Read Cmd.
												BA_r<=iAddr[23:22]; //Bank Address.
												ADDR_r<={4'b0010,iAddr[8:0]}; //Column Address.4+9=13.
												i<=i+1'b1;
											end
											
										4'd4: //wait CL 3 clock.
											if(C1==CL-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

										4'd5: //Read data.
											begin rdData_r<=S_DQ; i<=i+1'b1; end

										4'd6: //wait TRP 20ns.
											if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

										4'd7: //generate done signal.
											begin isDone<=1'b1; i<=i+1'b1; end

										4'd8:
											begin isDone<=1'b0; i<=4'd0; end
									endcase
								end
			else if(iCall[1])	begin //bit[1]=1: Refresh Operation.
									case(i)
										4'd0: //T0:Send Precharge Command.
											begin cmd_r<=CMD_PR; i<=i+1'b1; end
											
										4'd1: //T1:wait TRP 20ns.
											if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

										4'd2: //T2:Send Auto Refresh Command.
											begin cmd_r<=CMD_AR; i<=i+1'b1; end
											
										4'd3: //T3:Wait TRRC 63nS.
											if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end

										4'd4: //T4:Send Auto Refresh Command.
											begin cmd_r<=CMD_AR; i<=i+1'b1; end

										4'd5: //Wait TRRC 63nS.
											if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
											
										4'd6: //generate done signal.
											begin isDone<=1'b1; i<=i+1'b1; end

										4'd7: 
											begin isDone<=1'b0; i<=4'd0; end
									endcase
								end
			else if(iCall[0])	begin //bit[0]=1:Initial Operation.
									case(i)
										4'd0: //delay 100us.
											if(C1==T100US-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin C1<=C1+1'b1; end	
											
										4'd1: //send Precharge command, pull up Address & BankAddress.
											begin 
												cmd_r<=CMD_PR;
												BA_r<=2'b11; 
												ADDR_r<=13'h1ffff;
												i<=i+1'b1; 
											end
											
										4'd2: //wait TRP 20ns.
											if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
											
										4'd3: //send Auto Refresh Command.
											begin cmd_r<=CMD_AR; i<=i+1'b1; end
											
										4'd4: //wait TRRC 63nS.
											if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
											
										4'd5: //Send Auto Refresh Command.
											begin cmd_r<=CMD_AR; i<=i+1'b1; end
											
										4'd6: //wait TRRC 63nS.
											if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
											
										4'd7: //Send LMR cmd,burst read&write, 3'b011 mean CAS latency=3, Sequential, 1 burst length.
											begin 
												cmd_r<=CMD_LMR; 
												BA_r<=2'b11;
												ADDR_r<={3'd0,1'b0,2'd0,3'b011,1'b0,3'b000};
												i<=i+1'b1;
											end
											
										4'd8: //Send 2 NOP clk for tMRD.
											if(C1==TMRD-1) begin C1<=14'd0; i<=i+1'b1; end
											else begin cmd_r<=CMD_NOP; C1<=C1+1'b1; end
											
										4'd9: //generate done signal.
											begin isDone<=1'b1; i<=i+1'b1; end

										4'd10:
											begin isDone<=1'b0; i<=4'd0; end
									endcase
								end
		end
endmodule
