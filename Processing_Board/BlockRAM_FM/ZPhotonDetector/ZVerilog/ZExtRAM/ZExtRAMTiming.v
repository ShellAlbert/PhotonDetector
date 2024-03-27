//Preface
//We seperate each period into 60 pieces, Altenating Current Frequency f=50Hz, t=20mS.
//So 20mS/60 pieces=333uS, it means we should lock in one pulse counter to RAM every 333uS.
//Within 1 second, there're 50 periods,
//the total data size within 1 second is calculated by equation
//50 periods * 60 numbers within one period * 16bits = 48000bits = 48Kbits

//IS42S32400F or IS45S32400F
//The 128Mb SDRAM is organized in 1Meg x 32 bit x 4 Banks.
//Bank0 & Bank1 can operate 4 banks, each bank contains 1Meg bits.
//So for 1 second data, one Bank is enough. 
//row address A0~A11, 2^12=4096.
//column address A0~A7, 2^8=256.

//4096 refresh cycles every 16ms (A2 grade) or 64 ms (Commercial, Industrial, A1 grade)
//64ms/4096=15.625uS
//So SDRAM should be refreshed every 15.625uS
//In order to keep adequate time, we choose 10uS here.

module ZExtRAMTiming(
    input iClk, //100MHz Clock Input.
    input iRst_N,

    //input iSDRAMClk,
    //iOpReq[0]: Initialize and Load Mode Register.
    //iOpReq[1]: AUTO-REFRESH CYCLE.
    //iOpReq[2]: Single Read with Auto Precharge.
    //iOpReq[3]: Single Write with Auto Precharge.
    input [3:0] iOpReq, //Operating Request.
    output reg oOpDone, //Operating Done.

    //Bank Address =2 (BA0,BA1)
    //Row Address = 12 (A0~A11)
    //Column Address = 8 (A0~A7)
    //{BankAddr[21:20], RowAddr[19:8], ColumnAddr[7:0]}
    input [21:0] iRAMAddr, 

    //input data interface for writing. 
    input [31:0] iPulseCounter,

    //output data interface for reading.
    output reg [31:0] oPulseCounter,

    //External RAM Interface.
    output reg [11:0] oRAM_Addr, //A11~A0, Address Input.
    output reg [1:0] oRAM_BankAddr, //Bank1,Bank0.
    output oRAM_CS, //Chip Selection.
    output oRAM_WE, //Write Enable.
    output oRAM_CAS, //Column Address Strobe.
    output oRAM_RAS, //Row Address Strobe.
    output oRAM_ACLKB, //System Clock Input.
    output oRAM_ACLKB2, 
    output oRAM_CKE, //Clock Enable.
    output reg [3:0] oRAM_DQM,//Data Byte Mask.
    inout [31:0] ioRAM_DQ //32 bits-Data Bus.
);
//assign oRAM_DQM=4'b0000;
//assign oRAM_CLK=iClk;
/*
//Foward Clk to General Purpose I/O using ODDR.
wire clk_to_sdram;
ODDR2 oddr2_inst(
.D0(1'b1),
.D1(1'b0),
.CE(1'b1),
.C0(iSDRAMClk),
.C1(!iSDRAMClk),
.R(1'b0),
.S(1'b0),
.Q(clk_to_sdram));
assign oRAM_ACLKB=clk_to_sdram;

wire clk_to_sdram2;
ODDR2 oddr2_inst2(
.D0(1'b1),
.D1(1'b0),
.CE(1'b1),
.C0(iSDRAMClk),
.C1(!iSDRAMClk),
.R(1'b0),
.S(1'b0),
.Q(clk_to_sdram2));
assign oRAM_ACLKB2=clk_to_sdram2;
*/

//tri-states.
reg [31:0] oRAM_DQ;
reg isOut;
assign ioRAM_DQ=(isOut==1)?(oRAM_DQ):(32'hzzzzzzzz);

//Command Truth Table.
//CKE,CS_N,RAS_N,CAS_N,WE_N
//CKE=1 at n-1 clock period.
//CKE=following value at n clock period.
parameter
CMD_DESL=       5'b01111, //Device deselect.(DESL)
CMD_NOP=        5'b10111, //No Operation. (NOP)
CMD_BST=        5'b10110, //Burst Stop. (BST)
CMD_READ=       5'b10101, //Read.
CMD_READ_AP=    5'b10101, //Read with auto precharge.
CMD_WRITE=      5'b10100, //Write
CMD_WRITE_AP=   5'b10100, //Write with auto precharge.
CMD_ACT=        5'b10011, //Bank Activate.(ACT)
CMD_PRE=        5'b10010, //Precharge select bank.(PRE)
CMD_PALL=       5'b10010, //Precharge all banks. (PALL)
CMD_REF=        5'b10001, //CBR Auto-Refresh. (REF)
CMD_SELF=       5'b00001, //Self-Refresh.(SELF)
CMD_MRS=        5'b10000; //Mode resister set. (MRS)

//Combine all lines into one register for convenient operation.
reg [4:0] RAMCmd;
assign {oRAM_CKE, oRAM_CS, oRAM_RAS, oRAM_CAS, oRAM_WE}=RAMCmd;

//Time Constant Definition Here.

//The Main Clock is 100MHz,
//so t=(1/100MHz)S=(1000/100MHz)mS=(1000,000/100MHz)us=(1/100)uS=0.01uS=10nS
//We use 100uS here, an additional 100uS is used for stability.
parameter t100uS=20000; //200uS/0.01uS=20000

//In datasheet, tRP=18ns(Min) for -6 series, 20ns(Min) for -7 series, 15ns(Min) for -75E series.
//We choose 50ns here to be compatible with all series.
parameter tRP=5; //50nS/10nS=5

//In datasheet, tRC=60ns(Min) for -6 series, 65ns(Min) for -7 series, 67.5ns(Min) for -75E series.
//We choose 125ns here to be compatible with all series.
parameter tRC=13; //125nS/10nS=12.5

//In datasheet, tMRD=12ns(Min) for -6 series, 14ns(Min) for -7 series, 15ns(Min) for -75E series.
//We choose 50ns here to be compatible with all series.
parameter tMRD=5; //50nS/10nS=5

//In datasheet, tRCD=18ns(Min) for -6 series, 20ns(Min) for -7 series, 15ns(Min) for -75E series.
//We choose 30ns here to be compatible with all series.
parameter tRCD=3; //30nS/10nS=3.

//In datasheet, tDPL=12ns(Min) for -6 series, 14ns(Min) for -7 series, 15ns(Min) for -75E series.
//We choose 30ns here to be compatible with all series.
parameter tDPL=3; //30nS/10nS=3.

//Common used counter register.
reg [31:0] C1; //Counter-1.

//the whole progress is driven by step_i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N)begin
    step_i<=0;
    RAMCmd<=CMD_NOP; //IDLE.
    C1<=0;
    isOut<=1'b1; //Output state at default.
    oRAM_DQ<=0;
    oRAM_Addr<=12'hFFF;
    oRAM_BankAddr<=2'b11;
    oRAM_DQM<=4'b1111;
    oOpDone<=1'b0;
end
else begin
        case(iOpReq)
        4'b0001: //iOpReq[0]=1: Initialize and Load Mode Register.
            begin
                case(step_i)
                    0: //NOP Command, and Delay 100uS.
                    begin
                        if(C1==t100uS-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    1: //PRECHARGE Command.
                    begin
                        RAMCmd<=CMD_PALL;
                        //Precharge all banks (PALLL), A10=1.
                        //A10 determined whether one or all banks are precharged.
                        oRAM_Addr<=12'hFFF;
                        step_i<=step_i+1;
                    end
                    2: //Waiting tRP.
                    begin
                        if(C1==tRP-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            C1<=C1+1;
                        end
                    end
                    3: //Auto-Refresh Command.
                    begin
                        RAMCmd<=CMD_REF;
                        step_i<=step_i+1;
                    end
                    4: //Waiting tRC.
                    begin
                        if(C1==tRC-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    5: //Auto-Refresh Command.
                    begin
                        RAMCmd<=CMD_REF;
                        step_i<=step_i+1;
                    end
                    6: //Waiting tRC.
                    begin
                        if(C1==tRC-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    7: //Program Mode Register.
                    begin
                        RAMCmd<=CMD_MRS;
                        //A2,A1,A0=000: Burst Length=1
                        //A3=0: Sequential
                        //A6,A5,A4=010: CAS Latency=2
                        //A8,A7=00: Standard Operation
                        //A9=0 
                        //When M9 = 0, the burst length programmed via M0-M2 applies to both READ and WRITE bursts.
                        //when M9 = 1, the programmed burst length applies to READ bursts, but write accesses are single-location (nonburst) accesses.
                        //BA1,BA0,A11,A10=0000 : To ensure compatibility with future devices. should program to 0.
                        {oRAM_BankAddr,oRAM_Addr}<={4'b0000,1'b0,2'b00,3'b010,1'b0,3'b000};
                        step_i<=step_i+1;
                    end
                    8: //Waiting tMRD.
                    begin
                        if(C1==tMRD-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    9: //Single Pulse Done Signal - HIGH.
                    begin
                        oOpDone<=1'b1;
                        step_i<=step_i+1;
                    end
                    10: //Single Pulse Done Signal - LOW.
                    begin
                        oOpDone<=1'b0;
                        step_i<=0;
                    end
                endcase
            end
        4'b0010: //iOpReq[1]=1: AUTO-REFRESH CYCLE.
            begin
                case(step_i)
                    0: //PRECHARGE Command.
                    begin 
                        RAMCmd<=CMD_PALL; //Precharge all banks. (PALL)
                        //A10 determined whether one or all banks are precharged. 
                        oRAM_Addr[10]<=1'b1;
                        step_i<=step_i+1;
                    end
                    1: //Waiting tRP.
                    begin
                        if(C1==tRP-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    2: //Auto Refresh Command.
                    begin
                        RAMCmd<=CMD_REF; //CBR Auto-Refresh. (REF)
                        step_i<=step_i+1;
                    end
                    3: //Waiting tRC.
                    begin
                        if(C1==tRC-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    4: //Auto Refresh Command.
                    begin
                        RAMCmd<=CMD_REF; //CBR Auto-Refresh. (REF)
                        step_i<=step_i+1;
                    end
                    5: //Waiting tRC.
                    begin
                        if(C1==tRC-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    6: //Single Pulse Done Signal - HIGH.
                    begin
                        oOpDone<=1'b1;
                        step_i<=step_i+1;
                    end
                    7: //Single Pulse Done Signal - LOW.
                    begin
                        oOpDone<=1'b0;
                        step_i<=0;
                    end
                endcase
            end
        4'b0100: //iOpReq[2]=1: Single Read with Auto Precharge.
            begin
                case(step_i)
                    0: //Set tri-state to input.
                    begin
                        isOut<=1'b0;
                        step_i<=step_i+1;
                    end
                    1: //ACTIVE Command.
                    begin
                        RAMCmd<=CMD_ACT; //ACTIVE Command.
                        oRAM_BankAddr<=iRAMAddr[21:20]; //Bank Address.
                        oRAM_Addr<=iRAMAddr[19:8]; //Row Address.
                        step_i<=step_i+1;
                    end
                    2: //Waiting tRCD.
                    begin
                        if(C1==tRCD-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    3: //READ Command.
                    begin
                        RAMCmd<=CMD_READ; //READ Command.
                        oRAM_DQM<=4'b0000;
                        oRAM_BankAddr<=iRAMAddr[21:20]; //Bank Address.
                        //A10=1, Enable Auto Precharge.
                        oRAM_Addr<={4'b0100,iRAMAddr[7:0]}; //Column Address.
                        step_i<=step_i+1;
                    end
                    4: //Waiting CAS Latency=2.
                    begin
                        if(C1==2-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    5: //Read data in.
                    begin
                        oPulseCounter<=ioRAM_DQ;
                        step_i<=step_i+1;
                    end
                    6: //Waiting tRP.
                    begin
                        if(C1==tRP-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            oRAM_DQM<=4'b1111;
                            C1<=C1+1;
                        end
                    end
                    7: //Single Pulse Done Signal - HIGH.
                    begin
                        oOpDone<=1'b1;
                        step_i<=step_i+1;
                    end
                    8: //Single Pulse Done Signal - LOW.
                    begin
                        oOpDone<=1'b0;
                        step_i<=0;
                    end
                endcase
            end
        4'b1000: //iOpReq[3]=1: Single Write with Auto Precharge.
            begin
                case(step_i)
                    0: //Set tri-state to output.
                    begin
                        isOut<=1'b1;
                        step_i<=step_i+1;
                    end
                    1: //ACTIVE Command.
                    begin
                        RAMCmd<=CMD_ACT; //ACTIVE Command.
                        oRAM_BankAddr<=iRAMAddr[21:20]; //Bank Address.
                        oRAM_Addr<=iRAMAddr[19:8]; //Row Address.
                        step_i<=step_i+1;
                    end
                    2: //Waiting tRCD.
                    begin
                        if(C1==tRCD-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    3: //WRITE Command.
                    begin
                        RAMCmd<=CMD_WRITE; //WRITE Command.
                        oRAM_DQM<=4'b0000;
                        oRAM_BankAddr<=iRAMAddr[21:20]; //Bank Address.
                        //A10=1, Enable Auto Precharge.
                        oRAM_Addr<={4'b0100,iRAMAddr[7:0]}; //Column Address.
                        oRAM_DQ<=32'hABCD1234; //iPulseCounter; //Write Data.
                        step_i<=step_i+1;
                    end
                    4: //Waiting tDPL.
                    begin
                        if(C1==tDPL-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            C1<=C1+1;
                        end
                    end
                    5: //Waiting tRP.
                    begin
                        if(C1==tRP-1) begin
                            C1<=0;
                            step_i<=step_i+1;
                        end
                        else begin
                            RAMCmd<=CMD_NOP;
                            oRAM_DQM<=4'b1111;
                            C1<=C1+1;
                        end
                    end
                    6: //Single Pulse Done Signal - HIGH.
                    begin
                        oOpDone<=1'b1;
                        step_i<=step_i+1;
                    end
                    7: //Single Pulse Done Signal - LOW.
                    begin
                        oOpDone<=1'b0;
                        step_i<=0;
                    end
                endcase
            end
        default:
            begin
                oOpDone<=1'b0;
                step_i<=0;
            end
        endcase
end

/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0(ioRAM_DQ), // input wire [31:0]  probe0  
	.probe1({oRAM_BankAddr,oRAM_Addr,18'd0}), // input wire [31:0]  probe1 
	.probe2({ 
        step_i[7:0],
        iOpReq[3:0],
        oOpDone,
        RAMCmd[4:0],
        isOut,
        13'd0
    }) // input wire [31:0]  probe2
);
*/
endmodule