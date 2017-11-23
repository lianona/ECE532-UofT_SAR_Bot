// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:OV7670_VGA:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module Top_Level_Design_BD_OV7670_VGA_0_0 (
  OV7670_VSYNC,
  OV7670_HREF,
  OV7670_PCLK,
  OV7670_XCLK,
  OV7670_SIOC,
  OV7670_SIOD,
  OV7670_D,
  OV7670_PWDN,
  OV7670_RESET,
  VGA_Red,
  VGA_Green,
  VGA_Blue,
  VGA_HSYNC,
  VGA_VSYNC,
  VGA_MODE,
  ov7670_vga_axi_awaddr,
  ov7670_vga_axi_awprot,
  ov7670_vga_axi_awvalid,
  ov7670_vga_axi_awready,
  ov7670_vga_axi_wdata,
  ov7670_vga_axi_wstrb,
  ov7670_vga_axi_wvalid,
  ov7670_vga_axi_wready,
  ov7670_vga_axi_bresp,
  ov7670_vga_axi_bvalid,
  ov7670_vga_axi_bready,
  ov7670_vga_axi_araddr,
  ov7670_vga_axi_arprot,
  ov7670_vga_axi_arvalid,
  ov7670_vga_axi_arready,
  ov7670_vga_axi_rdata,
  ov7670_vga_axi_rresp,
  ov7670_vga_axi_rvalid,
  ov7670_vga_axi_rready,
  ov7670_vga_axi_aclk,
  ov7670_vga_axi_aresetn
);

input wire OV7670_VSYNC;
input wire OV7670_HREF;
input wire OV7670_PCLK;
output wire OV7670_XCLK;
output wire OV7670_SIOC;
inout wire OV7670_SIOD;
input wire [7 : 0] OV7670_D;
output wire OV7670_PWDN;
output wire OV7670_RESET;
output wire [3 : 0] VGA_Red;
output wire [3 : 0] VGA_Green;
output wire [3 : 0] VGA_Blue;
output wire VGA_HSYNC;
output wire VGA_VSYNC;
input wire VGA_MODE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI AWADDR" *)
input wire [3 : 0] ov7670_vga_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI AWPROT" *)
input wire [2 : 0] ov7670_vga_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI AWVALID" *)
input wire ov7670_vga_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI AWREADY" *)
output wire ov7670_vga_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI WDATA" *)
input wire [31 : 0] ov7670_vga_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI WSTRB" *)
input wire [3 : 0] ov7670_vga_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI WVALID" *)
input wire ov7670_vga_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI WREADY" *)
output wire ov7670_vga_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI BRESP" *)
output wire [1 : 0] ov7670_vga_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI BVALID" *)
output wire ov7670_vga_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI BREADY" *)
input wire ov7670_vga_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI ARADDR" *)
input wire [3 : 0] ov7670_vga_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI ARPROT" *)
input wire [2 : 0] ov7670_vga_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI ARVALID" *)
input wire ov7670_vga_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI ARREADY" *)
output wire ov7670_vga_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI RDATA" *)
output wire [31 : 0] ov7670_vga_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI RRESP" *)
output wire [1 : 0] ov7670_vga_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI RVALID" *)
output wire ov7670_vga_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 OV7670_VGA_AXI RREADY" *)
input wire ov7670_vga_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 OV7670_VGA_AXI_CLK CLK" *)
input wire ov7670_vga_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 OV7670_VGA_AXI_RST RST" *)
input wire ov7670_vga_axi_aresetn;

  OV7670_VGA_v1_0 #(
    .C_OV7670_VGA_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_OV7670_VGA_AXI_ADDR_WIDTH(4)  // Width of S_AXI address bus
  ) inst (
    .OV7670_VSYNC(OV7670_VSYNC),
    .OV7670_HREF(OV7670_HREF),
    .OV7670_PCLK(OV7670_PCLK),
    .OV7670_XCLK(OV7670_XCLK),
    .OV7670_SIOC(OV7670_SIOC),
    .OV7670_SIOD(OV7670_SIOD),
    .OV7670_D(OV7670_D),
    .OV7670_PWDN(OV7670_PWDN),
    .OV7670_RESET(OV7670_RESET),
    .VGA_Red(VGA_Red),
    .VGA_Green(VGA_Green),
    .VGA_Blue(VGA_Blue),
    .VGA_HSYNC(VGA_HSYNC),
    .VGA_VSYNC(VGA_VSYNC),
    .VGA_MODE(VGA_MODE),
    .ov7670_vga_axi_awaddr(ov7670_vga_axi_awaddr),
    .ov7670_vga_axi_awprot(ov7670_vga_axi_awprot),
    .ov7670_vga_axi_awvalid(ov7670_vga_axi_awvalid),
    .ov7670_vga_axi_awready(ov7670_vga_axi_awready),
    .ov7670_vga_axi_wdata(ov7670_vga_axi_wdata),
    .ov7670_vga_axi_wstrb(ov7670_vga_axi_wstrb),
    .ov7670_vga_axi_wvalid(ov7670_vga_axi_wvalid),
    .ov7670_vga_axi_wready(ov7670_vga_axi_wready),
    .ov7670_vga_axi_bresp(ov7670_vga_axi_bresp),
    .ov7670_vga_axi_bvalid(ov7670_vga_axi_bvalid),
    .ov7670_vga_axi_bready(ov7670_vga_axi_bready),
    .ov7670_vga_axi_araddr(ov7670_vga_axi_araddr),
    .ov7670_vga_axi_arprot(ov7670_vga_axi_arprot),
    .ov7670_vga_axi_arvalid(ov7670_vga_axi_arvalid),
    .ov7670_vga_axi_arready(ov7670_vga_axi_arready),
    .ov7670_vga_axi_rdata(ov7670_vga_axi_rdata),
    .ov7670_vga_axi_rresp(ov7670_vga_axi_rresp),
    .ov7670_vga_axi_rvalid(ov7670_vga_axi_rvalid),
    .ov7670_vga_axi_rready(ov7670_vga_axi_rready),
    .ov7670_vga_axi_aclk(ov7670_vga_axi_aclk),
    .ov7670_vga_axi_aresetn(ov7670_vga_axi_aresetn)
  );
endmodule
