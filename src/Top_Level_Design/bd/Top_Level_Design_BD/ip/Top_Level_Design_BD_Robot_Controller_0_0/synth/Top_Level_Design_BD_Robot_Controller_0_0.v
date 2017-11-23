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


// IP VLNV: xilinx.com:user:Robot_Controller:1.0
// IP Revision: 2

(* X_CORE_INFO = "Robot_Controller_v1_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "Top_Level_Design_BD_Robot_Controller_0_0,Robot_Controller_v1_0,{}" *)
(* CORE_GENERATION_INFO = "Top_Level_Design_BD_Robot_Controller_0_0,Robot_Controller_v1_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=Robot_Controller,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_Robot_Controller_AXI_DATA_WIDTH=32,C_Robot_Controller_AXI_ADDR_WIDTH=5}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Top_Level_Design_BD_Robot_Controller_0_0 (
  robot_wheel_driver_1,
  robot_wheel_driver_2,
  robot_wheel_driver_3,
  robot_wheel_driver_4,
  robot_controller_axi_awaddr,
  robot_controller_axi_awprot,
  robot_controller_axi_awvalid,
  robot_controller_axi_awready,
  robot_controller_axi_wdata,
  robot_controller_axi_wstrb,
  robot_controller_axi_wvalid,
  robot_controller_axi_wready,
  robot_controller_axi_bresp,
  robot_controller_axi_bvalid,
  robot_controller_axi_bready,
  robot_controller_axi_araddr,
  robot_controller_axi_arprot,
  robot_controller_axi_arvalid,
  robot_controller_axi_arready,
  robot_controller_axi_rdata,
  robot_controller_axi_rresp,
  robot_controller_axi_rvalid,
  robot_controller_axi_rready,
  robot_controller_axi_aclk,
  robot_controller_axi_aresetn
);

output wire [1 : 0] robot_wheel_driver_1;
output wire [1 : 0] robot_wheel_driver_2;
output wire [1 : 0] robot_wheel_driver_3;
output wire [1 : 0] robot_wheel_driver_4;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI AWADDR" *)
input wire [4 : 0] robot_controller_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI AWPROT" *)
input wire [2 : 0] robot_controller_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI AWVALID" *)
input wire robot_controller_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI AWREADY" *)
output wire robot_controller_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI WDATA" *)
input wire [31 : 0] robot_controller_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI WSTRB" *)
input wire [3 : 0] robot_controller_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI WVALID" *)
input wire robot_controller_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI WREADY" *)
output wire robot_controller_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI BRESP" *)
output wire [1 : 0] robot_controller_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI BVALID" *)
output wire robot_controller_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI BREADY" *)
input wire robot_controller_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI ARADDR" *)
input wire [4 : 0] robot_controller_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI ARPROT" *)
input wire [2 : 0] robot_controller_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI ARVALID" *)
input wire robot_controller_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI ARREADY" *)
output wire robot_controller_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI RDATA" *)
output wire [31 : 0] robot_controller_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI RRESP" *)
output wire [1 : 0] robot_controller_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI RVALID" *)
output wire robot_controller_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Robot_Controller_AXI RREADY" *)
input wire robot_controller_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 Robot_Controller_AXI_CLK CLK" *)
input wire robot_controller_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 Robot_Controller_AXI_RST RST" *)
input wire robot_controller_axi_aresetn;

  Robot_Controller_v1_0 #(
    .C_Robot_Controller_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_Robot_Controller_AXI_ADDR_WIDTH(5)  // Width of S_AXI address bus
  ) inst (
    .robot_wheel_driver_1(robot_wheel_driver_1),
    .robot_wheel_driver_2(robot_wheel_driver_2),
    .robot_wheel_driver_3(robot_wheel_driver_3),
    .robot_wheel_driver_4(robot_wheel_driver_4),
    .robot_controller_axi_awaddr(robot_controller_axi_awaddr),
    .robot_controller_axi_awprot(robot_controller_axi_awprot),
    .robot_controller_axi_awvalid(robot_controller_axi_awvalid),
    .robot_controller_axi_awready(robot_controller_axi_awready),
    .robot_controller_axi_wdata(robot_controller_axi_wdata),
    .robot_controller_axi_wstrb(robot_controller_axi_wstrb),
    .robot_controller_axi_wvalid(robot_controller_axi_wvalid),
    .robot_controller_axi_wready(robot_controller_axi_wready),
    .robot_controller_axi_bresp(robot_controller_axi_bresp),
    .robot_controller_axi_bvalid(robot_controller_axi_bvalid),
    .robot_controller_axi_bready(robot_controller_axi_bready),
    .robot_controller_axi_araddr(robot_controller_axi_araddr),
    .robot_controller_axi_arprot(robot_controller_axi_arprot),
    .robot_controller_axi_arvalid(robot_controller_axi_arvalid),
    .robot_controller_axi_arready(robot_controller_axi_arready),
    .robot_controller_axi_rdata(robot_controller_axi_rdata),
    .robot_controller_axi_rresp(robot_controller_axi_rresp),
    .robot_controller_axi_rvalid(robot_controller_axi_rvalid),
    .robot_controller_axi_rready(robot_controller_axi_rready),
    .robot_controller_axi_aclk(robot_controller_axi_aclk),
    .robot_controller_axi_aresetn(robot_controller_axi_aresetn)
  );
endmodule
