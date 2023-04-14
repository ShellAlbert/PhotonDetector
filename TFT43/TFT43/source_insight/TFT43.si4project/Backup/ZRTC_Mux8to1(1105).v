`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:00 04/04/2023 
// Design Name: 
// Module Name:    ZRTC_Mux8to1 
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
module ZRTC_Mux8to1(
    input [3:0] select,
    input [3:0] hour_10,
    input [3:0] hour_1,
    input [3:0] minute_10,
    input [3:0] minute_1,
    input [3:0] second_10,
    input [3:0] second_1,
    output reg [10:0] dout
    );
always@(*)
begin
	case(select)
		4'd0: 
			case(hour_10)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
		4'd1:
			case(hour_1)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
		4'd2:
			dout<='d1384; //:
		4'd3:
			case(minute_10)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
		4'd4:
			case(minute_1)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
		4'd5:
			dout<='d1384; //:
		4'd6:
			case(second_10)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
		4'd7:
			case(second_1)
				4'd0: dout<='d1024; //0 start from 1024 offset.
				4'd1: dout<='d1060; //1, 1024+36=1060.
				4'd2: dout<='d1096; //2
				4'd3: dout<='d1132; //3
				4'd4: dout<='d1168; //4
				4'd5: dout<='d1204; //5
				4'd6: dout<='d1240; //6
				4'd7: dout<='d1276; //7
				4'd8: dout<='d1312; //8
				4'd9: dout<='d1348; //9
				4'd10: dout<='d1384; //: 
				default: dout<='d1024;
			endcase
	endcase
end

endmodule
