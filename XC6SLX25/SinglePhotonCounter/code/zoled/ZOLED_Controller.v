`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:23 02/20/2023 
// Design Name: 
// Module Name:    ZOLED_Controller 
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
`include "ZOLED_CmdList.v"
module ZOLED_Controller(
    input clk,
    input rst_n,
    input en,
    input [3:0] char0,
    input [3:0] char1,
    input [3:0] char2,
    input [3:0] char3,
    input [3:0] char4,
    input [3:0] char5,
    input [3:0] char6,
    input [3:0] char7,
    output cs_pin,
    output sclk_pin,
    output dc_pin,
    output sdin_pin,
    output rst_pin
    );


//ZOLED_Module will be driven by Step i.
reg oled_en;
reg [3:0] cmd;
reg [7:0] x /* synthesis syn_keep = 1 */;
reg [2:0] y /* synthesis syn_keep = 1 */;
reg [4:0] char_addr /* synthesis syn_keep = 1 */;
wire oled_done;
ZOLED_Module u1(
	.clk(clk),//input.
	.rst_n(rst_n),//input.
	
	.en(oled_en),//input.
	.cmd(cmd), //input.
	.char_addr(char_addr),//input, char address.
	.x(x),//input,x:0~127.
	.y(y),//input,y:0~63.
	
	.cs_n(cs_pin), //output, SPI-CS.
	.sclk(sclk_pin), //output, SPI-SCLK.
	.dc(dc_pin), //output, Data/Command.
	.sdin(sdin_pin), //output, SPI-MOSI.
	.oled_rst(rst_pin), //output, OLED module reset.
	.done(oled_done) //output, done.
);

//since we use 16x16 dot matrix.
//so 128 / 16 = 8.
//hence we can display 8 chars on single line.
//so the maximum number is 9999,9999. 
//we use 8 [3:0] width registers to count input pulse.
wire [3:0] rchar_addr0;
wire [3:0] rchar_addr1;
wire [3:0] rchar_addr2;
wire [3:0] rchar_addr3;
wire [3:0] rchar_addr4;
wire [3:0] rchar_addr5;
wire [3:0] rchar_addr6;
wire [3:0] rchar_addr7;
Zsy_GetDotMatrixAddr inst0_Zsy_GetDotMatrixAddr(.q(char0),.addr(rchar_addr0));
Zsy_GetDotMatrixAddr inst1_Zsy_GetDotMatrixAddr(.q(char1),.addr(rchar_addr1));
Zsy_GetDotMatrixAddr inst2_Zsy_GetDotMatrixAddr(.q(char2),.addr(rchar_addr2));
Zsy_GetDotMatrixAddr inst3_Zsy_GetDotMatrixAddr(.q(char3),.addr(rchar_addr3));
Zsy_GetDotMatrixAddr inst4_Zsy_GetDotMatrixAddr(.q(char4),.addr(rchar_addr4));
Zsy_GetDotMatrixAddr inst5_Zsy_GetDotMatrixAddr(.q(char5),.addr(rchar_addr5));
Zsy_GetDotMatrixAddr inst6_Zsy_GetDotMatrixAddr(.q(char6),.addr(rchar_addr6));
Zsy_GetDotMatrixAddr inst7_Zsy_GetDotMatrixAddr(.q(char7),.addr(rchar_addr7));

//driven by step i.
reg [4:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=5'd0;
				oled_en<=1'b0;
				char_addr<=4'd0;
				x<=8'd0;
				y<=3'd0;
				cmd<=4'd0;
			end
else	begin
			case(i)
				5'd0:begin //Initial OLED registers.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									cmd<=`CMD_INIT_REGS;
									oled_en<=1'b1;
								end
					end
				5'd1:begin //Clear entire GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									cmd<=`CMD_CLS_GRAM;
									oled_en<=1'b1;
								end
					end
				5'd2:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd0;/*"单"*/
									x<=8'd16;
									y<=3'd0;
								end
					end
				5'd3:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd1;/*"光"*/
									x<=8'd32;
									y<=3'd0;
								end
					end
				5'd4:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd2;/*"子"*/
									x<=8'd48;
									y<=3'd0;
								end
					end
				5'd5:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd3;/*"计"*/
									x<=8'd64;
									y<=3'd0;
								end
						end
				5'd6:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd4;/*"数"*/
									x<=8'd80;
									y<=3'd0;
								end
					end
				5'd7:begin //write GRAM.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
											
											//set (x,y) before enterting next step.
											x<=8'd0;
											y<=3'd2;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd5;/*"器"*/
									x<=8'd96;
									y<=3'd0;
								end
					end
				5'd8:begin //display the 7rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd0;
									y<=3'd2;
									char_addr<=rchar_addr7;
								end
					end
				5'd9:begin //display the 6rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd16;
									y<=3'd2;
									char_addr<=rchar_addr6;
								end
					end
				5'd10:begin //display the 5rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd32;
									y<=3'd2;
									char_addr<=rchar_addr5;
								end
					end
				5'd11:begin //display the 4rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd48;
									y<=3'd2;
									char_addr<=rchar_addr4;
								end
					end		
				5'd12:begin //display the 3rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd64;
									y<=3'd2;
									char_addr<=rchar_addr3;
								end
					end
				5'd13:begin //display the 2rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd80;
									y<=3'd2;
									char_addr<=rchar_addr2;
								end
					end
				5'd14:begin //display the 1rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd96;
									y<=3'd2;
									char_addr<=rchar_addr1;
								end
					end
				5'd15:begin //display the 0rd number.
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									x<=8'd112;
									y<=3'd2;
									char_addr<=rchar_addr0;
								end
					end
				5'd16:begin
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd16;/*"清"*/
									x<=8'd0;
									y<=3'd6;
								end
						end
				5'd17:begin
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd17;/*"零"*/
									x<=8'd16;
									y<=3'd6;
								end
						end
				5'd18:begin
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd18;/*"状"*/
									x<=8'd96;
									y<=3'd6;
								end
						end
				5'd19:begin
						if(oled_done)	begin
											oled_en<=1'b0;
											i<=i+1'b1;
										end
						else	begin
									oled_en<=1'b1;
									cmd<=`CMD_WR_GRAM;
									char_addr<=5'd19;/*"态"*/
									x<=8'd112;
									y<=3'd6;
								end
						end
				5'd20:
					i<=5'd8;
				default:
					i<=i;
			endcase
		end
endmodule
