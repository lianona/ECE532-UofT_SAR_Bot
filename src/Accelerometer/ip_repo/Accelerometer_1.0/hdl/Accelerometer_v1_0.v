
`timescale 1 ns / 1 ps

	module Accelerometer_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface Accelerometer_AXI
		parameter integer C_Accelerometer_AXI_DATA_WIDTH	= 32,
		parameter integer C_Accelerometer_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		output wire sclk,
		output wire mosi,
		 input wire miso,
		output wire ss,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface Accelerometer_AXI
		input wire  accelerometer_axi_aclk,
		input wire  accelerometer_axi_aresetn,
		input wire [C_Accelerometer_AXI_ADDR_WIDTH-1 : 0] accelerometer_axi_awaddr,
		input wire [2 : 0] accelerometer_axi_awprot,
		input wire  accelerometer_axi_awvalid,
		output wire  accelerometer_axi_awready,
		input wire [C_Accelerometer_AXI_DATA_WIDTH-1 : 0] accelerometer_axi_wdata,
		input wire [(C_Accelerometer_AXI_DATA_WIDTH/8)-1 : 0] accelerometer_axi_wstrb,
		input wire  accelerometer_axi_wvalid,
		output wire  accelerometer_axi_wready,
		output wire [1 : 0] accelerometer_axi_bresp,
		output wire  accelerometer_axi_bvalid,
		input wire  accelerometer_axi_bready,
		input wire [C_Accelerometer_AXI_ADDR_WIDTH-1 : 0] accelerometer_axi_araddr,
		input wire [2 : 0] accelerometer_axi_arprot,
		input wire  accelerometer_axi_arvalid,
		output wire  accelerometer_axi_arready,
		output wire [C_Accelerometer_AXI_DATA_WIDTH-1 : 0] accelerometer_axi_rdata,
		output wire [1 : 0] accelerometer_axi_rresp,
		output wire  accelerometer_axi_rvalid,
		input wire  accelerometer_axi_rready
	);
// Instantiation of Axi Bus Interface Accelerometer_AXI
	Accelerometer_v1_0_Accelerometer_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_Accelerometer_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Accelerometer_AXI_ADDR_WIDTH)
	) Accelerometer_v1_0_Accelerometer_AXI_inst (
		.sclk(sclk),
		.mosi(mosi),
		.miso(miso),
		.ss(ss),
		.S_AXI_ACLK(accelerometer_axi_aclk),
		.S_AXI_ARESETN(accelerometer_axi_aresetn),
		.S_AXI_AWADDR(accelerometer_axi_awaddr),
		.S_AXI_AWPROT(accelerometer_axi_awprot),
		.S_AXI_AWVALID(accelerometer_axi_awvalid),
		.S_AXI_AWREADY(accelerometer_axi_awready),
		.S_AXI_WDATA(accelerometer_axi_wdata),
		.S_AXI_WSTRB(accelerometer_axi_wstrb),
		.S_AXI_WVALID(accelerometer_axi_wvalid),
		.S_AXI_WREADY(accelerometer_axi_wready),
		.S_AXI_BRESP(accelerometer_axi_bresp),
		.S_AXI_BVALID(accelerometer_axi_bvalid),
		.S_AXI_BREADY(accelerometer_axi_bready),
		.S_AXI_ARADDR(accelerometer_axi_araddr),
		.S_AXI_ARPROT(accelerometer_axi_arprot),
		.S_AXI_ARVALID(accelerometer_axi_arvalid),
		.S_AXI_ARREADY(accelerometer_axi_arready),
		.S_AXI_RDATA(accelerometer_axi_rdata),
		.S_AXI_RRESP(accelerometer_axi_rresp),
		.S_AXI_RVALID(accelerometer_axi_rvalid),
		.S_AXI_RREADY(accelerometer_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
