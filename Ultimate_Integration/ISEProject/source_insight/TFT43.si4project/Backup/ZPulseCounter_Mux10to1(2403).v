`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:10 04/03/2023 
// Design Name: 
// Module Name:    ZMux10to1 
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
module ZPulseCounter_Mux10to1(
	//0: q0
	//1: q1
	//2: q2
	//3: q3
	//4: q4
	//5: q5
	//6: q6
	//7: q7
    input [3:0] select,
    
    input [3:0] q0,
    input [3:0] q1,
    input [3:0] q2,
    input [3:0] q3,
    input [3:0] q4,
    input [3:0] q5,
    input [3:0] q6,
    input [3:0] q7,
    
    output reg [3:0] dout
    );

always @(*)	
begin
	case(select)
		4'd0: //MSB.
			case(q7)
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
			case(q6)
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
			case(q5)
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
		4'd3: 
			case(q4)
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
			case(q3)
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
			case(q2)
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
		4'd6: 
			case(q1)
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
		4'd7: //LSB.
			case(q0)
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
		default: 
			dout<='d1024;
	endcase
end
endmodule
