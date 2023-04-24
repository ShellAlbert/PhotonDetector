`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:05 04/20/2023 
// Design Name: 
// Module Name:    ZSDRAM_RW_Multiplex 
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
module ZSDRAM_RW_Multiplex(
    input clk,
    input rst_n,
    input en,

    //SDRAM Read Glue Logic.
    output reg oRd_Req,
    output reg [23:0] oRd_Addr,
    input iRd_Done,
    input [15:0] iRd_Data,

    //Read Port-1.
    input iRd_Req1,
    input [23:0] iRd_Addr1,
    output reg oRd_Done1,
    output reg [15:0] oRd_Data1,
    
    //Read Port-2.
    input iRd_Req2,
    input [23:0] iRd_Addr2,
    output reg oRd_Done2,
    output reg [15:0] oRd_Data2,

    //SDRAM Write Glue Logic.
    output reg oWr_Req,
    output reg [23:0] oWr_Addr,
    output reg [15:0] oWr_Data,
    input iWr_Done,

    //Write Port-1.
    input iWr_Req1,
    input [23:0] iWr_Addr1,
    input [15:0] iWr_Data1,
    output reg oWr_Done1,
    
    //Write Port-2.
    input iWr_Req2,
    input [23:0] iWr_Addr2,
    input [15:0] iWr_Data2,
    output reg oWr_Done2
    );
//driven by step i.
reg [15:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				//SDRAM Read Logic.
				oRd_Req<=0;
				oRd_Addr<=0;
				//
				oRd_Done1<=0;
				oRd_Data1<=0;
				oRd_Done2<=0;
				oRd_Data2<=0;
				
				//SDRAM Write Logic.
				oWr_Req<=0;
				oWr_Addr<=0;
				oWr_Data<=0;
				//
				oWr_Done1<=0;
				oWr_Done2<=0;
			end
else if(en) begin
			case(i)
				0: //Handle Read Port-1.
					if(iRd_Req1) begin i<=i+1'b1; end
					else begin 
							i<=5; //No Read Port-1 Request, go to Read Port-2.
						end
				1:
					if(iRd_Done) begin 
									oRd_Req<=0; 
									oRd_Data1<=iRd_Data;
									i<=i+1'b1; 
								end
					else begin
							oRd_Req<=1;
							oRd_Addr<=iRd_Addr1;
						end
				2:
					begin oRd_Done1<=1'b1; i<=i+1'b1; end
				3:
					begin oRd_Done1<=1'b0; i<=i+1'b1; end
				4:
					begin i<=i+1'b1; end
				5: //Handle Read Port-2.
					if(iRd_Req2) begin i<=i+1'b1; end
					else begin
							i<=10; //No Read Port-2 Request, go to Write Port-1.
						end
				6: 
					if(iRd_Done) begin 
									oRd_Req<=0; 
									oRd_Data2<=iRd_Data;
									i<=i+1'b1; 
								end
					else begin
							oRd_Req<=1;
							oRd_Addr<=iRd_Addr2;
						end
				7:
					begin oRd_Done2<=1'b1; i<=i+1'b1; end
				8:
					begin oRd_Done2<=1'b0; i<=i+1'b1; end
				9:
					begin i<=i+1'b1; end
				10: //Handle Write Port-1.
					if(iWr_Req1) begin i<=i+1'b1; end
					else begin
							i<=15; //No Write Port-1 Request, go to Write Port-2.
						end
				11:
					if(iWr_Done) begin 
									oWr_Req<=0; 
									i<=i+1'b1; 
								end
					else begin
							oWr_Req<=1;
							oWr_Addr<=iWr_Addr1;
							oWr_Data<=iWr_Data1;
						end
				12:
					begin oWr_Done1<=1'b1; i<=i+1'b1; end
				13:
					begin oWr_Done1<=1'b0; i<=i+1'b1; end
				14:
					begin i<=i+1'b1; end
				15: //Handle Write Port-2.
					if(iWr_Req2) begin i<=i+1'b1; end
					else begin
							i<=0; //No Write Port-2 Request, go to Read Port-1.
						end
				16: 
					if(iWr_Done) begin 
									oWr_Req<=0; 
									i<=i+1'b1; 
								end
					else begin
							oWr_Req<=1;
							oWr_Addr<=iWr_Addr2;
							oWr_Data<=iWr_Data2;
						end
				17:
					begin oWr_Done2<=1'b1; i<=i+1'b1; end
				18:
					begin oWr_Done2<=1'b0; i<=i+1'b1; end
				19:
					begin i<=0; end
			endcase
		 end
endmodule
