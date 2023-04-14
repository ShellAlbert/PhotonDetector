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
    //External Photon Pulse.
    input photon_pulse,
    //50Hz sync.
    input sync_50Hz,

	//FIFO glue logic.(for Writing)
	input fifo_is_full,
	output reg wr_fifo,
    output [31:0] reg dout
    );


//Edge Detect.
wire pulse_rising_edge;
wire pulse_falling_edge;
ZEdgeDetect ic_EdgeDetect(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .sig_in(photon_pulse), //External Photon Pulse Signal Input.
    .rising_edge(pulse_rising_edge),
    .falling_edge(pulse_falling_edge)
    );

//Pulse Counter.
wire [31:0] buffer_PulseCounter;
wire overflow;
wire data_update;
ZPulseCounter ic_PulseCounter(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .pulse(pulse_rising_edge),
    .q0(buffer_PulseCounter[3:0]),
    .q1(buffer_PulseCounter[7:4]),
    .q2(buffer_PulseCounter[11:8]),
    .q3(buffer_PulseCounter[15:12]),
    .q4(buffer_PulseCounter[19:16]),
    .q5(buffer_PulseCounter[23:20]),
    .q6(buffer_PulseCounter[27:24]),
    .q7(buffer_PulseCounter[31:28]),
    .overflow(overflow),
   	.data_update(data_update)
    );

//Glue Logic driven by step i.
reg [2:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			wr_fifo<=1'b0;
			dout<=32'd0;
		end
else begin
		case(i)
			0:
				if(data_update) begin
								dout<=buffer_PulseCounter;
								i<=i+1'b1;
							 end
			1:
				if(!fifo_is_full) begin
								wr_fifo<=1'b1;
								i<=i+1'b1;
							 end
			2:
				begin
					wr_fifo<=1'b0;
					i<=0;
				end
		endcase
	end
endmodule
