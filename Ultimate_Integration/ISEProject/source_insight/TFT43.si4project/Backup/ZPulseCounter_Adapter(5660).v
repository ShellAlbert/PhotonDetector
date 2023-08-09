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

	//Output data every x seconds.
	output data_update,
    output [31:0] dout
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
wire overflow;
ZPulseCounter ic_PulseCounter(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .pulse(pulse_rising_edge),
    .q0(dout[3:0]),
    .q1(dout[7:4]),
    .q2(dout[11:8]),
    .q3(dout[15:12]),
    .q4(dout[19:16]),
    .q5(dout[23:20]),
    .q6(dout[27:24]),
    .q7(dout[31:28]),
    .overflow(overflow),
   	.data_update(data_update)
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
