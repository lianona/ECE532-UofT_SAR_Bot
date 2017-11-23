
# Clock

set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clock_rtl]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clock_rtl]

# Resets

# set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { BTNC }]; #IO_L9P_T1_DQS_14 Sch=btnc
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports reset_rtl]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports reset_rtl_0]

# Temperature Sensor
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports TMP_SCL]
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports TMP_SDA]

# Accelerometer
set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS33} [get_ports miso]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports mosi]
set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports sclk]
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS33} [get_ports ss]

# UART

set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports uart_rtl_rxd]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports uart_rtl_txd]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports uart_rtl_0_rxd]
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports uart_rtl_0_txd]

# Pmod Header JA

set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports OV7670_RESET]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[1]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[3]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[5]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports OV7670_PWDN]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[0]}]
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[2]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[4]}]


##Pmod Header JB

set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[7]}]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports OV7670_PCLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK]

set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports OV7670_VSYNC]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports OV7670_SIOC]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[6]}]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports OV7670_XCLK]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports OV7670_HREF]
set_property PACKAGE_PIN H16 [get_ports OV7670_SIOD]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_SIOD]
set_property PULLUP true [get_ports OV7670_SIOD]


##VGA Connector

set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {VGA_Red[0]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {VGA_Red[1]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {VGA_Red[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {VGA_Red[3]}]

set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {VGA_Green[0]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {VGA_Green[1]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {VGA_Green[2]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {VGA_Green[3]}]

set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {VGA_Blue[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {VGA_Blue[1]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {VGA_Blue[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {VGA_Blue[3]}]

set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports VGA_HSYNC]
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports VGA_VSYNC]

set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports VGA_MODE]

# GPIO pins

set_property -dict { PACKAGE_PIN H4   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_1[0] }]; 
set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_1[1] }]; 
set_property -dict { PACKAGE_PIN G1   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_2[0] }]; 
set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_2[1] }]; 
set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_3[0] }]; 
set_property -dict { PACKAGE_PIN G4   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_3[1] }]; 
set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_4[0] }]; 
set_property -dict { PACKAGE_PIN F3   IOSTANDARD LVCMOS33 } [get_ports { robot_wheel_driver_4[1] }]; 

# XADC

set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33     } [get_ports { vauxn3 }]; #IO_L9N_T1_DQS_AD3N_15 Sch=xa_n[1]
set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33     } [get_ports { vauxp3 }]; #IO_L9P_T1_DQS_AD3P_15 Sch=xa_p[1]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33     } [get_ports { vauxn10}]; #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33     } [get_ports { vauxp10 }]; #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33     } [get_ports { vauxn2 }]; #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33     } [get_ports { vauxp2 }]; #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33     } [get_ports { vauxn11 }]; #IO_L10N_T1_AD11N_15 Sch=xa_n[4]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33     } [get_ports { vauxp11 }]; #IO_L10P_T1_AD11P_15 Sch=xa_p[4]
