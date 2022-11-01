<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="ZsyOledRegsData">
            <timestamp>2022-11-1T1:47:26</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ZsySPI_TxByte">
            <timestamp>2022-11-1T1:47:32</timestamp>
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
        <blockdef name="ZsyDotMatrix">
            <timestamp>2022-11-1T1:47:37</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="ZsyOledRegsData" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin name="rst_n" />
            <blockpin name="addr(7:0)" />
            <blockpin name="dc_flag" />
            <blockpin name="data(7:0)" />
        </block>
        <block symbolname="ZsySPI_TxByte" name="XLXI_2">
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
        <block symbolname="ZsyDotMatrix" name="XLXI_3">
            <blockpin name="clk" />
            <blockpin name="rst_n" />
            <blockpin name="addr(3:0)" />
            <blockpin name="data_top(127:0)" />
            <blockpin name="data_btm(127:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1616" y="1360" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1136" y="864" name="XLXI_1" orien="R0">
        </instance>
        <instance x="672" y="1296" name="XLXI_3" orien="R0">
        </instance>
    </sheet>
</drawing>