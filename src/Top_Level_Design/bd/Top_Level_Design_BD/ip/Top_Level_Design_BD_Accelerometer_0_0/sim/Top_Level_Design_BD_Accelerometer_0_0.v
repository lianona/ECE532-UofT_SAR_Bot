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


// IP VLNV: xilinx.com:user:Accelerometer:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module Top_Level_Design_BD_Accelerometer_0_0 (
  sclk,
  mosi,
  miso,
  ss,
  accelerometer_axi_awaddr,
  accelerometer_axi_awprot,
  accelerometer_axi_awvalid,
  accelerometer_axi_awready,
  accelerometer_axi_wdata,
  accelerometer_axi_wstrb,
  accelerometer_axi_wvalid,
  accelerometer_axi_wready,
  accelerometer_axi_bresp,
  accelerometer_axi_bvalid,
  accelerometer_axi_bready,
  accelerometer_axi_araddr,
  accelerometer_axi_arprot,
  accelerometer_axi_arvalid,
  accelerometer_axi_arready,
  accelerometer_axi_rdata,
  accelerometer_axi_rresp,
  accelerometer_axi_rvalid,
  accelerometer_axi_rready,
  accelerometer_axi_aclk,
  accelerometer_axi_aresetn
);

output wire sclk;
output wire mosi;
input wire miso;
output wire ss;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI AWADDR" *)
input wire [3 : 0] accelerometer_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI AWPROT" *)
input wire [2 : 0] accelerometer_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI AWVALID" *)
input wire accelerometer_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI AWREADY" *)
output wire accelerometer_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI WDATA" *)
input wire [31 : 0] accelerometer_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI WSTRB" *)
input wire [3 : 0] accelerometer_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI WVALID" *)
input wire accelerometer_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI WREADY" *)
output wire accelerometer_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI BRESP" *)
output wire [1 : 0] accelerometer_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI BVALID" *)
output wire accelerometer_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI BREADY" *)
input wire accelerometer_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI ARADDR" *)
input wire [3 : 0] accelerometer_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI ARPROT" *)
input wire [2 : 0] accelerometer_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI ARVALID" *)
input wire accelerometer_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI ARREADY" *)
output wire accelerometer_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI RDATA" *)
output wire [31 : 0] accelerometer_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI RRESP" *)
output wire [1 : 0] accelerometer_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI RVALID" *)
output wire accelerometer_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Accelerometer_AXI RREADY" *)
input wire accelerometer_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 Accelerometer_AXI_CLK CLK" *)
input wire accelerometer_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 Accelerometer_AXI_RST RST" *)
input wire accelerometer_axi_aresetn;

  Accelerometer_v1_0 #(
    .C_Accelerometer_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_Accelerometer_AXI_ADDR_WIDTH(4)  // Width of S_AXI address bus
  ) inst (
    .sclk(sclk),
    .mosi(mosi),
    .miso(miso),
    .ss(ss),
    .accelerometer_axi_awaddr(accelerometer_axi_awaddr),
    .accelerometer_axi_awprot(accelerometer_axi_awprot),
    .accelerometer_axi_awvalid(accelerometer_axi_awvalid),
    .accelerometer_axi_awready(accelerometer_axi_awready),
    .accelerometer_axi_wdata(accelerometer_axi_wdata),
    .accelerometer_axi_wstrb(accelerometer_axi_wstrb),
    .accelerometer_axi_wvalid(accelerometer_axi_wvalid),
    .accelerometer_axi_wready(accelerometer_axi_wready),
    .accelerometer_axi_bresp(accelerometer_axi_bresp),
    .accelerometer_axi_bvalid(accelerometer_axi_bvalid),
    .accelerometer_axi_bready(accelerometer_axi_bready),
    .accelerometer_axi_araddr(accelerometer_axi_araddr),
    .accelerometer_axi_arprot(accelerometer_axi_arprot),
    .accelerometer_axi_arvalid(accelerometer_axi_arvalid),
    .accelerometer_axi_arready(accelerometer_axi_arready),
    .accelerometer_axi_rdata(accelerometer_axi_rdata),
    .accelerometer_axi_rresp(accelerometer_axi_rresp),
    .accelerometer_axi_rvalid(accelerometer_axi_rvalid),
    .accelerometer_axi_rready(accelerometer_axi_rready),
    .accelerometer_axi_aclk(accelerometer_axi_aclk),
    .accelerometer_axi_aresetn(accelerometer_axi_aresetn)
  );
endmodule
