
`timescale 1 ns / 1 ps

	module XADC_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface XADC_AXI
		parameter integer C_XADC_AXI_DATA_WIDTH	= 32,
		parameter integer C_XADC_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		input wire vauxp2,
		input wire vauxn2,
		input wire vauxp3,
		input wire vauxn3,
		input wire vauxp10,
		input wire vauxn10,
		input wire vauxp11,
		input wire vauxn11,
		input wire vp_in,
		input wire vn_in,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface XADC_AXI
		input wire  xadc_axi_aclk,
		input wire  xadc_axi_aresetn,
		input wire [C_XADC_AXI_ADDR_WIDTH-1 : 0] xadc_axi_awaddr,
		input wire [2 : 0] xadc_axi_awprot,
		input wire  xadc_axi_awvalid,
		output wire  xadc_axi_awready,
		input wire [C_XADC_AXI_DATA_WIDTH-1 : 0] xadc_axi_wdata,
		input wire [(C_XADC_AXI_DATA_WIDTH/8)-1 : 0] xadc_axi_wstrb,
		input wire  xadc_axi_wvalid,
		output wire  xadc_axi_wready,
		output wire [1 : 0] xadc_axi_bresp,
		output wire  xadc_axi_bvalid,
		input wire  xadc_axi_bready,
		input wire [C_XADC_AXI_ADDR_WIDTH-1 : 0] xadc_axi_araddr,
		input wire [2 : 0] xadc_axi_arprot,
		input wire  xadc_axi_arvalid,
		output wire  xadc_axi_arready,
		output wire [C_XADC_AXI_DATA_WIDTH-1 : 0] xadc_axi_rdata,
		output wire [1 : 0] xadc_axi_rresp,
		output wire  xadc_axi_rvalid,
		input wire  xadc_axi_rready
	);
// Instantiation of Axi Bus Interface XADC_AXI
	XADC_v1_0_XADC_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_XADC_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_XADC_AXI_ADDR_WIDTH)
	) XADC_v1_0_XADC_AXI_inst (
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
		// .sw(sw),
		.LED(),
		.an(),
		.dp(),
		.seg(),
		.S_AXI_ACLK(xadc_axi_aclk),
		.S_AXI_ARESETN(xadc_axi_aresetn),
		.S_AXI_AWADDR(xadc_axi_awaddr),
		.S_AXI_AWPROT(xadc_axi_awprot),
		.S_AXI_AWVALID(xadc_axi_awvalid),
		.S_AXI_AWREADY(xadc_axi_awready),
		.S_AXI_WDATA(xadc_axi_wdata),
		.S_AXI_WSTRB(xadc_axi_wstrb),
		.S_AXI_WVALID(xadc_axi_wvalid),
		.S_AXI_WREADY(xadc_axi_wready),
		.S_AXI_BRESP(xadc_axi_bresp),
		.S_AXI_BVALID(xadc_axi_bvalid),
		.S_AXI_BREADY(xadc_axi_bready),
		.S_AXI_ARADDR(xadc_axi_araddr),
		.S_AXI_ARPROT(xadc_axi_arprot),
		.S_AXI_ARVALID(xadc_axi_arvalid),
		.S_AXI_ARREADY(xadc_axi_arready),
		.S_AXI_RDATA(xadc_axi_rdata),
		.S_AXI_RRESP(xadc_axi_rresp),
		.S_AXI_RVALID(xadc_axi_rvalid),
		.S_AXI_RREADY(xadc_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
