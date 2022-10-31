`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:32:57 10/28/2022 
// Design Name: 
// Module Name:    ZsySPI 
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
module ZsySPI_TxByte(
    input clk,
    input rst_n,
	input en, //enable signal, keep high during operation.
	input [7:0] txByte,
	input dc_flag, //data or command flag?
    output reg cs_n,  //Pin-7,CS.
    output reg sclk, //Pin-3,D0.
    output dc, //Pin-6,DC.
    output reg sdin,//Pin-4,D1.
	output reg isDone //one pulse to indicate end.
    );
	 
//When the pin is pulled high, the input at D7~D0 is treated as display data. 
//When the pin is pulled low, the input at D7~D0 will be transferred to the command register.
parameter DC_DATA=1'b1;
parameter DC_CMD=1'b0;

//data or command depends on top module.
assign dc=dc_flag;

//driven by step i.
reg [4:0] i;
reg [7:0] tmpTxByte;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
					cs_n<=1'b1;
					sclk<=1'b0;
					sdin<=1'b0;
					isDone<=1'b0; 
					i<=5'd0;
				end
else if(en)		begin
						case(i)
						5'd0:
							begin 
								cs_n<=1'b0; 
								sclk<=1'b0; 
								tmpTxByte<=txByte;
								i<=i+1'b1; 
								
							end
						5'd1,5'd3,5'd5,5'd7,5'd9,5'd11,5'd13,5'd15:
								begin 
									sclk<=1'b0;
									sdin<=tmpTxByte[7]; //attention here: 7-1+1=7.
									tmpTxByte<=(tmpTxByte<<1);
									i<=i+1'b1; 
								end
						5'd2,5'd4,5'd6,5'd8,5'd10,5'd12,5'd14,5'd16:
								begin
									sclk<=1'b1; //generate raising edge to force OLED to lock data in.
									i<=i+1'b1;
								end
						5'd17: begin 
								cs_n<=1'b1; 
								sclk<=1'b0; 
								isDone<=1'b1; 
								i<=i+1'b1; 
								end
						5'd18: begin
								isDone<=1'b0; 
								i<='d0; 
								end
						endcase
				end
else	begin
			i<=5'd0;
			cs_n<=1'b1;
			sclk<=1'b0;
			sdin<=1'b0;
		end
endmodule
