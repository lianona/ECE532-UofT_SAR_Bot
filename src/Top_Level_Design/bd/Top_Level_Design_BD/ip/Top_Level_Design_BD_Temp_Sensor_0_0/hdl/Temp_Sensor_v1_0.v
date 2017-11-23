
`timescale 1 ns / 1 ps

	module Temp_Sensor_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface Temp_Sensor_AXI
		parameter integer C_Temp_Sensor_AXI_DATA_WIDTH	= 32,
		parameter integer C_Temp_Sensor_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		inout wire TMP_SCL,
		inout wire TMP_SDA,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface Temp_Sensor_AXI
		input wire  temp_sensor_axi_aclk,
		input wire  temp_sensor_axi_aresetn,
		input wire [C_Temp_Sensor_AXI_ADDR_WIDTH-1 : 0] temp_sensor_axi_awaddr,
		input wire [2 : 0] temp_sensor_axi_awprot,
		input wire  temp_sensor_axi_awvalid,
		output wire  temp_sensor_axi_awready,
		input wire [C_Temp_Sensor_AXI_DATA_WIDTH-1 : 0] temp_sensor_axi_wdata,
		input wire [(C_Temp_Sensor_AXI_DATA_WIDTH/8)-1 : 0] temp_sensor_axi_wstrb,
		input wire  temp_sensor_axi_wvalid,
		output wire  temp_sensor_axi_wready,
		output wire [1 : 0] temp_sensor_axi_bresp,
		output wire  temp_sensor_axi_bvalid,
		input wire  temp_sensor_axi_bready,
		input wire [C_Temp_Sensor_AXI_ADDR_WIDTH-1 : 0] temp_sensor_axi_araddr,
		input wire [2 : 0] temp_sensor_axi_arprot,
		input wire  temp_sensor_axi_arvalid,
		output wire  temp_sensor_axi_arready,
		output wire [C_Temp_Sensor_AXI_DATA_WIDTH-1 : 0] temp_sensor_axi_rdata,
		output wire [1 : 0] temp_sensor_axi_rresp,
		output wire  temp_sensor_axi_rvalid,
		input wire  temp_sensor_axi_rready
	);
// Instantiation of Axi Bus Interface Temp_Sensor_AXI
	Temp_Sensor_v1_0_Temp_Sensor_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_Temp_Sensor_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Temp_Sensor_AXI_ADDR_WIDTH)
	) Temp_Sensor_v1_0_Temp_Sensor_AXI_inst (
		.TMP_SCL(TMP_SCL),
		.TMP_SDA(TMP_SDA),
		.S_AXI_ACLK(temp_sensor_axi_aclk),
		.S_AXI_ARESETN(temp_sensor_axi_aresetn),
		.S_AXI_AWADDR(temp_sensor_axi_awaddr),
		.S_AXI_AWPROT(temp_sensor_axi_awprot),
		.S_AXI_AWVALID(temp_sensor_axi_awvalid),
		.S_AXI_AWREADY(temp_sensor_axi_awready),
		.S_AXI_WDATA(temp_sensor_axi_wdata),
		.S_AXI_WSTRB(temp_sensor_axi_wstrb),
		.S_AXI_WVALID(temp_sensor_axi_wvalid),
		.S_AXI_WREADY(temp_sensor_axi_wready),
		.S_AXI_BRESP(temp_sensor_axi_bresp),
		.S_AXI_BVALID(temp_sensor_axi_bvalid),
		.S_AXI_BREADY(temp_sensor_axi_bready),
		.S_AXI_ARADDR(temp_sensor_axi_araddr),
		.S_AXI_ARPROT(temp_sensor_axi_arprot),
		.S_AXI_ARVALID(temp_sensor_axi_arvalid),
		.S_AXI_ARREADY(temp_sensor_axi_arready),
		.S_AXI_RDATA(temp_sensor_axi_rdata),
		.S_AXI_RRESP(temp_sensor_axi_rresp),
		.S_AXI_RVALID(temp_sensor_axi_rvalid),
		.S_AXI_RREADY(temp_sensor_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
