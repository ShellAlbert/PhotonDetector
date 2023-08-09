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
	input iRd_Req,
	input [23:0] iRd_Addr,
	output reg oRd_Done,
	output reg [15:0] oRd_Data,
	
	//Write Request.
	input iWr_Req,
	input [23:0] iWr_Addr,
	input [15:0] iWr_Data,
	output oWr_Done,

	//SDRAM operation busy.
	output reg oBusy,

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
    inout [15:0] S_DQ
    );
/////////////////////////////////////////////////////////
wire [23:0] sdram_rw_addr; //SDRAM RW Address.
wire [1:0] sdram_rw_req; //SDRAM RW Request.

wire [15:0] sdram_in_data; //Data write to SDRAM.
wire [15:0] sdram_out_data; //Data read from SDRAM.

reg [1:0] sdram_rw_req;
wire sdram_wr_done;
wire sdram_rd_done;
ZSDRAM_Module_Base ic_SDRAM(
    .clk(clk), //133MHz,210 degree phase shift.
    .rst_n(rst_n),

    .iAddr(sdram_rw_addr), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData(sdram_in_data), //input data, write to SDRAM.
    .oData(sdram_out_data), //output, read back data from SDRAM.

    .iCall(sdram_rw_req), //input, [1]=1:Write, [0]=1:Read.
    .oDone({sdram_wr_done,sdram_rd_done}), //output,[1]=1:write done, [0]=1:read done.
    
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
reg [3:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				oBusy<=1'b0;
				sdram_rw_req<=2'b00;
			end
else if(en) begin
			case(i)
				0: //read priority first.
					if(iRd_Req) begin
								oBusy<=1'b1;
								i<=i+1'b1;
							end
					else begin 
							i<=4; //no read request, go to check write request.
						end
				1: //do read until done.
					if(sdram_rd_done) begin 
										oRd_Data<=sdram_out_data;
										i<=i+1'b1; 
									end		
					else begin
							sdram_rw_req<=2'b01;
							sdram_rw_addr<=iRd_Addr;
						end
				2: //generate read done signal.
					begin oRd_Done<=1'b1; i<=i+1'b1; end
				3: //generate read done sginal.
					begin 
						oRd_Done<=1'b0; 
						oBusy<=1'b0; 
						i<=i+1'b1; 
					end
				
				4: //write priority second.
					if(iWr_Req) begin oBusy<=1'b1; i<=i+1'b1; end
					else begin 
							i<=0; //no write reqeust, go to check read request.
						end
				5: //do write until done.
					if(sdram_wr_done) begin i<=i+1'b1; end
					else begin
							sdram_rw_req<=2'b10;
							sdram_rw_addr<=iWr_Addr;
							sdram_in_data<=iWr_Data;
						end
				6: //generate write done signal.
					begin oWr_Done<=1'b1; i<=i+1'b1; end
				7: //generate write done signal.
					begin
						oWr_Done<=1'b0;
						oBusy<=1'b0;
						i<=0;
					end
			endcase
		 end
	else begin
			oBusy<=1'b0;
			sdram_rw_req<=2'b00;
		end
endmodule
