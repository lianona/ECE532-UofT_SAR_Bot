

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Temp_Sensor" "NUM_INSTANCES" "DEVICE_ID"  "C_Temp_Sensor_AXI_BASEADDR" "C_Temp_Sensor_AXI_HIGHADDR"
}
