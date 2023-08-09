<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="ZsyDotMatrix">
            <timestamp>2022-11-1T8:12:58</timestamp>
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="112" x="336" y="-172" height="24" />
            <rect width="84" x="364" y="-44" height="28" />
            <line x2="364" y1="-32" y2="-32" x1="448" />
            <rect width="308" x="64" y="-192" height="192" />
            <line x2="336" y1="-160" y2="-160" x1="448" />
        </blockdef>
        <blockdef name="ZsySPI_TxByte">
            <timestamp>2022-11-1T8:5:24</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ZsyCfgRegsData">
            <timestamp>2022-11-1T8:18:22</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="ZsyDotMatrix" name="XLXI_4">
            <blockpin name="clk" />
            <blockpin name="rst_n" />
            <blockpin name="addr(3:0)" />
            <blockpin name="data_top(127:0)" />
            <blockpin name="data_btm(127:0)" />
        </block>
        <block symbolname="ZsySPI_TxByte" name="XLXI_5">
            <blockpin name="clk" />
            <blockpin name="rst_n" />
            <blockpin name="en" />
            <blockpin name="dc_flag" />
            <blockpin name="txByte(7:0)" />
            <blockpin name="cs_n" />
            <blockpin name="sclk" />
            <blockpin name="dc" />
            <blockpin name="sdin" />
            <blockpin name="isDone" />
        </block>
        <block symbolname="ZsyCfgRegsData" name="XLXI_6">
            <blockpin name="clk" />
            <blockpin name="rst_n" />
            <blockpin name="addr(7:0)" />
            <blockpin name="dc_flag" />
            <blockpin name="data(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1648" y="944" name="XLXI_5" orien="R0">
        </instance>
        <instance x="944" y="528" name="XLXI_6" orien="R0">
        </instance>
        <instance x="944" y="864" name="XLXI_4" orien="R0">
        </instance>
    </sheet>
</drawing>