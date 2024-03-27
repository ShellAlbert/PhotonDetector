module ZBlockRAMSchedule(
    input iClk, //100MHz Clock Input.
    input iRst_N,

    //Write Block RAM.
    input iWrReq,
    input [11:0] iWrReq_Addr,
    input [15:0] iWrReq_PulseCounter,
    output reg oWrDone,

    //Read Block RAM.
    input iRdReq,
    input [11:0] iRdReq_Addr,
    output reg [15:0] oRdReq_PulseCounter,
    output reg oRdDone,

    //interface for BlockRAM.
    output reg [11:0] oBlockRAM_Addr,
    output reg [15:0] oBlockRAM_Data,
    input [15:0] iBlockRAM_Data,
    output reg oBlockRAM_WrEn
);

//driven by step_i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    step_i<=0;
    oBlockRAM_Addr<=0;
    oBlockRAM_Data<=0;
    oBlockRAM_WrEn<=0;
    oWrDone<=0;
    oRdReq_PulseCounter<=0;
    oRdDone<=0;
end
else begin
        case({iWrReq,iRdReq})
        2'b10: //Write Request.
            begin
                case(step_i)
                0: //prepare Addr & Data.
                    begin
                        oBlockRAM_Addr<=iWrReq_Addr;
                        oBlockRAM_Data<=iWrReq_PulseCounter;
                        oBlockRAM_WrEn<=1;
                        step_i<=step_i+1;
                    end
                1: //generate Wr Enable.
                    begin
                        oBlockRAM_WrEn<=0;
                        step_i<=step_i+1;
                    end
                2: //Single Pulse Done Signal -- HIGH.
                    begin
                        oWrDone<=1;
                        step_i<=step_i+1;
                    end
                3: //Single Pulse Done Signal -- LOW.
                    begin
                        oWrDone<=0;
                        step_i<=0;
                    end
                default:
                    begin
                        step_i<=0;
                    end
                endcase
            end
        2'b01: //Read Request.
            begin
                case(step_i)
                0: //Prepare Address.
                    begin
                        oBlockRAM_Addr<=iRdReq_Addr;
                        step_i<=step_i+1;
                    end
                1: //Latch data in.
                    begin
                        oRdReq_PulseCounter<=iBlockRAM_Data;
                        step_i<=step_i+1;
                    end
                2: //Single Pulse Done Signal -- HIGH.
                    begin
                        oRdDone<=1;
                        step_i<=step_i+1;
                    end
                3: //Single Pulse Done Signal -- LOW.
                    begin
                        oRdDone<=0;
                        step_i<=0;
                    end
                default:
                    begin
                        step_i<=0;
                    end
                endcase
            end
        default:
            begin
                oWrDone<=0;
                oRdDone<=0;
            end
        endcase
end
/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0({iWrReq,iWrReq_Addr[11:0],iWrReq_PulseCounter[15:0],oWrDone,2'd0}), // input wire [31:0]  probe0  
	.probe1({iRdReq,iRdReq_Addr[11:0],oRdReq_PulseCounter[15:0],oRdDone,2'd0}), // input wire [31:0]  probe1 
	.probe2({oBlockRAM_WrEn,iBlockRAM_Data[15:0],oBlockRAM_Addr[11:0],3'd0}) // input wire [31:0]  probe2
);
*/
endmodule