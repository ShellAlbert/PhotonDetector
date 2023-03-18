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
module ZSDRAM_Module_Cmd(
    input clk,
    input rst_n,
    input [23:0] sys_addr, //SDRAM address,[23:22]:bank address,[21:9]:row address,[8:0]:column address.
    input [3:0] ini_state,
    input [4:0] work_state,
    output sdram_cke_pin, //Clock Enable.
    output sdram_cs_n_pin, //Chip Select.
    output sdram_ras_n_pin, //Raw Address Strobe.
    output sdram_cas_n_pin, //Column Address Strobe.
    output sdram_we_n_pin, //Write Enalbe.
    output [1:0] sdram_bank_pin, //2 Banks.
    output [12:0] sdram_addr_pin //Address.
    );
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


always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				sdram_cmd_r<=CMD_INIT;
				sdram_bank_r<=2'b11;
				sdram_addr_r<=13'h1ffff; //Addr[12:0] all set to 1.
			end
endmodule
