module ZSinglePhotonDector(
//the external main clock.
input iClk, 

//Debug LED.
output reg [1:0] oLed,

//SAPD quench logic.
output oQuench_Voltage_Down,
output oReset_Discharge,
input iPulse,
input iPulse2,

//SDRAM interface.
output oSDRAM_Clk,
output oSDRAM_Clk_EN,
output [11:0] oSDRAM_Addr,
inout [31:0] ioSDRAM_Data,
output [3:0] oSDRAM_DQM,
output [1:0] oSDRAM_BankAddr,
output oSDRAM_WE, //Write Enable.
output oSDRAM_CAS, 
output oSDRAM_RAS,
output oSDRAM_CS,

//RS485.
output oRS485_Dir,
output oRS485_Txd,
input iRS485_Rxd,

//Interaction Key Input.
input [3:0] iKey
);

always @(posedge iClk)
begin
    oLed<=2'b11;
end
endmodule
