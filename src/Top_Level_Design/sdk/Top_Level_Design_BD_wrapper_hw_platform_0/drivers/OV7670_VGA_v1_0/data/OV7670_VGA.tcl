

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "OV7670_VGA" "NUM_INSTANCES" "DEVICE_ID"  "C_OV7670_VGA_AXI_BASEADDR" "C_OV7670_VGA_AXI_HIGHADDR"
}
