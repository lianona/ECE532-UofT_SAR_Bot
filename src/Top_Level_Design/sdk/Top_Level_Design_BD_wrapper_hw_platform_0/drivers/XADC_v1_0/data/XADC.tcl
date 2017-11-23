

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "XADC" "NUM_INSTANCES" "DEVICE_ID"  "C_XADC_AXI_BASEADDR" "C_XADC_AXI_HIGHADDR"
}
