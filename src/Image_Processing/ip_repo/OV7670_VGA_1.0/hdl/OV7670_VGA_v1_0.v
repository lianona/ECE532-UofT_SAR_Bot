
`timescale 1 ns / 1 ps

	module OV7670_VGA_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface OV7670_VGA_AXI
		parameter integer C_OV7670_VGA_AXI_DATA_WIDTH	= 32,
		parameter integer C_OV7670_VGA_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		input wire         OV7670_VSYNC,
		input wire         OV7670_HREF ,
		input wire         OV7670_PCLK ,
		output wire         OV7670_XCLK ,
		output wire         OV7670_SIOC ,
		inout wire         OV7670_SIOD ,
		input wire [7 : 0] OV7670_D    ,
		output wire         OV7670_PWDN ,
		output wire         OV7670_RESET,
		
		output wire [3 : 0] VGA_Red  ,
		output wire [3 : 0] VGA_Green,
		output wire [3 : 0] VGA_Blue ,
		output wire         VGA_HSYNC,
		output wire         VGA_VSYNC,
		input wire         VGA_MODE,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface OV7670_VGA_AXI
		input wire  ov7670_vga_axi_aclk,
		input wire  ov7670_vga_axi_aresetn,
		input wire [C_OV7670_VGA_AXI_ADDR_WIDTH-1 : 0] ov7670_vga_axi_awaddr,
		input wire [2 : 0] ov7670_vga_axi_awprot,
		input wire  ov7670_vga_axi_awvalid,
		output wire  ov7670_vga_axi_awready,
		input wire [C_OV7670_VGA_AXI_DATA_WIDTH-1 : 0] ov7670_vga_axi_wdata,
		input wire [(C_OV7670_VGA_AXI_DATA_WIDTH/8)-1 : 0] ov7670_vga_axi_wstrb,
		input wire  ov7670_vga_axi_wvalid,
		output wire  ov7670_vga_axi_wready,
		output wire [1 : 0] ov7670_vga_axi_bresp,
		output wire  ov7670_vga_axi_bvalid,
		input wire  ov7670_vga_axi_bready,
		input wire [C_OV7670_VGA_AXI_ADDR_WIDTH-1 : 0] ov7670_vga_axi_araddr,
		input wire [2 : 0] ov7670_vga_axi_arprot,
		input wire  ov7670_vga_axi_arvalid,
		output wire  ov7670_vga_axi_arready,
		output wire [C_OV7670_VGA_AXI_DATA_WIDTH-1 : 0] ov7670_vga_axi_rdata,
		output wire [1 : 0] ov7670_vga_axi_rresp,
		output wire  ov7670_vga_axi_rvalid,
		input wire  ov7670_vga_axi_rready
	);
// Instantiation of Axi Bus Interface OV7670_VGA_AXI
	OV7670_VGA_v1_0_OV7670_VGA_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_OV7670_VGA_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_OV7670_VGA_AXI_ADDR_WIDTH)
	) OV7670_VGA_v1_0_OV7670_VGA_AXI_inst (
		.OV7670_VSYNC(OV7670_VSYNC),
		.OV7670_HREF (OV7670_HREF),
		.OV7670_PCLK (OV7670_PCLK),
		.OV7670_XCLK (OV7670_XCLK),
		.OV7670_SIOC (OV7670_SIOC),
		.OV7670_SIOD (OV7670_SIOD),
		.OV7670_D    (OV7670_D),
		.OV7670_PWDN (OV7670_PWDN ),
		.OV7670_RESET(OV7670_RESET),
		
		.VGA_Red  (VGA_Red),
		.VGA_Green(VGA_Green),
		.VGA_Blue (VGA_Blue),
		.VGA_HSYNC(VGA_HSYNC),
		.VGA_VSYNC(VGA_VSYNC),
		.VGA_MODE(VGA_MODE),
		.S_AXI_ACLK(ov7670_vga_axi_aclk),
		.S_AXI_ARESETN(ov7670_vga_axi_aresetn),
		.S_AXI_AWADDR(ov7670_vga_axi_awaddr),
		.S_AXI_AWPROT(ov7670_vga_axi_awprot),
		.S_AXI_AWVALID(ov7670_vga_axi_awvalid),
		.S_AXI_AWREADY(ov7670_vga_axi_awready),
		.S_AXI_WDATA(ov7670_vga_axi_wdata),
		.S_AXI_WSTRB(ov7670_vga_axi_wstrb),
		.S_AXI_WVALID(ov7670_vga_axi_wvalid),
		.S_AXI_WREADY(ov7670_vga_axi_wready),
		.S_AXI_BRESP(ov7670_vga_axi_bresp),
		.S_AXI_BVALID(ov7670_vga_axi_bvalid),
		.S_AXI_BREADY(ov7670_vga_axi_bready),
		.S_AXI_ARADDR(ov7670_vga_axi_araddr),
		.S_AXI_ARPROT(ov7670_vga_axi_arprot),
		.S_AXI_ARVALID(ov7670_vga_axi_arvalid),
		.S_AXI_ARREADY(ov7670_vga_axi_arready),
		.S_AXI_RDATA(ov7670_vga_axi_rdata),
		.S_AXI_RRESP(ov7670_vga_axi_rresp),
		.S_AXI_RVALID(ov7670_vga_axi_rvalid),
		.S_AXI_RREADY(ov7670_vga_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
