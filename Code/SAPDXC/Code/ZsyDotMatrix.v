`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:09 10/29/2022 
// Design Name: 
// Module Name:    ZsyDotMatrix 
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
module ZsyDotMatrix(
    input clk,
    input rst_n,
    input [3:0] addr,
    output [127:0] data_top,
	output [127:0] data_btm
    );

reg [127:0] rdata_top;
reg [127:0] rdata_btm;
always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				rdata_top<=128'd0;
				rdata_btm<=128'd0;
			end
else case(addr)
		4'd0:begin
//{00_00_00_00_F0_16_5C_F0_58_D6_D2_30_10_00_00_00},
//{00_04_04_04_04_05_05_7F_05_04_02_02_02_02_00_00},/*"单",0*/
/* (16 X 16 , 楷体 )*/
			rdata_top<=128'h00_00_00_00_F0_16_5C_F0_58_D6_D2_30_10_00_00_00;
			rdata_btm<=128'h00_04_04_04_04_05_05_7F_05_04_02_02_02_02_00_00;
			end
		4'd1:begin
//{00_00_00_00_00_20_00_FC_84_A0_90_98_80_00_00_00},
//{00_40_40_21_19_0D_03_00_1F_60_40_40_40_60_38_00},/*"光",0*/
/* (16 X 16 , 楷体 )*/
			rdata_top<=128'h00_00_00_00_00_20_00_FC_84_A0_90_98_80_00_00_00;
			rdata_btm<=128'h00_40_40_21_19_0D_03_00_1F_60_40_40_40_60_38_00;
			end
		4'd2:begin
//{00_00_00_00_88_88_88_A8_E4_94_8C_40_40_40_00_00},
//{00_00_01_01_00_20_40_40_3F_00_00_00_00_00_00_00},/*"子",0*/
/* (16 X 16 , 楷体 )*/
			rdata_top<=128'h00_00_00_00_88_88_88_A8_E4_94_8C_40_40_40_00_00;
			rdata_btm<=128'h00_00_01_01_00_20_40_40_3F_00_00_00_00_00_00_00;
			end
		default:begin
					rdata_top<=128'd0;
					rdata_btm<=128'd0;
				end
	 endcase

assign data_top=rdata_top;
assign data_btm=rdata_btm;
endmodule
