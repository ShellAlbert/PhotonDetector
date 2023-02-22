`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:26 02/22/2023 
// Design Name: 
// Module Name:    ZKey_Module_Edge_Detector 
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
module ZKey_Module_Edge_Detector(
    input clk,
    input rst_n,
    input en,
    input key_pin,
    output h2l_edge,
    output l2h_edge
    );

//lockin 2 steps, delay 2 clock period.
reg key_pin_f1;
reg key_pin_f2;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin //the default level of Key is 1.
				key_pin_f1<=1'b1; 
				key_pin_f2<=1'b1;
			end
else if(en)	begin
				key_pin_f1<=key_pin;
				key_pin_f2<=key_pin_f1;
			end
	else	begin
				key_pin_f1<=1'b1; 
				key_pin_f2<=1'b1;
			end
//high to low, falling edge detect.
//           _______________
//key_pin                   |____________________
//           ___________________
//key_pin_f1                    |_____________________
//            ______________________
//key_pin_f2                        |___________________
assign h2l_edge=(~key_pin_f1 & key_pin_f2);

//low to high, raising edge detect.
//                                  _________________________
//key_pin     _____________________|
//                                      ______________________
//key_pin_f1  _________________________|
//	                                         __________________
//key_pin_f2  ______________________________|
assign l2h_edge=(~key_pin_f2 & key_pin_f1);                                  
endmodule
