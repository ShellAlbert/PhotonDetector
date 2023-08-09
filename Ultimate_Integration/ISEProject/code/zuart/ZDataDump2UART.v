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

	//Time Interval Selection.
    input [7:0] iTime_Interval_Selection,

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


//----------------------------------------------------------------------
//External 50Hz Sync Signal.
//f=50Hz, t=1/f=20mS
//we split 20mS into 10 pieces, so each piece is 20mS/10=2mS.
//So convert into phase differnece, it's 360 degree/10=36 degree.
//----------------------------------------------------------------------
reg [15:0] phase_diff; 
reg [7:0] current_gap_no;

reg [3:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
				i<=0;
				done<=1'b0;
				current_gap_no<=1;
				phase_diff<=36;
			end
else if(en)	begin
				case(i)
//------------------------------- Sync Head: 2 bytes, 0x55, 0xAA -----------------------------
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
//------------------------------- Packet Length: 2 bytes -----------------------------
//Packet Length=
//AC 50Hz Phase Difference(2 Bytes)
//+Accmulated Photons Count(2 Bytes)
//+Total Gaps No.(2 Bytes)
//+Sub Gaps No.(2 Bytes)
//+Timer Interval(1 Byte)
//+Checksum (1 Byte)
//=10 Bytes
					2: //Packet Length, high byte=0.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0; 
							end
					3: //Packet Length: low byte=10.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=10;  //10 bytes in total.
							end
//------------------------------- AC50Hz Phase Difference: 2 bytes -----------------------------
//External 50Hz Sync Signal.
//f=50Hz, t=1/f=20mS
//we split 20mS into 10 pieces, so each piece is 20mS/10=2mS.
//So convert into phase differnece, it's 360 degree/10=36 degree.
//-----------------------------------------------------------------------------------------------
					4: //AC50Hz Phase Difference: high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=phase_diff[15:8];
							end
					5: //AC50Hz Phase Difference: low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=phase_diff[7:0];
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

								//20mS/10=2mS.
								//360 degree/10=36 degree.
								tx_data<=10;
							end
////////////////////////////////////////////////////////////////////
					10: //Sub Gap No. : high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0;
							end
					11: //Sub Gap No. : low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=current_gap_no;
							end
////////////////////////////////////////////////////////////////////
					12: //Time Interval: 1 byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1;
								case(iTime_Interval_Selection)
									6: tx_data<=1; //2mS.
									7: tx_data<=2; //10mS.
									8: tx_data<=3; //100mS.
									9: tx_data<=4; //500mS.
									default: tx_data<=1; 
								endcase
							 end
					13: //Checksum: 1byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'hFF;
							end
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
					14: 
						begin
							if(current_gap_no>=10)
								current_gap_no<=0;
							else 
								current_gap_no<=current_gap_no+1;

							//update phase difference.
							case(current_gap_no)
								1: phase_diff<=36;
								2: phase_diff<=72;
								3: phase_diff<=108;
								4: phase_diff<=144;
								5: phase_diff<=180;
								6: phase_diff<=216;
								7: phase_diff<=252;
								8: phase_diff<=288;
								9: phase_diff<=324;
								10: phase_diff<=360;
							endcase

							//generate done signal.
							done<=1'b1; 
							i<=i+1; 
						end
					15:
						begin done<=1'b0; i<=0; end
				endcase
			end
endmodule
