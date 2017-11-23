//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Mon Apr 10 12:14:05 2017
//Host        : DESKTOP-RL33AL7 running 64-bit major release  (build 9200)
//Command     : generate_target Top_Level_Design_BD_wrapper.bd
//Design      : Top_Level_Design_BD_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Top_Level_Design_BD_wrapper
   (OV7670_D,
    OV7670_HREF,
    OV7670_PCLK,
    OV7670_PWDN,
    OV7670_RESET,
    OV7670_SIOC,
    OV7670_SIOD,
    OV7670_VSYNC,
    OV7670_XCLK,
    TMP_SCL,
    TMP_SDA,
    VGA_Blue,
    VGA_Green,
    VGA_HSYNC,
    VGA_MODE,
    VGA_Red,
    VGA_VSYNC,
    clock_rtl,
    miso,
    mosi,
    reset_rtl,
    reset_rtl_0,
    robot_wheel_driver_1,
    robot_wheel_driver_2,
    robot_wheel_driver_3,
    robot_wheel_driver_4,
    sclk,
    ss,
    uart_rtl_0_rxd,
    uart_rtl_0_txd,
    uart_rtl_rxd,
    uart_rtl_txd,
    vauxn10,
    vauxn11,
    vauxn2,
    vauxn3,
    vauxp10,
    vauxp11,
    vauxp2,
    vauxp3,
    vn_in,
    vp_in);
  input [7:0]OV7670_D;
  input OV7670_HREF;
  input OV7670_PCLK;
  output OV7670_PWDN;
  output OV7670_RESET;
  output OV7670_SIOC;
  inout OV7670_SIOD;
  input OV7670_VSYNC;
  output OV7670_XCLK;
  inout TMP_SCL;
  inout TMP_SDA;
  output [3:0]VGA_Blue;
  output [3:0]VGA_Green;
  output VGA_HSYNC;
  input VGA_MODE;
  output [3:0]VGA_Red;
  output VGA_VSYNC;
  input clock_rtl;
  input miso;
  output mosi;
  input reset_rtl;
  input reset_rtl_0;
  output [1:0]robot_wheel_driver_1;
  output [1:0]robot_wheel_driver_2;
  output [1:0]robot_wheel_driver_3;
  output [1:0]robot_wheel_driver_4;
  output sclk;
  output ss;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;
  input uart_rtl_rxd;
  output uart_rtl_txd;
  input vauxn10;
  input vauxn11;
  input vauxn2;
  input vauxn3;
  input vauxp10;
  input vauxp11;
  input vauxp2;
  input vauxp3;
  input vn_in;
  input vp_in;

  wire [7:0]OV7670_D;
  wire OV7670_HREF;
  wire OV7670_PCLK;
  wire OV7670_PWDN;
  wire OV7670_RESET;
  wire OV7670_SIOC;
  wire OV7670_SIOD;
  wire OV7670_VSYNC;
  wire OV7670_XCLK;
  wire TMP_SCL;
  wire TMP_SDA;
  wire [3:0]VGA_Blue;
  wire [3:0]VGA_Green;
  wire VGA_HSYNC;
  wire VGA_MODE;
  wire [3:0]VGA_Red;
  wire VGA_VSYNC;
  wire clock_rtl;
  wire miso;
  wire mosi;
  wire reset_rtl;
  wire reset_rtl_0;
  wire [1:0]robot_wheel_driver_1;
  wire [1:0]robot_wheel_driver_2;
  wire [1:0]robot_wheel_driver_3;
  wire [1:0]robot_wheel_driver_4;
  wire sclk;
  wire ss;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;
  wire vauxn10;
  wire vauxn11;
  wire vauxn2;
  wire vauxn3;
  wire vauxp10;
  wire vauxp11;
  wire vauxp2;
  wire vauxp3;
  wire vn_in;
  wire vp_in;

  Top_Level_Design_BD Top_Level_Design_BD_i
       (.OV7670_D(OV7670_D),
        .OV7670_HREF(OV7670_HREF),
        .OV7670_PCLK(OV7670_PCLK),
        .OV7670_PWDN(OV7670_PWDN),
        .OV7670_RESET(OV7670_RESET),
        .OV7670_SIOC(OV7670_SIOC),
        .OV7670_SIOD(OV7670_SIOD),
        .OV7670_VSYNC(OV7670_VSYNC),
        .OV7670_XCLK(OV7670_XCLK),
        .TMP_SCL(TMP_SCL),
        .TMP_SDA(TMP_SDA),
        .VGA_Blue(VGA_Blue),
        .VGA_Green(VGA_Green),
        .VGA_HSYNC(VGA_HSYNC),
        .VGA_MODE(VGA_MODE),
        .VGA_Red(VGA_Red),
        .VGA_VSYNC(VGA_VSYNC),
        .clock_rtl(clock_rtl),
        .miso(miso),
        .mosi(mosi),
        .reset_rtl(reset_rtl),
        .reset_rtl_0(reset_rtl_0),
        .robot_wheel_driver_1(robot_wheel_driver_1),
        .robot_wheel_driver_2(robot_wheel_driver_2),
        .robot_wheel_driver_3(robot_wheel_driver_3),
        .robot_wheel_driver_4(robot_wheel_driver_4),
        .sclk(sclk),
        .ss(ss),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd),
        .vauxn10(vauxn10),
        .vauxn11(vauxn11),
        .vauxn2(vauxn2),
        .vauxn3(vauxn3),
        .vauxp10(vauxp10),
        .vauxp11(vauxp11),
        .vauxp2(vauxp2),
        .vauxp3(vauxp3),
        .vn_in(vn_in),
        .vp_in(vp_in));
endmodule
