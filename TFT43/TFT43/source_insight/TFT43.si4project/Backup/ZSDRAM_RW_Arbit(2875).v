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
//Only connect ZPage_ExtSyncLost SDRAM RW to SDRAM when ExtSyncLost occurd.
//Otherwise connect ZDrawAdapter and ZShift_and_Draw to SDRAM.
module ZSDRAM_RW_Arbit(
    input clk,
    input rst_n,
    input en,

	//Global Flag.
	input iFlag_ExtSyncLost,
	//to reset Page Main.
	output reg oRstPageMain,
	//to reset Page ExtSyncLost.
	output reg oRstPageExtSyncLost,

    //Read Port-1. (ZTFT43_Adapter SDRAM Read.)
    input iRd_Req1,
    input [23:0] iRd_Addr1,
    output reg oRd_Done1,
    output reg [15:0] oRd_Data11,
    output reg [15:0] oRd_Data12,
    output reg [15:0] oRd_Data13,
    output reg [15:0] oRd_Data14,
    
    //Read Port-2. (ZShift_and_Draw, Read.)
    input iRd_Req2,
    input [23:0] iRd_Addr2,
    output reg oRd_Done2,
    output reg [15:0] oRd_Data21,
    output reg [15:0] oRd_Data22,
    output reg [15:0] oRd_Data23,
    output reg [15:0] oRd_Data24,
	
    //Write Port-1.  (ZDraw_Adapter, Write.)
    input iWr_Req1,
    input [23:0] iWr_Addr1,
    input [15:0] iWr_Data11,
    input [15:0] iWr_Data12,
    input [15:0] iWr_Data13,
    input [15:0] iWr_Data14,
    output reg oWr_Done1,
    
    //Write Port-2. (ZShift_and_Draw, Write.)
    input iWr_Req2,
    input [23:0] iWr_Addr2,
    input [15:0] iWr_Data21,
    input [15:0] iWr_Data22,
    input [15:0] iWr_Data23,
    input [15:0] iWr_Data24,
    output reg oWr_Done2,

    //Write Port-3. (ZPage_ExtSyncLost, Write.)
    input iWr_Req_ExtSyncLost,
    input [23:0] iWr_Addr_ExtSyncLost,
    input [15:0] iWr_Data1_ExtSyncLost,
    input [15:0] iWr_Data2_ExtSyncLost,
    input [15:0] iWr_Data3_ExtSyncLost,
    input [15:0] iWr_Data4_ExtSyncLost,
    output reg oWr_Done_ExtSyncLost,

	//PowerOnSelfTest Done Signal.
	input iPOSTDone,
    //Write Port. (ZPage_PowerOnSelfTest, Write.)
    input iWr_Req_POST,
    input [23:0] iWr_Addr_POST,
    input [15:0] iWr_Data1_POST,
    input [15:0] iWr_Data2_POST,
    input [15:0] iWr_Data3_POST,
    input [15:0] iWr_Data4_POST,
    output reg oWr_Done_POST,
    //Read Port. (ZPage_PowerOnSelfTest, Read.)
    input iRd_Req_POST,
    input [23:0] iRd_Addr_POST,
    output reg oRd_Done_POST,
    output reg [15:0] oRd_Data1_POST,
    output reg [15:0] oRd_Data2_POST,
    output reg [15:0] oRd_Data3_POST,
    output reg [15:0] oRd_Data4_POST,
    
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
reg [23:0] sdram_rw_addr; //SDRAM RW Address.
reg [1:0] sdram_rw_req; //SDRAM RW Request.

reg [15:0] sdram_in_data1; //Data1 write to SDRAM.
reg [15:0] sdram_in_data2; //Data2 write to SDRAM.
reg [15:0] sdram_in_data3; //Data3 write to SDRAM.
reg [15:0] sdram_in_data4; //Data4 write to SDRAM.
wire [15:0] sdram_out_data1; //Data1 read from SDRAM.
wire [15:0] sdram_out_data2; //Data2 read from SDRAM.
wire [15:0] sdram_out_data3; //Data3 read from SDRAM.
wire [15:0] sdram_out_data4; //Data4 read from SDRAM.

wire sdram_wr_done;
wire sdram_rd_done;
ZSDRAM_Module_Base ic_SDRAM(
    .clk(clk), //133MHz,210 degree phase shift.
    .rst_n(rst_n),

	//0: Single Word Read/Write.
	//1: Four Words Read/Write.
	.iMode(1'b1),
	
    .iAddr(sdram_rw_addr), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData1(sdram_in_data1), //input data1, write to SDRAM.
    .iData2(sdram_in_data2), //input data2, write to SDRAM.
    .iData3(sdram_in_data3), //input data3, write to SDRAM.
    .iData4(sdram_in_data4), //input data4, write to SDRAM.
    .oData1(sdram_out_data1), //output, read back data1 from SDRAM.
    .oData2(sdram_out_data2), //output, read back data2 from SDRAM.
    .oData3(sdram_out_data3), //output, read back data3 from SDRAM.
    .oData4(sdram_out_data4), //output, read back data4 from SDRAM.

    .iReq(sdram_rw_req), //input, [1]=1:Write, [0]=1:Read.
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
reg [7:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				sdram_rw_req<=2'b00;

				oRd_Done1<=1'b0;
				oRd_Done2<=1'b0;
				oWr_Done1<=1'b0;
				oWr_Done2<=1'b0;
				oWr_Done_ExtSyncLost<=1'b0;
				oRstPageMain<=1'b0;
				oRstPageExtSyncLost<=1'b0;
			end
else if(en) begin
			case(i)
				0: //ExtSyncLost? 
					if(iFlag_ExtSyncLost) begin
											oRstPageExtSyncLost<=1'b1; //Normal.
											oRstPageMain<=1'b0; //Reset.
											i<=i+1'b1; 
										end
					else begin
							oRstPageExtSyncLost<=1'b0; //Reset.
							oRstPageMain<=1'b1; //Normal.
							i<=9; //Ext AC50Hz Sync Normal.
						end
//////////////////////////////////////////////////////////////////////////////
				1: //Write Port-3. (ZPage_ExtSyncLost, Write.)
					if(iWr_Req_ExtSyncLost) begin i<=i+1'b1; end
					else begin 
							i<=5; //no write request, go to check other request.
						end
				2: //do write until done.
					if(sdram_wr_done) begin 
										sdram_rw_req<=2'b00;
										i<=i+1'b1; 
									end
					else begin
							sdram_rw_req<=2'b10;
							sdram_rw_addr<=iWr_Addr_ExtSyncLost;
							sdram_in_data1<=iWr_Data1_ExtSyncLost;
							sdram_in_data2<=iWr_Data2_ExtSyncLost;
							sdram_in_data3<=iWr_Data3_ExtSyncLost;
							sdram_in_data4<=iWr_Data4_ExtSyncLost;
						end
				3: //generate write done signal.
					begin oWr_Done_ExtSyncLost<=1'b1; i<=i+1'b1; end
				4: //generate write done signal.
					begin oWr_Done_ExtSyncLost<=1'b0; i<=i+1'b1; end
				5: //Read Port-1. (ZTFT43_Adapter SDRAM Read.)
					if(iRd_Req1) begin i<=i+1'b1; end		
					else begin 
							i<=0; //no read request, go to check other request.
						end
				6: //do read until done.
					if(sdram_rd_done) begin 
										sdram_rw_req<=2'b00;
										oRd_Data11<=sdram_out_data1;
										oRd_Data12<=sdram_out_data2;
										oRd_Data13<=sdram_out_data3;
										oRd_Data14<=sdram_out_data4;
										i<=i+1'b1; 
									end		
					else begin
							sdram_rw_req<=2'b01;
							sdram_rw_addr<=iRd_Addr1;
						end
				7: //generate read done signal.
					begin oRd_Done1<=1'b1; i<=i+1'b1; end
				8: //generate read done sginal.
					begin oRd_Done1<=1'b0; i<=0; end
	//////////////////////////////////////////////////////////////////////////////////
				9: //Read Port-1. (ZTFT43_Adapter SDRAM Read.)
					if(iRd_Req1) begin i<=i+1'b1; end		
					else begin 
							i<=13; //no read request, go to check other request.
						end
				10: //do read until done.
					if(sdram_rd_done) begin 
										sdram_rw_req<=2'b00;
										oRd_Data11<=sdram_out_data1;
										oRd_Data12<=sdram_out_data2;
										oRd_Data13<=sdram_out_data3;
										oRd_Data14<=sdram_out_data4;
										i<=i+1'b1; 
									end		
					else begin
							sdram_rw_req<=2'b01;
							sdram_rw_addr<=iRd_Addr1;
						end
				11: //generate read done signal.
					begin oRd_Done1<=1'b1; i<=i+1'b1; end
				12: //generate read done sginal.
					begin oRd_Done1<=1'b0; i<=i+1'b1; end
	//////////////////////////////////////////////////////////////////////////////////
				13: //Read Port-2. (ZShift_and_Draw, Read.)
					if(iRd_Req2) begin i<=i+1'b1; end		
					else begin 
							i<=17; //no read request, go to check other request.
						end
				14: //do read until done.
					if(sdram_rd_done) begin 
										sdram_rw_req<=2'b00;
										oRd_Data21<=sdram_out_data1;
										oRd_Data22<=sdram_out_data2;
										oRd_Data23<=sdram_out_data3;
										oRd_Data24<=sdram_out_data4;
										i<=i+1'b1; 
									end		
					else begin
							sdram_rw_req<=2'b01;
							sdram_rw_addr<=iRd_Addr2;
						end
				15: //generate read done signal.
					begin oRd_Done2<=1'b1; i<=i+1'b1; end
				16: //generate read done sginal.
					begin oRd_Done2<=1'b0; i<=i+1'b1; end
	//////////////////////////////////////////////////////////////////////////////////
				17: //Write Port-1.  (ZDraw_Adapter, Write.)
					if(iWr_Req1) begin i<=i+1'b1; end
					else begin 
							i<=21; //no write reqeust, go to other request.
						end
				18: //do write until done.
					if(sdram_wr_done) begin 
										sdram_rw_req<=2'b00;
										i<=i+1'b1; 
									end
					else begin
							sdram_rw_req<=2'b10;
							sdram_rw_addr<=iWr_Addr1;
							sdram_in_data1<=iWr_Data11;
							sdram_in_data2<=iWr_Data12;
							sdram_in_data3<=iWr_Data13;
							sdram_in_data4<=iWr_Data14;
						end
				19: //generate write done signal.
					begin oWr_Done1<=1'b1; i<=i+1'b1; end
				20: //generate write done signal.
					begin oWr_Done1<=1'b0; i<=i+1'b1; end
	//////////////////////////////////////////////////////////////////////////////////
				21: //Write Port-2. (ZShift_and_Draw, Write.)
					if(iWr_Req2) begin i<=i+1'b1; end
					else begin 
							i<=0; //no write reqeust, go to check other request.
						end
				22: //do write until done.
					if(sdram_wr_done) begin 
										sdram_rw_req<=2'b00;
										i<=i+1'b1; 
									end
					else begin
							sdram_rw_req<=2'b10;
							sdram_rw_addr<=iWr_Addr2;
							sdram_in_data1<=iWr_Data21;
							sdram_in_data2<=iWr_Data22;
							sdram_in_data3<=iWr_Data23;
							sdram_in_data4<=iWr_Data24;
						end
				23: //generate write done signal.
					begin oWr_Done2<=1'b1; i<=i+1'b1; end
				24: //generate write done signal.
					begin oWr_Done2<=1'b0; i<=0; end
			endcase
		 end
	else begin
			i<=0;
		end
endmodule
