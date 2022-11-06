`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:50 10/28/2022 
// Design Name: 
// Module Name:    ZsyOledRegsData 
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
module ZsyCfgRegsData(
    input clk,
    input rst_n,
	input [7:0] addr,
    output reg[7:0] data,
    output reg dc_flag
    );

//When the pin is pulled high, the input at D7~D0 is treated as display data. 
//When the pin is pulled low, the input at D7~D0 will be transferred to the command register.
parameter DC_DATA=1'b1;
parameter DC_CMD=1'b0;

always @ (posedge clk or negedge rst_n)
if(!rst_n)	begin
				data<=8'd0;
				dc_flag<=1'd0;
			end
else	case(addr)
			8'd0:begin //--turn off OLED panel.
				data<=8'hAE; dc_flag<=DC_CMD;
				end
			8'd1:begin //--set low column address.
				data<=8'h00; dc_flag<=DC_CMD;
				end
			8'd2:begin //--set high column address.
				data<=8'h10; dc_flag<=DC_CMD;
				end
			8'd3:begin //--set start line address,set Mapping RAM display start line (0x00~0x3F)
				data<=8'h40; dc_flag<=DC_CMD;
				end
			8'd4:begin //--set contrast control register.
				data<=8'h81; dc_flag<=DC_CMD;
				end
			8'd5:begin //--set SEG output current brightness.
				data<=8'hCF; dc_flag<=DC_CMD;
				end
			8'd6:begin //--Set SEG/Column Mapping.
				data<=8'hA1; dc_flag<=DC_CMD;
				end
			8'd7:begin //--Set COM/Row Scan Direction.
				data<=8'hC8; dc_flag<=DC_CMD;
				end
			8'd8:begin //--set normal display.
				data<=8'hA6; dc_flag<=DC_CMD;
				end
			8'd9:begin //--set multiplex ratio(1 to 64).
				data<=8'hA8; dc_flag<=DC_CMD;
				end
			8'd10:begin //--1/64 duty.
				data<=8'h3F; dc_flag<=DC_CMD;
				end
			8'd11:begin //--set display offset	Shift Mapping RAM Counter (0x00~0x3F).
				data<=8'hD3; dc_flag<=DC_CMD;
				end
			8'd12:begin //--not offset.
				data<=8'h00; dc_flag<=DC_CMD;
				end
			8'd13:begin //--set display clock divide ratio/oscillator frequency.
				data<=8'hD5; dc_flag<=DC_CMD;
				end
			8'd14:begin //--set divide ratio, Set Clock as 100 Frames/Sec.
				data<=8'h80; dc_flag<=DC_CMD;
				end
			8'd15:begin //--set pre-charge period.
				data<=8'hD9; dc_flag<=DC_CMD;
				end
			8'd16:begin //--Set Pre-Charge as 15 Clocks & Discharge as 1 Clock.
				data<=8'hF1; dc_flag<=DC_CMD;
				end
			8'd17:begin //--set com pins hardware configuration.
				data<=8'hDA; dc_flag<=DC_CMD;
				end
			8'd18:begin //--.
				data<=8'h12; dc_flag<=DC_CMD;
				end
			8'd19:begin //--set vcomh.
				data<=8'hDB; dc_flag<=DC_CMD;
				end
			8'd20:begin //--Set VCOM Deselect Level.
				data<=8'h40; dc_flag<=DC_CMD;
				end
			8'd21:begin //--Set Page Addressing Mode (0x00/0x01/0x02).
				data<=8'h20; dc_flag<=DC_CMD;
				end
			8'd22:begin //--.
				data<=8'h02; dc_flag<=DC_CMD;
				end
			8'd23:begin //--set Charge Pump enable/disable.
				data<=8'h8D; dc_flag<=DC_CMD;
				end
			8'd24:begin //--set(0x10) disable.
				data<=8'h14; dc_flag<=DC_CMD;
				end
			8'd25:begin //--Disable Entire Display On (0xa4/0xa5).
				data<=8'hA4; dc_flag<=DC_CMD;
				end
			8'd26:begin //--Disable Inverse Display On (0xa6/a7).
				data<=8'hA6; dc_flag<=DC_CMD;
				end
			8'd27:begin //--turn on oled panel.
				data<=8'hAF; dc_flag<=DC_CMD;
				end
			8'd28:begin //--Attention: this last one will not send out, only for the end indicator.
				data<=8'hAF; dc_flag<=DC_CMD;
				end
			default:
				begin
					data<=data; dc_flag<=dc_flag;
				end
		endcase
endmodule
