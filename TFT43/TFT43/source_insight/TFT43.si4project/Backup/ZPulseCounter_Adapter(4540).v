`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:41 04/06/2023 
// Design Name: 
// Module Name:    ZPulseCounter_Adapter 
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
module ZPulseCounter_Adapter(
    input clk,
    input rst_n,
    input en,
    input photon_pulse,

    input fifo_rd,
    output fifo_empty,
    output [31:0] fifo_data
    );

//Pulse Counter.
wire [31:0] q0_q7;
wire overflow;
wire data_update;
ZPulseCounter ic_PulseCounter(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .pulse(photon_pulse),
    .q0(q0_q7[3:0]),
    .q1(q0_q7[7:4]),
    .q2(q0_q7[11:8]),
    .q3(q0_q7[15:12]),
    .q4(q0_q7[19:16]),
    .q5(q0_q7[23:20]),
    .q6(q0_q7[27:24]),
    .q7(q0_q7[31:28]),
    .overflow(overflow)，
   	.data_update(data_update)
    );

//FIFO: 32 bits *1024 depth.
reg wr_fifo;
wire full_fifo;
ZPulseCounter_FIFO ic_PulseCounter_FIFO (
  .clk(clk), // input clk
  .rst(rst_n), // input rst
  .din(q0_q7), // input [31 : 0] din
  .wr_en(wr_fifo), // input wr_en
  .rd_en(fifo_rd), // input rd_en
  .dout(fifo_data), // output [31 : 0] dout
  .full(full_fifo), // output full
  .empty(fifo_empty) // output empty
);

//Self Aux Logic.
reg [2:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			wr_fifo<=1'b0;
		end
else if(en) begin
			case(i)
				0: 
					if(data_update && !full_fifo) begin
												wr_fifo<=1'b1;
												i<=i+1'b1;
											end
				1:	
					begin wr_fifo<=1'b0; i<=0; end
			endcase
		end
endmodule
