`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:49 03/20/2023 
// Design Name: 
// Module Name:    ZTFT43_CfgData 
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
module ZTFT43_CfgData(
    input [8:0] iIndex,
    output reg [15:0] oRegAddr,
    output reg [15:0] oRegData
    );
always@(*)
begin
	case(iIndex)
		// Enable manufacturer command set, select page 1
		9'd0 : begin oRegAddr=16'hF000; oRegData=16'h55; end
		9'd1 : begin oRegAddr=16'hF001; oRegData=16'hAA; end
		9'd2 : begin oRegAddr=16'hF002; oRegData=16'h52; end
		9'd3 : begin oRegAddr=16'hF003; oRegData=16'h08; end
		9'd4 : begin oRegAddr=16'hF004; oRegData=16'h01; end

		//
		9'd5 : begin oRegAddr=16'hB000; oRegData=16'h0D; end
		9'd6 : begin oRegAddr=16'hB001; oRegData=16'h0D; end
		9'd7 : begin oRegAddr=16'hB002; oRegData=16'h0D; end
		
		////# AVDD: manual); LCD_WR_DATA(
		9'd8 : begin oRegAddr=16'hB600; oRegData=16'h34; end
		9'd9 : begin oRegAddr=16'hB601; oRegData=16'h34; end
		9'd10 : begin oRegAddr=16'hB602; oRegData=16'h34; end
		
		9'd11 : begin oRegAddr=16'hB100; oRegData=16'h0D; end
		9'd12 : begin oRegAddr=16'hB101; oRegData=16'h0D; end
		9'd13 : begin oRegAddr=16'hB102; oRegData=16'h0D; end

		//# AVEE: manual); LCD_WR_DATA( -6V
		9'd14 : begin oRegAddr=16'hB700; oRegData=16'h34; end
		9'd15 : begin oRegAddr=16'hB701; oRegData=16'h34; end
		9'd16 : begin oRegAddr=16'hB702; oRegData=16'h34; end

		
		9'd17 : begin oRegAddr=16'hB200; oRegData=16'h00; end
		9'd18 : begin oRegAddr=16'hB201; oRegData=16'h00; end
		9'd19 : begin oRegAddr=16'hB202; oRegData=16'h00; end

		//#Power Control for
		//VCL
		9'd20 : begin oRegAddr=16'hB800; oRegData=16'h24; end
		9'd21 : begin oRegAddr=16'hB801; oRegData=16'h24; end
		9'd22 : begin oRegAddr=16'hB802; oRegData=16'h24; end
		
		9'd23 : begin oRegAddr=16'hBF00; oRegData=16'h01; end

		
		9'd24 : begin oRegAddr=16'hB300; oRegData=16'h0F; end
		9'd25 : begin oRegAddr=16'hB301; oRegData=16'h0F; end
		9'd26 : begin oRegAddr=16'hB302; oRegData=16'h0F; end

		//# VGH: Clamp Enable); LCD_WR_DATA(
		9'd27 : begin oRegAddr=16'hB900; oRegData=16'h34; end
		9'd28 : begin oRegAddr=16'hB901; oRegData=16'h34; end
		9'd29 : begin oRegAddr=16'hB902; oRegData=16'h34; end

		//# VGL_REG(VGLO)
		9'd30 : begin oRegAddr=16'hB500; oRegData=16'h50; end
		9'd31 : begin oRegAddr=16'hB501; oRegData=16'h08; end
		9'd32 : begin oRegAddr=16'hB502; oRegData=16'h08; end
		
		9'd33 : begin oRegAddr=16'hC200; oRegData=16'h03; end

		//# VGL(LVGL):
		9'd34 : begin oRegAddr=16'hBA00; oRegData=16'h24; end
		9'd35 : begin oRegAddr=16'hBA01; oRegData=16'h24; end
		9'd36 : begin oRegAddr=16'hBA02; oRegData=16'h24; end

		//# VGMP/VGSP:
		9'd37 : begin oRegAddr=16'hBC00; oRegData=16'h00; end
		9'd38 : begin oRegAddr=16'hBC01; oRegData=16'h78; end
		9'd39 : begin oRegAddr=16'hBC02; oRegData=16'h00; end
		
		//# VGMN/VGSN
		9'd40 : begin oRegAddr=16'hBD00; oRegData=16'h00; end
		9'd41 : begin oRegAddr=16'hBD01; oRegData=16'h78; end
		9'd42 : begin oRegAddr=16'hBD02; oRegData=16'h00; end

		//# VCOM=-0.1
		9'd43 : begin oRegAddr=16'hBE00; oRegData=16'h00; end
		9'd44 : begin oRegAddr=16'hBE01; oRegData=16'h64; end

		// VCOMH+0x01;
  		//#R+
		9'd45 : begin oRegAddr=16'hD100; oRegData=16'h00; end
		9'd46 : begin oRegAddr=16'hD101; oRegData=16'h33; end
		9'd47 : begin oRegAddr=16'hD102; oRegData=16'h00; end
		9'd48 : begin oRegAddr=16'hD103; oRegData=16'h34; end
		9'd49 : begin oRegAddr=16'hD104; oRegData=16'h00; end
		9'd50 : begin oRegAddr=16'hD105; oRegData=16'h3A; end
		9'd51 : begin oRegAddr=16'hD106; oRegData=16'h00; end
		9'd52 : begin oRegAddr=16'hD107; oRegData=16'h4A; end
		9'd53 : begin oRegAddr=16'hD108; oRegData=16'h00; end
		9'd54 : begin oRegAddr=16'hD109; oRegData=16'h5C; end
		9'd55 : begin oRegAddr=16'hD10A; oRegData=16'h00; end
		9'd56 : begin oRegAddr=16'hD10B; oRegData=16'h81; end
		9'd57 : begin oRegAddr=16'hD10C; oRegData=16'h00; end
		9'd58 : begin oRegAddr=16'hD10D; oRegData=16'hA6; end
		9'd59 : begin oRegAddr=16'hD10E; oRegData=16'h00; end
		9'd60 : begin oRegAddr=16'hD10F; oRegData=16'hE5; end
		9'd61 : begin oRegAddr=16'hD110; oRegData=16'h01; end
		9'd62 : begin oRegAddr=16'hD111; oRegData=16'h13; end
		9'd63 : begin oRegAddr=16'hD112; oRegData=16'h01; end
		9'd64 : begin oRegAddr=16'hD113; oRegData=16'h54; end
		9'd65 : begin oRegAddr=16'hD114; oRegData=16'h01; end
		9'd66 : begin oRegAddr=16'hD115; oRegData=16'h82; end
		9'd67 : begin oRegAddr=16'hD116; oRegData=16'h01; end
		9'd68 : begin oRegAddr=16'hD117; oRegData=16'hCA; end
		9'd69 : begin oRegAddr=16'hD118; oRegData=16'h02; end
		9'd70 : begin oRegAddr=16'hD119; oRegData=16'h00; end
		9'd71 : begin oRegAddr=16'hD11A; oRegData=16'h02; end
		9'd72 : begin oRegAddr=16'hD11B; oRegData=16'h01; end
		9'd73 : begin oRegAddr=16'hD11C; oRegData=16'h02; end
		9'd74 : begin oRegAddr=16'hD11D; oRegData=16'h34; end
		9'd75 : begin oRegAddr=16'hD11E; oRegData=16'h02; end
		9'd76 : begin oRegAddr=16'hD11F; oRegData=16'h67; end
		9'd77 : begin oRegAddr=16'hD120; oRegData=16'h02; end
		9'd78 : begin oRegAddr=16'hD121; oRegData=16'h84; end
		9'd79 : begin oRegAddr=16'hD122; oRegData=16'h02; end
		9'd80 : begin oRegAddr=16'hD123; oRegData=16'hA4; end
		9'd81 : begin oRegAddr=16'hD124; oRegData=16'h02; end
		9'd82 : begin oRegAddr=16'hD125; oRegData=16'hB7; end
		9'd83 : begin oRegAddr=16'hD126; oRegData=16'h02; end
		9'd84 : begin oRegAddr=16'hD127; oRegData=16'hCF; end
		9'd85 : begin oRegAddr=16'hD128; oRegData=16'h02; end
		9'd86 : begin oRegAddr=16'hD129; oRegData=16'hDE; end
		9'd87 : begin oRegAddr=16'hD12A; oRegData=16'h02; end
		9'd88 : begin oRegAddr=16'hD12B; oRegData=16'hF2; end
		9'd89 : begin oRegAddr=16'hD12C; oRegData=16'h02; end
		9'd90 : begin oRegAddr=16'hD12D; oRegData=16'hFE; end
		9'd91 : begin oRegAddr=16'hD12E; oRegData=16'h03; end
		9'd92 : begin oRegAddr=16'hD12F; oRegData=16'h10; end
		9'd93 : begin oRegAddr=16'hD130; oRegData=16'h03; end
		9'd94 : begin oRegAddr=16'hD131; oRegData=16'h33; end
		9'd95 : begin oRegAddr=16'hD132; oRegData=16'h03; end
		9'd96 : begin oRegAddr=16'hD133; oRegData=16'h6D; end

		//#G+
		9'd97 : begin oRegAddr=16'hD200; oRegData=16'h00; end
		9'd98 : begin oRegAddr=16'hD201; oRegData=16'h33; end
		9'd99 : begin oRegAddr=16'hD202; oRegData=16'h00; end
		9'd100 : begin oRegAddr=16'hD203; oRegData=16'h34; end
		9'd101 : begin oRegAddr=16'hD204; oRegData=16'h00; end
		9'd102 : begin oRegAddr=16'hD205; oRegData=16'h3A; end
		9'd103 : begin oRegAddr=16'hD206; oRegData=16'h00; end
		9'd104 : begin oRegAddr=16'hD207; oRegData=16'h4A; end
		9'd105 : begin oRegAddr=16'hD208; oRegData=16'h00; end
		9'd106 : begin oRegAddr=16'hD209; oRegData=16'h5C; end
		9'd107 : begin oRegAddr=16'hD20A; oRegData=16'h00; end
		9'd108 : begin oRegAddr=16'hD20B; oRegData=16'h81; end
		9'd109 : begin oRegAddr=16'hD20C; oRegData=16'h00; end
		9'd110 : begin oRegAddr=16'hD20D; oRegData=16'hA6; end
		9'd111 : begin oRegAddr=16'hD20E; oRegData=16'h00; end
		9'd112 : begin oRegAddr=16'hD20F; oRegData=16'hE5; end
		9'd113 : begin oRegAddr=16'hD210; oRegData=16'h01; end
		9'd114 : begin oRegAddr=16'hD211; oRegData=16'h13; end
		9'd115 : begin oRegAddr=16'hD212; oRegData=16'h01; end
		9'd116 : begin oRegAddr=16'hD213; oRegData=16'h54; end
		9'd117 : begin oRegAddr=16'hD214; oRegData=16'h01; end
		9'd118 : begin oRegAddr=16'hD215; oRegData=16'h82; end
		9'd119 : begin oRegAddr=16'hD216; oRegData=16'h01; end
		9'd120 : begin oRegAddr=16'hD217; oRegData=16'hCA; end
		9'd121 : begin oRegAddr=16'hD218; oRegData=16'h02; end
		9'd122 : begin oRegAddr=16'hD219; oRegData=16'h00; end
		9'd123 : begin oRegAddr=16'hD21A; oRegData=16'h02; end
		9'd124 : begin oRegAddr=16'hD21B; oRegData=16'h01; end
		9'd125 : begin oRegAddr=16'hD21C; oRegData=16'h02; end
		9'd126 : begin oRegAddr=16'hD21D; oRegData=16'h34; end
		9'd127 : begin oRegAddr=16'hD21E; oRegData=16'h02; end
		9'd128 : begin oRegAddr=16'hD21F; oRegData=16'h67; end
		9'd129 : begin oRegAddr=16'hD220; oRegData=16'h02; end
		9'd130 : begin oRegAddr=16'hD221; oRegData=16'h84; end
		9'd131 : begin oRegAddr=16'hD222; oRegData=16'h02; end
		9'd132 : begin oRegAddr=16'hD223; oRegData=16'hA4; end
		9'd133 : begin oRegAddr=16'hD224; oRegData=16'h02; end
		9'd134 : begin oRegAddr=16'hD225; oRegData=16'hB7; end
		9'd135 : begin oRegAddr=16'hD226; oRegData=16'h02; end
		9'd136 : begin oRegAddr=16'hD227; oRegData=16'hCF; end
		9'd137 : begin oRegAddr=16'hD228; oRegData=16'h02; end
		9'd138 : begin oRegAddr=16'hD229; oRegData=16'hDE; end
		9'd139 : begin oRegAddr=16'hD22A; oRegData=16'h02; end
		9'd140 : begin oRegAddr=16'hD22B; oRegData=16'hF2; end
		9'd141 : begin oRegAddr=16'hD22C; oRegData=16'h02; end
		9'd142 : begin oRegAddr=16'hD22D; oRegData=16'hFE; end
		9'd143 : begin oRegAddr=16'hD22E; oRegData=16'h03; end
		9'd144 : begin oRegAddr=16'hD22F; oRegData=16'h10; end
		9'd145 : begin oRegAddr=16'hD230; oRegData=16'h03; end
		9'd146 : begin oRegAddr=16'hD231; oRegData=16'h33; end
		9'd147 : begin oRegAddr=16'hD232; oRegData=16'h03; end
		9'd148 : begin oRegAddr=16'hD233; oRegData=16'h6D; end

		//#B+
		9'd149 : begin oRegAddr=16'hD300; oRegData=16'h00; end
		9'd150 : begin oRegAddr=16'hD301; oRegData=16'h33; end
		9'd151 : begin oRegAddr=16'hD302; oRegData=16'h00; end
		9'd152 : begin oRegAddr=16'hD303; oRegData=16'h34; end
		9'd153 : begin oRegAddr=16'hD304; oRegData=16'h00; end
		9'd154 : begin oRegAddr=16'hD305; oRegData=16'h3A; end
		9'd155 : begin oRegAddr=16'hD306; oRegData=16'h00; end
		9'd156 : begin oRegAddr=16'hD307; oRegData=16'h4A; end
		9'd157 : begin oRegAddr=16'hD308; oRegData=16'h00; end
		9'd158 : begin oRegAddr=16'hD309; oRegData=16'h5C; end
		9'd159 : begin oRegAddr=16'hD30A; oRegData=16'h00; end
		9'd160 : begin oRegAddr=16'hD30B; oRegData=16'h81; end
		9'd161 : begin oRegAddr=16'hD30C; oRegData=16'h00; end
		9'd162 : begin oRegAddr=16'hD30D; oRegData=16'hA6; end
		9'd163 : begin oRegAddr=16'hD30E; oRegData=16'h00; end
		9'd164 : begin oRegAddr=16'hD30F; oRegData=16'hE5; end
		9'd165 : begin oRegAddr=16'hD310; oRegData=16'h01; end
		9'd166 : begin oRegAddr=16'hD311; oRegData=16'h13; end
		9'd167 : begin oRegAddr=16'hD312; oRegData=16'h01; end
		9'd168 : begin oRegAddr=16'hD313; oRegData=16'h54; end
		9'd169 : begin oRegAddr=16'hD314; oRegData=16'h01; end
		9'd170 : begin oRegAddr=16'hD315; oRegData=16'h82; end
		9'd171 : begin oRegAddr=16'hD316; oRegData=16'h01; end
		9'd172 : begin oRegAddr=16'hD317; oRegData=16'hCA; end
		9'd173 : begin oRegAddr=16'hD318; oRegData=16'h02; end
		9'd174 : begin oRegAddr=16'hD319; oRegData=16'h00; end
		9'd175 : begin oRegAddr=16'hD31A; oRegData=16'h02; end
		9'd176 : begin oRegAddr=16'hD31B; oRegData=16'h01; end
		9'd177 : begin oRegAddr=16'hD31C; oRegData=16'h02; end
		9'd178 : begin oRegAddr=16'hD31D; oRegData=16'h34; end
		9'd179 : begin oRegAddr=16'hD31E; oRegData=16'h02; end
		9'd180 : begin oRegAddr=16'hD31F; oRegData=16'h67; end
		9'd181 : begin oRegAddr=16'hD320; oRegData=16'h02; end
		9'd182 : begin oRegAddr=16'hD321; oRegData=16'h84; end
		9'd183 : begin oRegAddr=16'hD322; oRegData=16'h02; end
		9'd184 : begin oRegAddr=16'hD323; oRegData=16'hA4; end
		9'd185 : begin oRegAddr=16'hD324; oRegData=16'h02; end
		9'd186 : begin oRegAddr=16'hD325; oRegData=16'hB7; end
		9'd187 : begin oRegAddr=16'hD326; oRegData=16'h02; end
		9'd188 : begin oRegAddr=16'hD327; oRegData=16'hCF; end
		9'd189 : begin oRegAddr=16'hD328; oRegData=16'h02; end
		9'd190 : begin oRegAddr=16'hD329; oRegData=16'hDE; end
		9'd191 : begin oRegAddr=16'hD32A; oRegData=16'h02; end
		9'd192 : begin oRegAddr=16'hD32B; oRegData=16'hF2; end
		9'd193 : begin oRegAddr=16'hD32C; oRegData=16'h02; end
		9'd194 : begin oRegAddr=16'hD32D; oRegData=16'hFE; end
		9'd195 : begin oRegAddr=16'hD32E; oRegData=16'h03; end
		9'd196 : begin oRegAddr=16'hD32F; oRegData=16'h10; end
		9'd197 : begin oRegAddr=16'hD330; oRegData=16'h03; end
		9'd198 : begin oRegAddr=16'hD331; oRegData=16'h33; end
		9'd199 : begin oRegAddr=16'hD332; oRegData=16'h03; end
		9'd200 : begin oRegAddr=16'hD333; oRegData=16'h6D; end

		//#R-///////////////////////////////////////////
		9'd201 : begin oRegAddr=16'hD400; oRegData=16'h00; end
		9'd202 : begin oRegAddr=16'hD401; oRegData=16'h33; end
		9'd203 : begin oRegAddr=16'hD402; oRegData=16'h00; end
		9'd204 : begin oRegAddr=16'hD403; oRegData=16'h34; end
		9'd205 : begin oRegAddr=16'hD404; oRegData=16'h00; end
		9'd206 : begin oRegAddr=16'hD405; oRegData=16'h3A; end
		9'd207 : begin oRegAddr=16'hD406; oRegData=16'h00; end
		9'd208 : begin oRegAddr=16'hD407; oRegData=16'h4A; end
		9'd209 : begin oRegAddr=16'hD408; oRegData=16'h00; end
		9'd210 : begin oRegAddr=16'hD409; oRegData=16'h5C; end
		9'd211 : begin oRegAddr=16'hD40A; oRegData=16'h00; end
		9'd212 : begin oRegAddr=16'hD40B; oRegData=16'h81; end
		9'd213 : begin oRegAddr=16'hD40C; oRegData=16'h00; end
		9'd214 : begin oRegAddr=16'hD40D; oRegData=16'hA6; end
		9'd215 : begin oRegAddr=16'hD40E; oRegData=16'h00; end
		9'd216 : begin oRegAddr=16'hD40F; oRegData=16'hE5; end
		9'd217 : begin oRegAddr=16'hD410; oRegData=16'h01; end
		9'd218 : begin oRegAddr=16'hD411; oRegData=16'h13; end
		9'd219 : begin oRegAddr=16'hD412; oRegData=16'h01; end
		9'd220 : begin oRegAddr=16'hD413; oRegData=16'h54; end
		9'd221 : begin oRegAddr=16'hD414; oRegData=16'h01; end
		9'd222 : begin oRegAddr=16'hD415; oRegData=16'h82; end
		9'd223 : begin oRegAddr=16'hD416; oRegData=16'h01; end
		9'd224 : begin oRegAddr=16'hD417; oRegData=16'hCA; end
		9'd225 : begin oRegAddr=16'hD418; oRegData=16'h02; end
		9'd226 : begin oRegAddr=16'hD419; oRegData=16'h00; end
		9'd227 : begin oRegAddr=16'hD41A; oRegData=16'h02; end
		9'd228 : begin oRegAddr=16'hD41B; oRegData=16'h01; end
		9'd229 : begin oRegAddr=16'hD41C; oRegData=16'h02; end
		9'd230 : begin oRegAddr=16'hD41D; oRegData=16'h34; end
		9'd231 : begin oRegAddr=16'hD41E; oRegData=16'h02; end
		9'd232 : begin oRegAddr=16'hD41F; oRegData=16'h67; end
		9'd233 : begin oRegAddr=16'hD420; oRegData=16'h02; end
		9'd234 : begin oRegAddr=16'hD421; oRegData=16'h84; end
		9'd235 : begin oRegAddr=16'hD422; oRegData=16'h02; end
		9'd236 : begin oRegAddr=16'hD423; oRegData=16'hA4; end
		9'd237 : begin oRegAddr=16'hD424; oRegData=16'h02; end
		9'd238 : begin oRegAddr=16'hD425; oRegData=16'hB7; end
		9'd239 : begin oRegAddr=16'hD426; oRegData=16'h02; end
		9'd240 : begin oRegAddr=16'hD427; oRegData=16'hCF; end
		9'd241 : begin oRegAddr=16'hD428; oRegData=16'h02; end
		9'd242 : begin oRegAddr=16'hD429; oRegData=16'hDE; end
		9'd243 : begin oRegAddr=16'hD42A; oRegData=16'h02; end
		9'd244 : begin oRegAddr=16'hD42B; oRegData=16'hF2; end
		9'd245 : begin oRegAddr=16'hD42C; oRegData=16'h02; end
		9'd246 : begin oRegAddr=16'hD42D; oRegData=16'hFE; end
		9'd247 : begin oRegAddr=16'hD42E; oRegData=16'h03; end
		9'd248 : begin oRegAddr=16'hD42F; oRegData=16'h10; end
		9'd249 : begin oRegAddr=16'hD430; oRegData=16'h03; end
		9'd250 : begin oRegAddr=16'hD431; oRegData=16'h33; end
		9'd251 : begin oRegAddr=16'hD432; oRegData=16'h03; end
		9'd252 : begin oRegAddr=16'hD433; oRegData=16'h6D; end

		//#G-//////////////////////////////////////////////
		9'd253 : begin oRegAddr=16'hD500; oRegData=16'h00; end
		9'd254 : begin oRegAddr=16'hD501; oRegData=16'h33; end
		9'd255 : begin oRegAddr=16'hD502; oRegData=16'h00; end
		9'd256 : begin oRegAddr=16'hD503; oRegData=16'h34; end
		9'd257 : begin oRegAddr=16'hD504; oRegData=16'h00; end
		9'd258 : begin oRegAddr=16'hD505; oRegData=16'h3A; end
		9'd259 : begin oRegAddr=16'hD506; oRegData=16'h00; end
		9'd260 : begin oRegAddr=16'hD507; oRegData=16'h4A; end
		9'd261 : begin oRegAddr=16'hD508; oRegData=16'h00; end
		9'd262 : begin oRegAddr=16'hD509; oRegData=16'h5C; end
		9'd263 : begin oRegAddr=16'hD50A; oRegData=16'h00; end
		9'd264 : begin oRegAddr=16'hD50B; oRegData=16'h81; end
		9'd265 : begin oRegAddr=16'hD50C; oRegData=16'h00; end
		9'd266 : begin oRegAddr=16'hD50D; oRegData=16'hA6; end
		9'd267 : begin oRegAddr=16'hD50E; oRegData=16'h00; end
		9'd268 : begin oRegAddr=16'hD50F; oRegData=16'hE5; end
		9'd269 : begin oRegAddr=16'hD510; oRegData=16'h01; end
		9'd270 : begin oRegAddr=16'hD511; oRegData=16'h13; end
		9'd271 : begin oRegAddr=16'hD512; oRegData=16'h01; end
		9'd272 : begin oRegAddr=16'hD513; oRegData=16'h54; end
		9'd273 : begin oRegAddr=16'hD514; oRegData=16'h01; end
		9'd274 : begin oRegAddr=16'hD515; oRegData=16'h82; end
		9'd275 : begin oRegAddr=16'hD516; oRegData=16'h01; end
		9'd276 : begin oRegAddr=16'hD517; oRegData=16'hCA; end
		9'd277 : begin oRegAddr=16'hD518; oRegData=16'h02; end
		9'd278 : begin oRegAddr=16'hD519; oRegData=16'h00; end
		9'd279 : begin oRegAddr=16'hD51A; oRegData=16'h02; end
		9'd280 : begin oRegAddr=16'hD51B; oRegData=16'h01; end
		9'd281 : begin oRegAddr=16'hD51C; oRegData=16'h02; end
		9'd282 : begin oRegAddr=16'hD51D; oRegData=16'h34; end
		9'd283 : begin oRegAddr=16'hD51E; oRegData=16'h02; end
		9'd284 : begin oRegAddr=16'hD51F; oRegData=16'h67; end
		9'd285 : begin oRegAddr=16'hD520; oRegData=16'h02; end
		9'd286 : begin oRegAddr=16'hD521; oRegData=16'h84; end
		9'd287 : begin oRegAddr=16'hD522; oRegData=16'h02; end
		9'd288 : begin oRegAddr=16'hD523; oRegData=16'hA4; end
		9'd289 : begin oRegAddr=16'hD524; oRegData=16'h02; end
		9'd290 : begin oRegAddr=16'hD525; oRegData=16'hB7; end
		9'd291 : begin oRegAddr=16'hD526; oRegData=16'h02; end
		9'd292 : begin oRegAddr=16'hD527; oRegData=16'hCF; end
		9'd293 : begin oRegAddr=16'hD528; oRegData=16'h02; end
		9'd294 : begin oRegAddr=16'hD529; oRegData=16'hDE; end
		9'd295 : begin oRegAddr=16'hD52A; oRegData=16'h02; end
		9'd296 : begin oRegAddr=16'hD52B; oRegData=16'hF2; end
		9'd297 : begin oRegAddr=16'hD52C; oRegData=16'h02; end
		9'd298 : begin oRegAddr=16'hD52D; oRegData=16'hFE; end
		9'd299 : begin oRegAddr=16'hD52E; oRegData=16'h03; end
		9'd300 : begin oRegAddr=16'hD52F; oRegData=16'h10; end
		9'd301 : begin oRegAddr=16'hD530; oRegData=16'h03; end
		9'd302 : begin oRegAddr=16'hD531; oRegData=16'h33; end
		9'd303 : begin oRegAddr=16'hD532; oRegData=16'h03; end
		9'd304 : begin oRegAddr=16'hD533; oRegData=16'h6D; end

		//#B-///////////////////////////////
		9'd305 : begin oRegAddr=16'hD600; oRegData=16'h00; end
		9'd306 : begin oRegAddr=16'hD601; oRegData=16'h33; end
		9'd307 : begin oRegAddr=16'hD602; oRegData=16'h00; end
		9'd308 : begin oRegAddr=16'hD603; oRegData=16'h34; end
		9'd309 : begin oRegAddr=16'hD604; oRegData=16'h00; end
		9'd310 : begin oRegAddr=16'hD605; oRegData=16'h3A; end
		9'd311 : begin oRegAddr=16'hD606; oRegData=16'h00; end
		9'd312 : begin oRegAddr=16'hD607; oRegData=16'h4A; end
		9'd313 : begin oRegAddr=16'hD608; oRegData=16'h00; end
		9'd314 : begin oRegAddr=16'hD609; oRegData=16'h5C; end
		9'd315 : begin oRegAddr=16'hD60A; oRegData=16'h00; end
		9'd316 : begin oRegAddr=16'hD60B; oRegData=16'h81; end
		9'd317 : begin oRegAddr=16'hD60C; oRegData=16'h00; end
		9'd318 : begin oRegAddr=16'hD60D; oRegData=16'hA6; end
		9'd319 : begin oRegAddr=16'hD60E; oRegData=16'h00; end
		9'd320 : begin oRegAddr=16'hD60F; oRegData=16'hE5; end
		9'd321 : begin oRegAddr=16'hD610; oRegData=16'h01; end
		9'd322 : begin oRegAddr=16'hD611; oRegData=16'h13; end
		9'd323 : begin oRegAddr=16'hD612; oRegData=16'h01; end
		9'd324 : begin oRegAddr=16'hD613; oRegData=16'h54; end
		9'd325 : begin oRegAddr=16'hD614; oRegData=16'h01; end
		9'd326 : begin oRegAddr=16'hD615; oRegData=16'h82; end
		9'd327 : begin oRegAddr=16'hD616; oRegData=16'h01; end
		9'd328 : begin oRegAddr=16'hD617; oRegData=16'hCA; end
		9'd329 : begin oRegAddr=16'hD618; oRegData=16'h02; end
		9'd330 : begin oRegAddr=16'hD619; oRegData=16'h00; end
		9'd331 : begin oRegAddr=16'hD61A; oRegData=16'h02; end
		9'd332 : begin oRegAddr=16'hD61B; oRegData=16'h01; end
		9'd333 : begin oRegAddr=16'hD61C; oRegData=16'h02; end
		9'd334 : begin oRegAddr=16'hD61D; oRegData=16'h34; end
		9'd335 : begin oRegAddr=16'hD61E; oRegData=16'h02; end
		9'd336 : begin oRegAddr=16'hD61F; oRegData=16'h67; end
		9'd337 : begin oRegAddr=16'hD620; oRegData=16'h02; end
		9'd338 : begin oRegAddr=16'hD621; oRegData=16'h84; end
		9'd339 : begin oRegAddr=16'hD622; oRegData=16'h02; end
		9'd340 : begin oRegAddr=16'hD623; oRegData=16'hA4; end
		9'd341 : begin oRegAddr=16'hD624; oRegData=16'h02; end
		9'd342 : begin oRegAddr=16'hD625; oRegData=16'hB7; end
		9'd343 : begin oRegAddr=16'hD626; oRegData=16'h02; end
		9'd344 : begin oRegAddr=16'hD627; oRegData=16'hCF; end
		9'd345 : begin oRegAddr=16'hD628; oRegData=16'h02; end
		9'd346 : begin oRegAddr=16'hD629; oRegData=16'hDE; end
		9'd347 : begin oRegAddr=16'hD62A; oRegData=16'h02; end
		9'd348 : begin oRegAddr=16'hD62B; oRegData=16'hF2; end
		9'd349 : begin oRegAddr=16'hD62C; oRegData=16'h02; end
		9'd350 : begin oRegAddr=16'hD62D; oRegData=16'hFE; end
		9'd351 : begin oRegAddr=16'hD62E; oRegData=16'h03; end
		9'd352 : begin oRegAddr=16'hD62F; oRegData=16'h10; end
		9'd353 : begin oRegAddr=16'hD630; oRegData=16'h03; end
		9'd354 : begin oRegAddr=16'hD631; oRegData=16'h33; end
		9'd355 : begin oRegAddr=16'hD632; oRegData=16'h03; end
		9'd356 : begin oRegAddr=16'hD633; oRegData=16'h6D; end

		//#Enable Page0
		9'd357 : begin oRegAddr=16'hF000; oRegData=16'h55; end
		9'd358 : begin oRegAddr=16'hF001; oRegData=16'hAA; end
		9'd359 : begin oRegAddr=16'hF002; oRegData=16'h52; end
		9'd360 : begin oRegAddr=16'hF003; oRegData=16'h08; end
		9'd361 : begin oRegAddr=16'hF004; oRegData=16'h00; end

		//# RGB I/F Setting
		9'd362 : begin oRegAddr=16'hB100; oRegData=16'hCC; end
		9'd363 : begin oRegAddr=16'hB101; oRegData=16'h00; end

		////## SDT:
		9'd364 : begin oRegAddr=16'hB600; oRegData=16'h05; end

		//## Gate EQ:
		9'd365 : begin oRegAddr=16'hB700; oRegData=16'h70; end
		9'd366 : begin oRegAddr=16'hB701; oRegData=16'h70; end

		//## Source EQ:
		9'd367 : begin oRegAddr=16'hB800; oRegData=16'h01; end
		9'd368 : begin oRegAddr=16'hB801; oRegData=16'h03; end
		9'd369 : begin oRegAddr=16'hB802; oRegData=16'h03; end
		9'd370 : begin oRegAddr=16'hB803; oRegData=16'h03; end

		//# Inversion: Column inversion (NVT)
		9'd371 : begin oRegAddr=16'hBC00; oRegData=16'h02; end
		9'd372 : begin oRegAddr=16'hBC01; oRegData=16'h00; end
		9'd373 : begin oRegAddr=16'hBC02; oRegData=16'h00; end

		//# Display Timing:
		9'd374 : begin oRegAddr=16'hC900; oRegData=16'hD0; end
		9'd375 : begin oRegAddr=16'hC901; oRegData=16'h02; end
		9'd376 : begin oRegAddr=16'hC902; oRegData=16'h50; end
		9'd377 : begin oRegAddr=16'hC903; oRegData=16'h50; end
		9'd378 : begin oRegAddr=16'hC904; oRegData=16'h50; end
		
		9'd379 : begin oRegAddr=16'h3500; oRegData=16'h00; end
		9'd380 : begin oRegAddr=16'h3A00; oRegData=16'h55; end

	endcase
end
endmodule
