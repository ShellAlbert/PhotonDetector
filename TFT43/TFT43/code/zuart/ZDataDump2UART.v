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

    input data_update,
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

//lock data in.
reg [15:0] new_pulse_counter;
always @(posedge clk or negedge rst_n)
if(!rst_n) 
	new_pulse_counter<=0;
else if(en&data_update)
		new_pulse_counter<=data;

//Sync Head: 2 bytes, 55 AA.
//Packet Length: 2 bytes.
//AC50Hz Phase Difference: 2 bytes.
//Accumulated Photons Count: 2 bytes.
//Total Gaps No. : 2 bytes.
//Sub Gap No. : 2 bytes.
//Time Interval: 1 byte.
//Checksum: 1 byte.
reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			done<=1'b0;
		end
else if(en)	begin
				case(i)
					0: //Sync Head: 55.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h55; 
							end
						
					1: //Sync Head: AA.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'hAA; 
							end
////////////////////////////////////////////////////////////////////
					2: //Packet Length, high 8 bits.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0;
							end
					3: //Packet Length: low 8 bits.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=10;
							end
////////////////////////////////////////////////////////////////////
					4: //AC50Hz Phase Difference: high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0;
							end
					5: //AC50Hz Phase Difference: low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=15;
							end
////////////////////////////////////////////////////////////////////
					6: //Accumulated Photons Count: high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=new_pulse_counter[15:8];
							end
					7: //Accumulated Photons Count: low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=new_pulse_counter[7:0];
							end
////////////////////////////////////////////////////////////////////
					8: //Total Gaps No. : high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0;
							end
					9: //Total Gaps No. : low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=1;
							end
////////////////////////////////////////////////////////////////////
					10: //Sub Gap No. : high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h41;
							end
					11: //Sub Gap No. : low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h42;
							end
////////////////////////////////////////////////////////////////////
					12: //Time Interval: 1 byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h43;
							end
					13: //Checksum: 1byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h44;
							end
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
					14: 
						begin done<=1'b1; i<=i+1; end
					15:
						begin done<=1'b0; i<=0; end
				endcase
			end
endmodule
