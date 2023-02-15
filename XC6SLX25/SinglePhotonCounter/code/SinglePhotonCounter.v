`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:28 02/15/2023 
// Design Name: 
// Module Name:    SinglePhotonCounter 
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
`include "Code\Zsy_OLEDCmdList.v"
//H4,50MHz input.
//H3,LED output.
//RES#(reset),T6.
//D0(SCLK),T8.
//D1(SDIN),T7.
//DC(data command),T5.
//CS,P5.
module SinglePhotonCounter(
   input clk, //the main clock 50MHz, 
	input signal_pulse, //external pulse input signal,R1.
   output cs_n, //OLED-SPI-CS. 
	output sclk, //OLED-SPI-D0.
	output dc, //OLED-SPI-DC. 
	output sdin,//OLED-SPI-D1.
	output oled_rst, //OLED-SPI-RES#.
	output led, //led.
	output test_pulse //test pulse to simulate the real SAPD output.
    );
//////////////////////////////////////////////////////////////
//generate reset signal.
wire rst_n;
reg [31:0] cnt_rst_n;
always @ (posedge clk)
if(cnt_rst_n>=32'hfffffff0)
	cnt_rst_n<=cnt_rst_n;
else
	cnt_rst_n<=cnt_rst_n+1'b1;
assign rst_n=(cnt_rst_n>=32'hffff)?1'b1:1'b0;

//IP cores are not available in ModelSim.
//50MHz/12MHz/2=2.
wire clk_12MHz;
reg [1:0] cnt_12MHz;
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	cnt_12MHz<=2'd0;
else
begin
	if(cnt_12MHz==2'd2-1)
		cnt_12MHz<=2'd0;
	else
		cnt_12MHz<=cnt_12MHz+1'b1;
end
assign clk_12MHz=(cnt_12MHz==2'd2-1)?1'b1:1'b0;

/////////////////////////////////////////////////////////////
//Zsy_OLEDModule will be driven by Step i.
reg oled_en;
reg [3:0] cmd;
reg [7:0] x /* synthesis syn_keep = 1 */;
reg [2:0] y /* synthesis syn_keep = 1 */;
reg [3:0] char_addr /* synthesis syn_keep = 1 */;
wire oled_done;
Zsy_OLEDModule u1_Zsy_OLEDModule(
	.clk(clk_12MHz),//input, 12MHz.
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
    .clk(clk), //50MHz Input.
    .rst_n(rst_n),
    .en(1'b1), //always enable.
    .pulse(signal_pulse),//external input signal pulse.
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
//12MHz/1Hz/2=6,000,000
reg [23:0] cnt_1hz;
wire sig_1hz /* synthesis syn_keep = 1 */;
always @(posedge clk_12MHz or negedge rst_n)
if(!rst_n)
	cnt_1hz<=24'd0;
else if(cnt_1hz==24'd6000000-1)
		cnt_1hz<=24'd0;
	else
		cnt_1hz<=cnt_1hz+1'b1;
assign sig_1hz=(cnt_1hz==24'd6000000-1)?1'b1:1'b0;

//driven by step i.
reg [4:0] i;
always @(posedge clk_12MHz or negedge rst_n)
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
									char_addr<=4'd1;/*"光",0*/
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
									char_addr<=4'd2;/*"子",0*/
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
									char_addr<=4'd3;/*"计",0*/
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
									char_addr<=4'd4;/*"数",0*/
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
									char_addr<=4'd5;/*"器",0*/
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
				5'd16:
					i<=5'd8;
				default:
					i<=i;
			endcase
		end
////////////////////////////////////////////////////////////
//sys clk led indicator.
//50MHz/1Hz=50,000,000
reg [27:0] cnt;
always @ (posedge clk)
if(cnt>=28'd50_000_000)
	cnt<=28'd0;
else
	cnt<=cnt+1'b1;
assign led=(cnt>=28'd15_000_000)?1'b1:1'b0;
/////////////////////////////////////////////////////////////
//generate test pulse to work as the real SAPD output signal.
//12MHz/1Hz/2=12,000,000
reg [23:0] cnt_test_pulse;
always @(posedge clk_12MHz or negedge rst_n)
if(!rst_n)
	cnt_test_pulse<=24'd0;
else if(cnt_test_pulse>=24'd12_000_000)
			cnt_test_pulse<=24'd0;
		else
			cnt_test_pulse<=cnt_test_pulse+1'b1;
assign test_pulse=(cnt_test_pulse<=24'd6_000_000)?1'b1:1'b0;
endmodule
