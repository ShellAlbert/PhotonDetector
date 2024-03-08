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
module ZUART_Data_Dump(
    input iClk,
    input iRst_N,
    input iEn,

    input iNewDataUpdate,
    input [15:0] iNewData,

	//Time Interval Selection.
    input [7:0] iTime_Interval,

    output oTxd_Pin,
	output oDir_Pin,
    output reg oDone
    );
///////////////////////////////////////////
//DIR:=1(Tx),=0(Rx)
assign oDir_Pin=1'b1;
////////////////////////////////////////////
reg uart_en;
reg [7:0] tx_data;
wire tx_done;
wire [7:0] rx_data;
wire rx_done;

ZUART_Module u1(
    .clk(iClk), //input.
    .rst_n(iRst_N), //input.
    .en(uart_en), //input.

    //tx logic.
    .tx_data(tx_data), //input.
    .tx_done(tx_done), //output.
	.tx_pin(oTxd_Pin), //output.

	//rx logic.
	.rx_pin(rx_pin), //input.
    .rx_data(rx_data), //output.
    .rx_done(rx_done) //output.  
    );

//lock data in at the rising edge of data_update.
reg [15:0] NewDataLocked;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
	NewDataLocked<=0;
end
else begin 
		if(iEn & iNewDataUpdate)
			NewDataLocked<=iNewData; //16'h1986;
end

//----------------------------------------------------------------------
//External 50Hz Sync Signal.
//f=50Hz, t=1/f=20mS
//we split 20mS into 10 pieces, so each piece is 20mS/10=2mS.
//So convert into phase differnece, it's 360 degree/10=36 degree.
//----------------------------------------------------------------------
reg [15:0] phase_diff; 
reg [7:0] current_gap_no;
reg [15:0] locked_pulse_counter;
reg [7:0] check_sum;
reg [7:0] time_interval;
reg [3:0] i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
				i<=0;
				oDone<=1'b0;
				current_gap_no<=1;
				phase_diff<=36;
				check_sum<=0;
				time_interval<=1;
			end
else if(iEn)	begin
				case(i)
//------------------------------- Sync Head: 2 bytes, 0x55, 0xAA -----------------------------
					0: //Sync Head: 55.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end		
						else begin 
								uart_en<=1'b1; 
								tx_data<=8'h55; 
								locked_pulse_counter<=NewDataLocked;
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
								tx_data<=locked_pulse_counter[15:8];
							end
					7: //Accumulated Photons Count: low byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=locked_pulse_counter[7:0];
							end
////////////////////////////////////////////////////////////////////
					8: //Total Gaps No. : high byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=0;
							end
					9: //Total Gaps No. : low byte.
						if(tx_done) begin 
											uart_en<=1'b0; 
											i<=i+1'b1; 
											
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
												default: phase_diff<=36;
											endcase
										end	
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
								case(iTime_Interval)
									6: begin tx_data<=1; time_interval<=1; end //2mS.
									7: begin tx_data<=2; time_interval<=2; end//10mS.
									8: begin tx_data<=3; time_interval<=3; end//100mS.
									9: begin tx_data<=4; time_interval<=4; end//500mS.
									default:  begin tx_data<=1; time_interval<=1; end  
								endcase
							 end
					13:
						begin
							check_sum<=8'h55+8'hAA+ //SyncHead.
								0+10+ //Packet Length.
								phase_diff[15:8]+phase_diff[7:0]+ //AC50Hz Phase Difference.
								locked_pulse_counter[15:8]+locked_pulse_counter[7:0]+ //Accumulated Photons Count.
								0+10+ //Total Gaps No.
								0+current_gap_no+ //Sub Gap No. 
								time_interval; //Time Interval.
							i<=i+1'b1;
						end
					14: //Checksum: 1byte.
						if(tx_done) begin uart_en<=1'b0; i<=i+1'b1; end	
						else begin 
								uart_en<=1'b1; 
								tx_data<=check_sum;
							end
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
					15: 
						begin
							if(current_gap_no>=10)
								current_gap_no<=1;
							else 
								current_gap_no<=current_gap_no+1;
							//generate done signal.
							oDone<=1'b1; 
							i<=i+1; 
						end
					16:
						begin oDone<=1'b0; i<=0; end
				endcase
			end
///////////////////////////////////////////////////////
endmodule
