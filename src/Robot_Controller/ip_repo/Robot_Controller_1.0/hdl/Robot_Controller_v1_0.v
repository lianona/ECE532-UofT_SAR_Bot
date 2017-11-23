
`timescale 1 ns / 1 ps

	module Robot_Controller_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface Robot_Controller_AXI
		parameter integer C_Robot_Controller_AXI_DATA_WIDTH	= 32,
		parameter integer C_Robot_Controller_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here
		output wire [1 : 0] robot_wheel_driver_1,
		output wire [1 : 0] robot_wheel_driver_2,
		output wire [1 : 0] robot_wheel_driver_3,
		output wire [1 : 0] robot_wheel_driver_4,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface Robot_Controller_AXI
		input wire  robot_controller_axi_aclk,
		input wire  robot_controller_axi_aresetn,
		input wire [C_Robot_Controller_AXI_ADDR_WIDTH-1 : 0] robot_controller_axi_awaddr,
		input wire [2 : 0] robot_controller_axi_awprot,
		input wire  robot_controller_axi_awvalid,
		output wire  robot_controller_axi_awready,
		input wire [C_Robot_Controller_AXI_DATA_WIDTH-1 : 0] robot_controller_axi_wdata,
		input wire [(C_Robot_Controller_AXI_DATA_WIDTH/8)-1 : 0] robot_controller_axi_wstrb,
		input wire  robot_controller_axi_wvalid,
		output wire  robot_controller_axi_wready,
		output wire [1 : 0] robot_controller_axi_bresp,
		output wire  robot_controller_axi_bvalid,
		input wire  robot_controller_axi_bready,
		input wire [C_Robot_Controller_AXI_ADDR_WIDTH-1 : 0] robot_controller_axi_araddr,
		input wire [2 : 0] robot_controller_axi_arprot,
		input wire  robot_controller_axi_arvalid,
		output wire  robot_controller_axi_arready,
		output wire [C_Robot_Controller_AXI_DATA_WIDTH-1 : 0] robot_controller_axi_rdata,
		output wire [1 : 0] robot_controller_axi_rresp,
		output wire  robot_controller_axi_rvalid,
		input wire  robot_controller_axi_rready
	);
// Instantiation of Axi Bus Interface Robot_Controller_AXI
	Robot_Controller_v1_0_Robot_Controller_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_Robot_Controller_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Robot_Controller_AXI_ADDR_WIDTH)
	) Robot_Controller_v1_0_Robot_Controller_AXI_inst (
		.robot_wheel_driver_1(robot_wheel_driver_1),
		.robot_wheel_driver_2(robot_wheel_driver_2),
		.robot_wheel_driver_3(robot_wheel_driver_3),
		.robot_wheel_driver_4(robot_wheel_driver_4),
		.S_AXI_ACLK(robot_controller_axi_aclk),
		.S_AXI_ARESETN(robot_controller_axi_aresetn),
		.S_AXI_AWADDR(robot_controller_axi_awaddr),
		.S_AXI_AWPROT(robot_controller_axi_awprot),
		.S_AXI_AWVALID(robot_controller_axi_awvalid),
		.S_AXI_AWREADY(robot_controller_axi_awready),
		.S_AXI_WDATA(robot_controller_axi_wdata),
		.S_AXI_WSTRB(robot_controller_axi_wstrb),
		.S_AXI_WVALID(robot_controller_axi_wvalid),
		.S_AXI_WREADY(robot_controller_axi_wready),
		.S_AXI_BRESP(robot_controller_axi_bresp),
		.S_AXI_BVALID(robot_controller_axi_bvalid),
		.S_AXI_BREADY(robot_controller_axi_bready),
		.S_AXI_ARADDR(robot_controller_axi_araddr),
		.S_AXI_ARPROT(robot_controller_axi_arprot),
		.S_AXI_ARVALID(robot_controller_axi_arvalid),
		.S_AXI_ARREADY(robot_controller_axi_arready),
		.S_AXI_RDATA(robot_controller_axi_rdata),
		.S_AXI_RRESP(robot_controller_axi_rresp),
		.S_AXI_RVALID(robot_controller_axi_rvalid),
		.S_AXI_RREADY(robot_controller_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
