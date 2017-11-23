
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = standalone
 PARAMETER OS_VER = 5.5
 PARAMETER PROC_INSTANCE = microblaze_0
 PARAMETER stdin = axi_uartlite_0
 PARAMETER stdout = axi_uartlite_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 2.5
 PARAMETER HW_INSTANCE = microblaze_0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = Accelerometer
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = Accelerometer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = OV7670_VGA
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = OV7670_VGA_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = Robot_Controller
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = Robot_Controller_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = Temp_Sensor
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = Temp_Sensor_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = XADC
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = XADC_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 3.2
 PARAMETER HW_INSTANCE = axi_uartlite_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 3.2
 PARAMETER HW_INSTANCE = axi_uartlite_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = intc
 PARAMETER DRIVER_VER = 3.5
 PARAMETER HW_INSTANCE = microblaze_0_axi_intc
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.1
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_dlmb_bram_if_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.1
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_ilmb_bram_if_cntlr
END


