`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:18 10/27/2022 
// Design Name: 
// Module Name:    SAPDXC 
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
////////////////////////////////////////////////////////////////////////////////
`include "Code\Zsy_OLEDCmdList.v"
//P59,100MHz input.
//RES#(reset, P96)
//D0(SCLK),P102.
//D1(SDIN),P105.
//RES(reset),P96.
//DC(data command),P79.
//CS,P75.
module SAPDXC(
    input clk,
	/*input rst_n,*/
	input pulse, //external pulse input signal.
    output cs_n, //Pin-7,CS. 
	output sclk, //Pin-3,D0.
	output dc, //Pin-6,DC. 
	output sdin,//Pin-4,D1.
	output oled_rst, //Pin-5,RES#.
	output test_pulse //test pulse output.
    );

wire clk_10MHz;
//Digital Clock Management (like PLL)
//100MHz input clock to 10MHz clock.
Zsy_DCM inst_ZsyDCM (
    .CLKIN_IN(clk), 
    .CLKFX_OUT(clk_10MHz), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(rst_n)
    );
/*
//IP cores are not available in ModelSim.
//100MHz/10MHz/2=5.
reg [2:0] cnt_10MHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_10MHz<=3'd0;
else
begin
	if(cnt_10MHz==3'd5-1)
		cnt_10MHz<=3'd0;
	else
		cnt_10MHz<=cnt_10MHz+1'b1;
end
assign clk_10MHz=(cnt_10MHz==3'd5-1)?1'b1:1'b0;
*/

/*
reg [7:0] cnt_rst;
always @ (posedge clk_10MHz or negedge rst_n)
if(!rst_n)
	cnt_rst<=8'd0;
else
begin
	if(cnt_rst==8'd255)
		cnt_rst<=cnt_rst;
	else
		cnt_rst<=cnt_rst+1'b1;
end
assign rst_n=(cnt_rst==8'd254)?1'b0:1'b1;
*/
	
//led inst_led(.clk(clk_10MHz),.rst_n(rst_n),.led(led));

//generate test pulse.
//10MHz/1KHz/2=500
reg [8:0] cnt_1khz;
reg rtest_pulse;
always @ (posedge clk_10MHz or negedge rst_n)
if(!rst_n)	begin
				cnt_1khz<=9'd0;
				rtest_pulse<=1'b0;
			end
else
begin
	if(cnt_1khz==9'd500)	begin
								cnt_1khz<=1'b0;
								rtest_pulse<=~rtest_pulse;
							end
	else
		cnt_1khz<=cnt_1khz+1'b1;
end
assign test_pulse=rtest_pulse;
/*
ZsySPI inst_ZsySPI(
.clk(clk_10MHz),
.rst_n(rst_n),
.cs_n(cs_n),
.sclk(sclk),
.dc(dc),
.sdin(sdin),
.oled_rst(oled_rst));
*/
reg oled_en;
reg [3:0] cmd;
reg [7:0] x /* synthesis syn_keep = 1 */;
reg [2:0] y /* synthesis syn_keep = 1 */;
reg [3:0] char_addr /* synthesis syn_keep = 1 */;
wire oled_done;
Zsy_OLEDModule u1_Zsy_OLEDModule(
	.clk(clk_10MHz),//input, 10MHz.
	.rst_n(rst_n),//input.
	
	.en(oled_en),//input.
	.cmd(cmd),
	.char_addr(char_addr),//input, char address.
	.x(x),//input,x:0~127.
	.y(y),//input,y:0~63.
	
	.cs_n(cs_n), //output, SPI-CS.
	.sclk(sclk), //output, SPI-SCLK.
	.dc(dc), //output, Data/Command.
	.sdin(sdin), //output, SPI-MOSI.
	.oled_rst(oled_rst), //output, reset.
	.done(oled_done) //output, done.
);

//since we use 16x16 dot matrix.
//so 128 / 16 = 8.
//hence we can display 8 chars on single line.
//so the maximum number is 9999,9999. 
//we use 8 [3:0] width registers to count input pulse.
wire [3:0] rq0;
wire [3:0] rq1;
wire [3:0] rq2;
wire [3:0] rq3;
wire [3:0] rq4;
wire [3:0] rq5;
wire [3:0] rq6;
wire [3:0] rq7;
wire rOverflow;
Zsy_PulseCounter inst_Zsy_PulseCounter(
    .clk(clk_10MHz), //change to 100MHz with a configured DCM.
    .rst_n(rst_n),
    .en(1'b1), //always enable.
    .pulse(pulse),//external input pulse signal.
    .q0(rq0),
    .q1(rq1),
    .q2(rq2),
    .q3(rq3),
    .q4(rq4),
    .q5(rq5),
    .q6(rq6),
    .q7(rq7),
    .overflow(rOverflow)
    );
wire [3:0] rchar_addr0;
wire [3:0] rchar_addr1;
wire [3:0] rchar_addr2;
wire [3:0] rchar_addr3;
wire [3:0] rchar_addr4;
wire [3:0] rchar_addr5;
wire [3:0] rchar_addr6;
wire [3:0] rchar_addr7;
Zsy_GetDotMatrixAddr inst0_Zsy_GetDotMatrixAddr(.q(rq0),.addr(rchar_addr0));
Zsy_GetDotMatrixAddr inst1_Zsy_GetDotMatrixAddr(.q(rq1),.addr(rchar_addr1));
Zsy_GetDotMatrixAddr inst2_Zsy_GetDotMatrixAddr(.q(rq2),.addr(rchar_addr2));
Zsy_GetDotMatrixAddr inst3_Zsy_GetDotMatrixAddr(.q(rq3),.addr(rchar_addr3));
Zsy_GetDotMatrixAddr inst4_Zsy_GetDotMatrixAddr(.q(rq4),.addr(rchar_addr4));
Zsy_GetDotMatrixAddr inst5_Zsy_GetDotMatrixAddr(.q(rq5),.addr(rchar_addr5));
Zsy_GetDotMatrixAddr inst6_Zsy_GetDotMatrixAddr(.q(rq6),.addr(rchar_addr6));
Zsy_GetDotMatrixAddr inst7_Zsy_GetDotMatrixAddr(.q(rq7),.addr(rchar_addr7));

//generate 1Hz signal.
//10MHz/1Hz/2=5,000,000
reg [25:0] cnt_1hz;
wire sig_1hz /* synthesis syn_keep = 1 */;
always @(posedge clk_10MHz or negedge rst_n)
if(!rst_n)
	cnt_1hz<=26'd0;
else if(cnt_1hz==26'd5000000-1)
		cnt_1hz<=26'd0;
	else
		cnt_1hz<=cnt_1hz+1'b1;
assign sig_1hz=(cnt_1hz==26'd5000000-1)?1'b1:1'b0;

//driven by step i.
reg [4:0] i;
always @(posedge clk_10MHz or negedge rst_n)
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
									char_addr<=4'd0;/*"单",0*/
									x<=8'd0;
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
									char_addr<=4'd1;/*"光",0*/
									x<=8'd16;
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
									char_addr<=4'd2;/*"子",0*/
									x<=8'd32;
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
									char_addr<=4'd3;/*"计",0*/
									x<=8'd48;
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
									char_addr<=4'd4;/*"数",0*/
									x<=8'd64;
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
									char_addr<=4'd5;/*"器",0*/
									x<=8'd80;
									y<=3'd0;
								end
					end
/*
				4'd8:begin //update every 1Hz.
						if(oled_done)	begin
											oled_en<=1'b0;
											x<=x+8'd8;
										end
						else if(sig_1hz)	begin
												oled_en<=1'b1;
												cmd<=`CMD_WR_GRAM;
												y<=3'd2;
												if(char_addr==4'd15)
													char_addr<=4'd6;  //0~9.
												else
													char_addr<=char_addr+1'b1;
											end
						else if(x>=8'd112)
									i<=i+1'b1;
								else 
									i<=i;
					end
*/
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
				5'd16:
					i<=5'd8;
				default:
					i<=i;
			endcase
		end
endmodule

