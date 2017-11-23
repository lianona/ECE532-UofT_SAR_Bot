

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Robot_Controller" "NUM_INSTANCES" "DEVICE_ID"  "C_Robot_Controller_AXI_BASEADDR" "C_Robot_Controller_AXI_HIGHADDR"
}
