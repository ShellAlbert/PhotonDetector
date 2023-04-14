`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:09 02/17/2023 
// Design Name: 
// Module Name:    ZUART_Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: the controller of ZUART_Module
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ZUART_Controller(
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
    output tx_pin
    );

reg uart_en;
reg [7:0] tx_data;
wire tx_done;
wire [7:0] rx_data;
wire rx_done;

ZUART_Module u1(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(uart_en), //input.

    //tx logic.
    .tx_data(tx_data), //input.
    .tx_done(tx_done), //output.
	.tx_pin(tx_pin), //output.

	//rx logic.
	.rx_pin(rx_pin), //input.
    .rx_data(rx_data), //output.
    .rx_done(rx_done) //output.  
    );
//55 AA 01 02 03 04 05 06 07 08 XX (Checksum)
reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)
	i<=0;
else if(en)	begin
				case(i)
					0: //sync head 1.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin uart_en<=1'b1; tx_data<=8'h55; end
						
					1: //sync head 2.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin uart_en<=1'b1; tx_data<=8'hAA; end
		
					2: //7th, 6th number.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
	 					else begin 
	 							uart_en<=1'b1; 
	 							tx_data<={char7,char6}; 
	 						end
 								
					3: //5th, 4th number.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin
								uart_en<=1'b1;
								tx_data<={char5,char4};
							end
							
					4: //3th, 2th number.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin
								uart_en<=1'b1;
								tx_data<={char3,char2};
							end
					5: //1th, 0th number.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin
								uart_en<=1'b1;
								tx_data<={char1,char0};
							end
					6: //CRC8 number.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin
									uart_en<=1'b1;
									tx_data<=8'hFF;
							end
					7:
						if(cnt_1Hz==25'd40_000_000)
							i<=0;
				endcase
			end
//1Hz Tick to flush data out every 1s.
//80MHz/1Hz/2=40,000,000
reg [24:0] cnt_1Hz;
always@(posedge clk or negedge rst_n)
if(!rst_n)
	cnt_1Hz<=25'd0;
else if(cnt_1Hz==25'd40_000_000)
			cnt_1Hz<=25'd0;
		else
			cnt_1Hz<=cnt_1Hz+1'b1;
endmodule
