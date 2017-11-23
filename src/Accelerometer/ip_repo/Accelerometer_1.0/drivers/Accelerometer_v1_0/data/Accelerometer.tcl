

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Accelerometer" "NUM_INSTANCES" "DEVICE_ID"  "C_Accelerometer_AXI_BASEADDR" "C_Accelerometer_AXI_HIGHADDR"
}
