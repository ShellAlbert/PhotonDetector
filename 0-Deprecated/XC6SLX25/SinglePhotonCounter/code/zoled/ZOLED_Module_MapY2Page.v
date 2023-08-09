`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:26 03/20/2023 
// Design Name: 
// Module Name:    ZOLED_Module_MapY2Page 
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
module ZOLED_Module_MapY2Page(
    input [7:0] iY,
    output reg [2:0] oPage,
    output reg [7:0] oBitMask
    );
always @(*)
begin
	if(iY>=8'd56 && iY<=8'd63)	begin
								oPage=3'd0;
								case(iY-8'd56)
									0: oBitMask=8'h80;
									1: oBitMask=8'h40;
									2: oBitMask=8'h20;
									3: oBitMask=8'h10;
									4: oBitMask=8'h08;
									5: oBitMask=8'h04;
									6: oBitMask=8'h02;
									7: oBitMask=8'h01;
								endcase
							end
	else if(iY>=8'd48 && iY<=8'd55)	begin
									oPage=3'd1;
									case(iY-8'd48)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd40 && iY<=8'd47)	begin
									oPage=3'd2;
									case(iY-8'd40)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd32 && iY<=8'd39)	begin
									oPage=3'd3;
									case(iY-8'd32)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd24 && iY<=8'd31)	begin
									oPage=3'd4;
									case(iY-8'd24)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd16 && iY<=8'd23)	begin
									oPage=3'd5;
									case(iY-8'd16)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd8 && iY<=8'd15)	begin
									oPage=3'd6;
									case(iY-8'd8)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
								end
	else if(iY>=8'd0 && iY<=8'd7)	begin
								oPage=3'd7;
									case(iY-8'd0)
										0: oBitMask=8'h80;
										1: oBitMask=8'h40;
										2: oBitMask=8'h20;
										3: oBitMask=8'h10;
										4: oBitMask=8'h08;
										5: oBitMask=8'h04;
										6: oBitMask=8'h02;
										7: oBitMask=8'h01;
									endcase
							end
	else	begin
				oPage=3'd0;;
				oBitMask=8'h00;
			end
end

endmodule
