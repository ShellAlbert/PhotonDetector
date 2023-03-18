`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:20:04 02/28/2023 
// Design Name: 
// Module Name:    ZSDRAM_Module_Cmd 
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
module ZSDRAM_Module(
    input clk,
    input rst_n,
    input [23:0] sys_addr, //SDRAM address,[23:22]:bank address,[21:9]:row address,[8:0]:column address.
    input [3:0] ini_state,
    input [4:0] work_state,
    ///Physical Pins to connect SDRAM chip///
    output sdram_cke_pin, //SDRAM_SCKE, Clock Enable.
    output sdram_clk_pin, //SDRAM_SCLK, clock.
    output sdram_cs_n_pin, //SDRAM_nSCS, Chip Select.
    output sdram_ras_n_pin, //SDRAM_nSRAS, Raw Address Strobe.
    output sdram_cas_n_pin, //SDRAM_nSCAS, Column Address Strobe.
    output sdram_we_n_pin, //SDRAM_nWE, Write Enalbe.
    output [1:0] sdram_bank_pin, //SDRAM_BA0, SDRAM_BA1, Bank Address.
    output [12:0] sdram_addr_pin, //SDRAM_A[12:0], Address Bus.
    output [15:0] sdram_data_pin, //SDRAM_DQ[15:0], Data Bus.
    output sdram_ldqm_pin, //SDRAM_LDQM, low byte mask.
    output sdram_udqm_pin //SDRAM_UDQM, upper byte mask.
    );

/*
//Bank Address.
reg [1:0] sdram_bank_r;
assign sdram_bank_pin=sdram_bank_r;

//Address bus.
//Multiplexed pins for row and column address.
//Row addresss: A[11:0], Column Address: A[8:0].
reg [12:0] sdram_addr_r;
assign sdram_addr_pin=sdram_addr_r;

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
reg [4:0] sdram_cmd_r;
assign {sdram_cke_pin,sdram_cs_n_pin,sdram_ras_n_pin,sdram_cas_n_pin,sdram_we_n_pin}=sdram_cmd_r;

//driven by step i.
reg [3:0] i;

reg [13:0] C1; //counter.
parameter T100US=14'd12332;
parameter TRP=14'd2222;
parameter TRRC=14'd22222;
parameter TMRD=14'd2333;
reg isDone;
//Initial Process.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sdram_cmd_r<=CMD_INIT;
				sdram_bank_r<=2'b11;
				sdram_addr_r<=13'h1ffff; //Addr[12:0] all set to 1.
				i<=4'd0;
			end
else	begin
			case(i)
				4'd0: //delay 100us.
					if(C1==T100US-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin C1<=C1+1'b1; end	
					
				4'd1: //send Precharge command, pull up Address & BankAddress.
					begin sdram_cmd_r<=CMD_PR; sdram_addr_r<=13'h1ffff; sdram_bank_r<=2'b11; i<=i+1'b1; end
					
				4'd2: //wait TRP 20ns.
					if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd3: //send Auto Refresh Command.
					begin sdram_cmd_r<=CMD_AR; i<=i+1'b1; end
					
				4'd4: //wait TRRC 63nS.
					if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd5: //Send Auto Refresh Command.
					begin sdram_cmd_r<=CMD_AR; i<=i+1'b1; end
					
				4'd6: //wait TRRC 63nS.
					if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd7: //Send LMR cmd,burst read&write, 3'b011 mean CAS latency=3, Sequential, 1 burst length.
					begin 
						sdram_cmd_r<=CMD_LMR; 
						sdram_bank_r<=2'b11;
						sdram_addr_r<={3'd0,1'b0,2'd0,3'b011,1'b0,3'b000};
						i<=i+1'b1;
					end
					
				4'd8: //Send 2 NOP clk for tMRD.
					if(C1==TMRD-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd9: //generate done signal.
					begin isDone<=1'b1; i<=i+1'b1; end

				4'd10:
					begin isDone<=1'b0; i<=4'd0; end
			endcase
		end

//Refresh Process.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sdram_cmd_r<=CMD_INIT;
				sdram_bank_r<=2'b11;
				sdram_addr_r<=13'h1ffff; //Addr[12:0] all set to 1.
				i<=4'd0;
			end
else	begin
			case(i)
				4'd0: //T0:Send Precharge Command.
					begin sdram_cmd_r<=CMD_PR; i<=i+1'b1; end
					
				4'd1: //T1:wait TRP 20ns.
					if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd2: //T2:Send Auto Refresh Command.
					begin sdram_cmd_r<=CMD_AR; i<=i+1'b1; end
					
				4'd3: //T3:Wait TRRC 63nS.
					if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd4: //T4:Send Auto Refresh Command.
					begin sdram_cmd_r<=CMD_AR; i<=i+1'b1; end

				4'd5: //Wait TRRC 63nS.
					if(C1==TRRC-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd6: //generate done signal.
					begin isDone<=1'b1; i<=i+1'b1; end

				4'd7: 
					begin isDone<=1'b0; i<=4'd0; end
			endcase
		end

//Write Process.
reg isOut;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sdram_cmd_r<=CMD_INIT;
				sdram_bank_r<=2'b11;
				sdram_addr_r<=13'h1ffff; //Addr[12:0] all set to 1.
				i<=4'd0;
			end
else	begin
			case(i)
				4'd0: //Set IO to output state.
					begin isOut<=1'b1; i<=i+1'b1; end
					
				4'd1: //Send Active Command with Bank and Row Address.
					begin 
						sdram_cmd_r<=CMD_ACT; 
						sdram_bank_r<=sys_addr[23:22];
						sdram_addr_r<=sys_addr[21:9]; //Row Address.
						i<=i+1'b1;
					end
					
				4'd2: //wait TRCD 20ns.
					if(C1==TRCD-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end
					
				4'd3: //Send Write cmd with Column Address, pull up A10 1 clk to PR.
					begin
						sdram_cmd_r<=CMD_WR;
						sdram_bank_r<=sys_addr[23:22];
						sdram_addr_r<=sys_addr[8:0]; //Column Address.
						i<=i+1'b1;
					end

				4'd4: //wait TWR 2 clock.
					if(C1==TWR-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd5: //wait TRP 20ns.
					if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd6: //generate done signal.
					begin isDone<=1'b1; i<=i+1'b1; end

				4'd7: 
					begin isDone<=1'b0; i<=4'd0; end
			endcase
		end

//Read Process.
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sdram_cmd_r<=CMD_INIT;
				sdram_bank_r<=2'b11;
				sdram_addr_r<=13'h1ffff; //Addr[12:0] all set to 1.
				i<=4'd0;
			end
else	begin
			case(i)
				4'd0: //Set IO to input state.
					begin isOut<=1'b0; i<=i+1'b1; end
					
				4'd1: //Send Active Command with Bank & Row Address.
					begin
						sdram_cmd_r<=CMD_ACT;
						sdram_bank_r<=sys_addr[23:22];
						sdram_addr_r<=sys_addr[21:9]; //Row Address.
						i<=i+1'b1;
					end
					
				4'd2: //wait TRCD 20ns.
					if(C1==TRCD-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd3: //Send Read command and Column Address, Pull up A10 to RP.
					begin
						sdram_cmd_r<=CMD_RD;
						sdram_bank_r<=sys_addr[23:22];
						sdram_addr_r<={4'b0010,sys_addr[8:0]}; //Column Address.4+9=13.
						i<=i+1'b1;
					end
					
				4'd4: //wait CL 3 clock.
					if(C1==CL-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd5: //Read data.
					begin D1<=sdram_data_pin; i<=i+1'b1; end

				4'd6: //wait TRP 20ns.
					if(C1==TRP-1) begin C1<=14'd0; i<=i+1'b1; end
					else begin sdram_cmd_r<=CMD_NOP; C1<=C1+1'b1; end

				4'd7: //generate done signal.
					begin isDone<=1'b1; i<=i+1'b1; end

				4'd8:
					begin isDone<=1'b0; i<=4'd0; end
			endcase
		end
*/
endmodule
