`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:52 04/14/2023 
// Design Name: 
// Module Name:    ZDataDump2UART 
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
module ZDataDump2UART(
    input clk,
    input rst_n,
    input en,
    
    input [15:0] data,
    output tx_pin,
    output reg done
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
if(!rst_n) begin
			i<=0;
			done<=1'b0;
		end
else if(en)	begin
				case(i)
					0: //sync head 1.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin 
								uart_en<=1'b1; 
								//tx_data<=8'h19; 
								//tx_data<=8'h03;
								tx_data<=data[15:8];
							end
						
					1: //sync head 2.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								//tx_data<=8'h87; 
								//tx_data<=8'h23;
								tx_data<=data[7:0];
							end
					2: 
						begin done<=1'b1; i<=i+1; end
					3:
						begin done<=1'b0; i<=0; end
				endcase
			end
endmodule
