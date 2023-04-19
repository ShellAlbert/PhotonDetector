`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:10 04/13/2023 
// Design Name: 
// Module Name:    ZSDRAM_RW_Arbit 
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
module ZSDRAM_RW_Arbit(
    input clk,
    input rst_n,
    input en,

	//Read Request.
	input rd_req,
	input [23:0] rd_addr,
	input rd_done,
	
	//Write Request.
	input wr_req,
	input [23:0] wr_addr,
	input wr_done,
	
	//Arbit Output.
	output reg [1:0] rw_req,
	output reg [23:0] rw_addr
    );
reg [3:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				rw_req<=2'b00;
				rw_addr<=24'd0;
			end
else if(en) begin
			case(i)
				0: //read priority first.
					if(rd_req) begin 
								rw_req<=2'b01;
								rw_addr<=rd_addr;
								i<=i+1'b1;
							end
					else
						i<=2; 
				1: //waiting for read done.
					begin
						rw_addr<=rd_addr;
						
						if(rd_done) begin
									rw_req<=2'b00;
									i<=i+1'b1;
								end
					end
				2: //write priority second.
					if(wr_req) begin 
								rw_req<=2'b10;
								rw_addr<=wr_addr;
								i<=i+1'b1;
							end
					else
						i<=4; 	
				3: //waiting for write done.
					begin
						rw_addr<=wr_addr;
						
						if(wr_done) begin
									rw_req<=2'b00;
									i<=i+1'b1;
								end
					end
				4: //loop.
					i<=0;
			endcase
		 end
	else begin
			rw_req<=2'b00;
			rw_addr<=24'd0;
		end
endmodule
