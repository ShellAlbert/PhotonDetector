////////////////////////////////////
//RGB.
`define Color_Red 16'hF800
`define Color_Green 16'h7FE0
`define Color_Blue 16'h001F
////////////////////////////////////
`define Color_Black 16'h0000
`define Color_Gray 16'h8410
`define Color_Yellow 16'hFFE0
`define Color_Pink 16'hF8B2
`define Color_Orange 16'hFA20
`define Color_White 16'hFFFF
/////////////////////////////////////
//Full Screen Background Color.
`define Screen_Color_Background 16'h000F
`define Color_BlackGreen 16'h2409
//SIN Wave Background Color.
`define SIN_Color_Background 16'h0001
//Histogram Background Color.
`define BAR_Color_Background 16'h0001


//Cursor Index Definition.
//How many SIN periods we draw on LCD.
`define ZCURSOR_INDEX_PERIOD1	0 //Period1.
`define ZCURSOR_INDEX_PERIOD2 	1 //Period2.
`define ZCURSOR_INDEX_PERIOD3 	2 //Period3.
`define ZCURSOR_INDEX_PERIOD4 	3 //Period4.
`define ZCURSOR_INDEX_PERIOD5 	4 //Period5.

//Gain divider selection.
`define ZCURSOR_INDEX_DIV0 		5 //Reserve for DIV symbol.
`define ZCURSOR_INDEX_DIV1 		6 //Right shift 0bit.
`define ZCURSOR_INDEX_DIV2 		7 //Right shift 1bit.
`define ZCURSOR_INDEX_DIV4 		8 //Right shift 2bit.
`define ZCURSOR_INDEX_DIV8 		9 //Right shift 3bit.

//Time Interval Selection.
`define ZCURSOR_INDEX_TIME		10
`define ZCURSOR_INDEX_TIME1		11
`define ZCURSOR_INDEX_TIME2		12
`define ZCURSOR_INDEX_TIME3		13
`define ZCURSOR_INDEX_TIME4		14