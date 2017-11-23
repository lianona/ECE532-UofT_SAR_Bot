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


// IP VLNV: xilinx.com:user:XADC:1.0
// IP Revision: 4

(* X_CORE_INFO = "XADC_v1_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "Top_Level_Design_BD_XADC_0_1,XADC_v1_0,{}" *)
(* CORE_GENERATION_INFO = "Top_Level_Design_BD_XADC_0_1,XADC_v1_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=XADC,x_ipVersion=1.0,x_ipCoreRevision=4,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XADC_AXI_DATA_WIDTH=32,C_XADC_AXI_ADDR_WIDTH=4}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Top_Level_Design_BD_XADC_0_1 (
  vauxp2,
  vauxn2,
  vauxp3,
  vauxn3,
  vauxp10,
  vauxn10,
  vauxp11,
  vauxn11,
  vp_in,
  vn_in,
  xadc_axi_awaddr,
  xadc_axi_awprot,
  xadc_axi_awvalid,
  xadc_axi_awready,
  xadc_axi_wdata,
  xadc_axi_wstrb,
  xadc_axi_wvalid,
  xadc_axi_wready,
  xadc_axi_bresp,
  xadc_axi_bvalid,
  xadc_axi_bready,
  xadc_axi_araddr,
  xadc_axi_arprot,
  xadc_axi_arvalid,
  xadc_axi_arready,
  xadc_axi_rdata,
  xadc_axi_rresp,
  xadc_axi_rvalid,
  xadc_axi_rready,
  xadc_axi_aclk,
  xadc_axi_aresetn
);

input wire vauxp2;
input wire vauxn2;
input wire vauxp3;
input wire vauxn3;
input wire vauxp10;
input wire vauxn10;
input wire vauxp11;
input wire vauxn11;
input wire vp_in;
input wire vn_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI AWADDR" *)
input wire [3 : 0] xadc_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI AWPROT" *)
input wire [2 : 0] xadc_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI AWVALID" *)
input wire xadc_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI AWREADY" *)
output wire xadc_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI WDATA" *)
input wire [31 : 0] xadc_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI WSTRB" *)
input wire [3 : 0] xadc_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI WVALID" *)
input wire xadc_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI WREADY" *)
output wire xadc_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI BRESP" *)
output wire [1 : 0] xadc_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI BVALID" *)
output wire xadc_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI BREADY" *)
input wire xadc_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI ARADDR" *)
input wire [3 : 0] xadc_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI ARPROT" *)
input wire [2 : 0] xadc_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI ARVALID" *)
input wire xadc_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI ARREADY" *)
output wire xadc_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI RDATA" *)
output wire [31 : 0] xadc_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI RRESP" *)
output wire [1 : 0] xadc_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI RVALID" *)
output wire xadc_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XADC_AXI RREADY" *)
input wire xadc_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 XADC_AXI_CLK CLK" *)
input wire xadc_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 XADC_AXI_RST RST" *)
input wire xadc_axi_aresetn;

  XADC_v1_0 #(
    .C_XADC_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_XADC_AXI_ADDR_WIDTH(4)  // Width of S_AXI address bus
  ) inst (
    .vauxp2(vauxp2),
    .vauxn2(vauxn2),
    .vauxp3(vauxp3),
    .vauxn3(vauxn3),
    .vauxp10(vauxp10),
    .vauxn10(vauxn10),
    .vauxp11(vauxp11),
    .vauxn11(vauxn11),
    .vp_in(vp_in),
    .vn_in(vn_in),
    .xadc_axi_awaddr(xadc_axi_awaddr),
    .xadc_axi_awprot(xadc_axi_awprot),
    .xadc_axi_awvalid(xadc_axi_awvalid),
    .xadc_axi_awready(xadc_axi_awready),
    .xadc_axi_wdata(xadc_axi_wdata),
    .xadc_axi_wstrb(xadc_axi_wstrb),
    .xadc_axi_wvalid(xadc_axi_wvalid),
    .xadc_axi_wready(xadc_axi_wready),
    .xadc_axi_bresp(xadc_axi_bresp),
    .xadc_axi_bvalid(xadc_axi_bvalid),
    .xadc_axi_bready(xadc_axi_bready),
    .xadc_axi_araddr(xadc_axi_araddr),
    .xadc_axi_arprot(xadc_axi_arprot),
    .xadc_axi_arvalid(xadc_axi_arvalid),
    .xadc_axi_arready(xadc_axi_arready),
    .xadc_axi_rdata(xadc_axi_rdata),
    .xadc_axi_rresp(xadc_axi_rresp),
    .xadc_axi_rvalid(xadc_axi_rvalid),
    .xadc_axi_rready(xadc_axi_rready),
    .xadc_axi_aclk(xadc_axi_aclk),
    .xadc_axi_aresetn(xadc_axi_aresetn)
  );
endmodule
