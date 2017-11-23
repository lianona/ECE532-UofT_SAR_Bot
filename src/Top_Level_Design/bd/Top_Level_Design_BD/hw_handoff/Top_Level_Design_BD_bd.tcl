
################################################################
# This is a generated script based on design: Top_Level_Design_BD
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source Top_Level_Design_BD_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
set design_name Top_Level_Design_BD

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  set str_bd_folder E:/G9_UofTSARBot/src/Top_Level_Design/bd
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_msg_id "BD_TCL-110" "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_msg_id "BD_TCL-008" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_msg_id "BD_TCL-009" "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-111" "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-010" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-112" "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_msg_id "BD_TCL-113" "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-011" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_msg_id "BD_TCL-012" "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set uart_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart_rtl ]
  set uart_rtl_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart_rtl_0 ]

  # Create ports
  set OV7670_D [ create_bd_port -dir I -from 7 -to 0 OV7670_D ]
  set OV7670_HREF [ create_bd_port -dir I OV7670_HREF ]
  set OV7670_PCLK [ create_bd_port -dir I OV7670_PCLK ]
  set OV7670_PWDN [ create_bd_port -dir O OV7670_PWDN ]
  set OV7670_RESET [ create_bd_port -dir O OV7670_RESET ]
  set OV7670_SIOC [ create_bd_port -dir O OV7670_SIOC ]
  set OV7670_SIOD [ create_bd_port -dir IO OV7670_SIOD ]
  set OV7670_VSYNC [ create_bd_port -dir I OV7670_VSYNC ]
  set OV7670_XCLK [ create_bd_port -dir O OV7670_XCLK ]
  set TMP_SCL [ create_bd_port -dir IO TMP_SCL ]
  set TMP_SDA [ create_bd_port -dir IO TMP_SDA ]
  set VGA_Blue [ create_bd_port -dir O -from 3 -to 0 VGA_Blue ]
  set VGA_Green [ create_bd_port -dir O -from 3 -to 0 VGA_Green ]
  set VGA_HSYNC [ create_bd_port -dir O VGA_HSYNC ]
  set VGA_MODE [ create_bd_port -dir I VGA_MODE ]
  set VGA_Red [ create_bd_port -dir O -from 3 -to 0 VGA_Red ]
  set VGA_VSYNC [ create_bd_port -dir O VGA_VSYNC ]
  set clock_rtl [ create_bd_port -dir I -type clk clock_rtl ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $clock_rtl
  set miso [ create_bd_port -dir I miso ]
  set mosi [ create_bd_port -dir O mosi ]
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_rtl
  set reset_rtl_0 [ create_bd_port -dir I -type rst reset_rtl_0 ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_rtl_0
  set robot_wheel_driver_1 [ create_bd_port -dir O -from 1 -to 0 robot_wheel_driver_1 ]
  set robot_wheel_driver_2 [ create_bd_port -dir O -from 1 -to 0 robot_wheel_driver_2 ]
  set robot_wheel_driver_3 [ create_bd_port -dir O -from 1 -to 0 robot_wheel_driver_3 ]
  set robot_wheel_driver_4 [ create_bd_port -dir O -from 1 -to 0 robot_wheel_driver_4 ]
  set sclk [ create_bd_port -dir O sclk ]
  set ss [ create_bd_port -dir O ss ]
  set vauxn2 [ create_bd_port -dir I vauxn2 ]
  set vauxn3 [ create_bd_port -dir I vauxn3 ]
  set vauxn10 [ create_bd_port -dir I vauxn10 ]
  set vauxn11 [ create_bd_port -dir I vauxn11 ]
  set vauxp2 [ create_bd_port -dir I vauxp2 ]
  set vauxp3 [ create_bd_port -dir I vauxp3 ]
  set vauxp10 [ create_bd_port -dir I vauxp10 ]
  set vauxp11 [ create_bd_port -dir I vauxp11 ]
  set vn_in [ create_bd_port -dir I vn_in ]
  set vp_in [ create_bd_port -dir I vp_in ]

  # Create instance: Accelerometer_0, and set properties
  set Accelerometer_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:Accelerometer:1.0 Accelerometer_0 ]

  # Create instance: OV7670_VGA_0, and set properties
  set OV7670_VGA_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:OV7670_VGA:1.0 OV7670_VGA_0 ]

  # Create instance: Robot_Controller_0, and set properties
  set Robot_Controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:Robot_Controller:1.0 Robot_Controller_0 ]

  # Create instance: Temp_Sensor_0, and set properties
  set Temp_Sensor_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:Temp_Sensor:1.0 Temp_Sensor_0 ]

  # Create instance: XADC_0, and set properties
  set XADC_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:XADC:1.0 XADC_0 ]

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
CONFIG.C_S_AXI_ACLK_FREQ_HZ {100000000} \
 ] $axi_uartlite_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_S_AXI_ACLK_FREQ_HZ.VALUE_SRC {DEFAULT} \
 ] $axi_uartlite_0

  # Create instance: axi_uartlite_1, and set properties
  set axi_uartlite_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_1 ]
  set_property -dict [ list \
CONFIG.C_S_AXI_ACLK_FREQ_HZ {100000000} \
 ] $axi_uartlite_1

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_S_AXI_ACLK_FREQ_HZ.VALUE_SRC {DEFAULT} \
 ] $axi_uartlite_1

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {130.958} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_1

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_1

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.6 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_I_LMB {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {8} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports uart_rtl] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net axi_uartlite_1_UART [get_bd_intf_ports uart_rtl_0] [get_bd_intf_pins axi_uartlite_1/UART]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins Robot_Controller_0/Robot_Controller_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins OV7670_VGA_0/OV7670_VGA_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins Temp_Sensor_0/Temp_Sensor_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins Accelerometer_0/Accelerometer_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins XADC_0/XADC_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins axi_uartlite_1/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]

  # Create port connections
  connect_bd_net -net Accelerometer_0_mosi [get_bd_ports mosi] [get_bd_pins Accelerometer_0/mosi]
  connect_bd_net -net Accelerometer_0_sclk [get_bd_ports sclk] [get_bd_pins Accelerometer_0/sclk]
  connect_bd_net -net Accelerometer_0_ss [get_bd_ports ss] [get_bd_pins Accelerometer_0/ss]
  connect_bd_net -net Net [get_bd_ports OV7670_SIOD] [get_bd_pins OV7670_VGA_0/OV7670_SIOD]
  connect_bd_net -net Net1 [get_bd_ports TMP_SDA] [get_bd_pins Temp_Sensor_0/TMP_SDA]
  connect_bd_net -net Net2 [get_bd_ports TMP_SCL] [get_bd_pins Temp_Sensor_0/TMP_SCL]
  connect_bd_net -net OV7670_D_1 [get_bd_ports OV7670_D] [get_bd_pins OV7670_VGA_0/OV7670_D]
  connect_bd_net -net OV7670_HREF_1 [get_bd_ports OV7670_HREF] [get_bd_pins OV7670_VGA_0/OV7670_HREF]
  connect_bd_net -net OV7670_PCLK_1 [get_bd_ports OV7670_PCLK] [get_bd_pins OV7670_VGA_0/OV7670_PCLK]
  connect_bd_net -net OV7670_VGA_0_OV7670_PWDN [get_bd_ports OV7670_PWDN] [get_bd_pins OV7670_VGA_0/OV7670_PWDN]
  connect_bd_net -net OV7670_VGA_0_OV7670_RESET [get_bd_ports OV7670_RESET] [get_bd_pins OV7670_VGA_0/OV7670_RESET]
  connect_bd_net -net OV7670_VGA_0_OV7670_SIOC [get_bd_ports OV7670_SIOC] [get_bd_pins OV7670_VGA_0/OV7670_SIOC]
  connect_bd_net -net OV7670_VGA_0_OV7670_XCLK [get_bd_ports OV7670_XCLK] [get_bd_pins OV7670_VGA_0/OV7670_XCLK]
  connect_bd_net -net OV7670_VGA_0_VGA_Blue [get_bd_ports VGA_Blue] [get_bd_pins OV7670_VGA_0/VGA_Blue]
  connect_bd_net -net OV7670_VGA_0_VGA_Green [get_bd_ports VGA_Green] [get_bd_pins OV7670_VGA_0/VGA_Green]
  connect_bd_net -net OV7670_VGA_0_VGA_HSYNC [get_bd_ports VGA_HSYNC] [get_bd_pins OV7670_VGA_0/VGA_HSYNC]
  connect_bd_net -net OV7670_VGA_0_VGA_Red [get_bd_ports VGA_Red] [get_bd_pins OV7670_VGA_0/VGA_Red]
  connect_bd_net -net OV7670_VGA_0_VGA_VSYNC [get_bd_ports VGA_VSYNC] [get_bd_pins OV7670_VGA_0/VGA_VSYNC]
  connect_bd_net -net OV7670_VSYNC_1 [get_bd_ports OV7670_VSYNC] [get_bd_pins OV7670_VGA_0/OV7670_VSYNC]
  connect_bd_net -net Robot_Controller_0_robot_wheel_driver_1 [get_bd_ports robot_wheel_driver_1] [get_bd_pins Robot_Controller_0/robot_wheel_driver_1]
  connect_bd_net -net Robot_Controller_0_robot_wheel_driver_2 [get_bd_ports robot_wheel_driver_2] [get_bd_pins Robot_Controller_0/robot_wheel_driver_2]
  connect_bd_net -net Robot_Controller_0_robot_wheel_driver_3 [get_bd_ports robot_wheel_driver_3] [get_bd_pins Robot_Controller_0/robot_wheel_driver_3]
  connect_bd_net -net Robot_Controller_0_robot_wheel_driver_4 [get_bd_ports robot_wheel_driver_4] [get_bd_pins Robot_Controller_0/robot_wheel_driver_4]
  connect_bd_net -net VGA_MODE_1 [get_bd_ports VGA_MODE] [get_bd_pins OV7670_VGA_0/VGA_MODE]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net axi_uartlite_1_interrupt [get_bd_pins axi_uartlite_1/interrupt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net clock_rtl_1 [get_bd_ports clock_rtl] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins Accelerometer_0/accelerometer_axi_aclk] [get_bd_pins OV7670_VGA_0/ov7670_vga_axi_aclk] [get_bd_pins Robot_Controller_0/robot_controller_axi_aclk] [get_bd_pins Temp_Sensor_0/temp_sensor_axi_aclk] [get_bd_pins XADC_0/xadc_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins axi_uartlite_1/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net miso_1 [get_bd_ports miso] [get_bd_pins Accelerometer_0/miso]
  connect_bd_net -net reset_rtl_0_1 [get_bd_ports reset_rtl_0] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins clk_wiz_1/resetn]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins Accelerometer_0/accelerometer_axi_aresetn] [get_bd_pins OV7670_VGA_0/ov7670_vga_axi_aresetn] [get_bd_pins Robot_Controller_0/robot_controller_axi_aresetn] [get_bd_pins Temp_Sensor_0/temp_sensor_axi_aresetn] [get_bd_pins XADC_0/xadc_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins axi_uartlite_1/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net vauxn10_1 [get_bd_ports vauxn10] [get_bd_pins XADC_0/vauxn10]
  connect_bd_net -net vauxn11_1 [get_bd_ports vauxn11] [get_bd_pins XADC_0/vauxn11]
  connect_bd_net -net vauxn2_1 [get_bd_ports vauxn2] [get_bd_pins XADC_0/vauxn2]
  connect_bd_net -net vauxn3_1 [get_bd_ports vauxn3] [get_bd_pins XADC_0/vauxn3]
  connect_bd_net -net vauxp10_1 [get_bd_ports vauxp10] [get_bd_pins XADC_0/vauxp10]
  connect_bd_net -net vauxp11_1 [get_bd_ports vauxp11] [get_bd_pins XADC_0/vauxp11]
  connect_bd_net -net vauxp2_1 [get_bd_ports vauxp2] [get_bd_pins XADC_0/vauxp2]
  connect_bd_net -net vauxp3_1 [get_bd_ports vauxp3] [get_bd_pins XADC_0/vauxp3]
  connect_bd_net -net vn_in_1 [get_bd_ports vn_in] [get_bd_pins XADC_0/vn_in]
  connect_bd_net -net vp_in_1 [get_bd_ports vp_in] [get_bd_pins XADC_0/vp_in]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x44A30000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs Accelerometer_0/Accelerometer_AXI/Accelerometer_AXI_reg] SEG_Accelerometer_0_Accelerometer_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs OV7670_VGA_0/OV7670_VGA_AXI/OV7670_VGA_AXI_reg] SEG_OV7670_VGA_0_OV7670_VGA_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs Robot_Controller_0/Robot_Controller_AXI/Robot_Controller_AXI_reg] SEG_Robot_Controller_0_Robot_Controller_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A20000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs Temp_Sensor_0/Temp_Sensor_AXI/Temp_Sensor_AXI_reg] SEG_Temp_Sensor_0_Temp_Sensor_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A40000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs XADC_0/XADC_AXI/XADC_AXI_reg] SEG_XADC_0_XADC_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40610000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_1/S_AXI/Reg] SEG_axi_uartlite_1_Reg
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port uart_rtl -pg 1 -y 880 -defaultsOSRD
preplace port vauxp2 -pg 1 -y 50 -defaultsOSRD
preplace port OV7670_RESET -pg 1 -y 350 -defaultsOSRD
preplace port OV7670_PWDN -pg 1 -y 330 -defaultsOSRD
preplace port vp_in -pg 1 -y 210 -defaultsOSRD
preplace port vauxp3 -pg 1 -y 90 -defaultsOSRD
preplace port miso -pg 1 -y -80 -defaultsOSRD
preplace port OV7670_XCLK -pg 1 -y 270 -defaultsOSRD
preplace port OV7670_HREF -pg 1 -y 410 -defaultsOSRD
preplace port OV7670_VSYNC -pg 1 -y 430 -defaultsOSRD
preplace port reset_rtl -pg 1 -y 550 -defaultsOSRD
preplace port vauxp10 -pg 1 -y 130 -defaultsOSRD
preplace port TMP_SCL -pg 1 -y 60 -defaultsOSRD
preplace port TMP_SDA -pg 1 -y 80 -defaultsOSRD
preplace port vauxp11 -pg 1 -y 170 -defaultsOSRD
preplace port mosi -pg 1 -y -60 -defaultsOSRD
preplace port VGA_VSYNC -pg 1 -y 450 -defaultsOSRD
preplace port vauxn10 -pg 1 -y 150 -defaultsOSRD
preplace port vauxn2 -pg 1 -y 70 -defaultsOSRD
preplace port OV7670_SIOC -pg 1 -y 290 -defaultsOSRD
preplace port vauxn11 -pg 1 -y 190 -defaultsOSRD
preplace port vauxn3 -pg 1 -y 110 -defaultsOSRD
preplace port VGA_HSYNC -pg 1 -y 430 -defaultsOSRD
preplace port OV7670_SIOD -pg 1 -y 310 -defaultsOSRD
preplace port OV7670_PCLK -pg 1 -y 350 -defaultsOSRD
preplace port VGA_MODE -pg 1 -y 390 -defaultsOSRD
preplace port vn_in -pg 1 -y 230 -defaultsOSRD
preplace port ss -pg 1 -y -40 -defaultsOSRD
preplace port reset_rtl_0 -pg 1 -y 500 -defaultsOSRD
preplace port clock_rtl -pg 1 -y 570 -defaultsOSRD
preplace port sclk -pg 1 -y -80 -defaultsOSRD
preplace port uart_rtl_0 -pg 1 -y 930 -defaultsOSRD
preplace portBus robot_wheel_driver_1 -pg 1 -y 520 -defaultsOSRD
preplace portBus robot_wheel_driver_2 -pg 1 -y -110 -defaultsOSRD
preplace portBus robot_wheel_driver_3 -pg 1 -y 470 -defaultsOSRD
preplace portBus VGA_Green -pg 1 -y 390 -defaultsOSRD
preplace portBus robot_wheel_driver_4 -pg 1 -y 500 -defaultsOSRD
preplace portBus VGA_Red -pg 1 -y 370 -defaultsOSRD
preplace portBus OV7670_D -pg 1 -y 370 -defaultsOSRD
preplace portBus VGA_Blue -pg 1 -y 410 -defaultsOSRD
preplace inst Temp_Sensor_0 -pg 1 -lvl 1 -y 40 -defaultsOSRD
preplace inst Accelerometer_0 -pg 1 -lvl 1 -y -130 -defaultsOSRD
preplace inst Robot_Controller_0 -pg 1 -lvl 2 -y 391 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 5 -y 320 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 5 -y 720 -defaultsOSRD
preplace inst OV7670_VGA_0 -pg 1 -lvl 1 -y 360 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 2 -y -99 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 6 -y 150 -defaultsOSRD
preplace inst XADC_0 -pg 1 -lvl 4 -y 150 -defaultsOSRD
preplace inst axi_uartlite_0 -pg 1 -lvl 2 -y 900 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 2 -y 111 -defaultsOSRD
preplace inst axi_uartlite_1 -pg 1 -lvl 3 -y 960 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 4 -y 590 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 2 -y 590 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 5 -y -60 -defaultsOSRD
preplace netloc vauxn3_1 1 0 4 NJ 110 NJ 240 NJ 240 NJ
preplace netloc Accelerometer_0_ss 1 1 6 NJ -40 NJ -60 NJ -60 NJ 20 NJ -40 NJ
preplace netloc Accelerometer_0_mosi 1 1 6 NJ -220 NJ -220 NJ -220 NJ -220 NJ -220 NJ
preplace netloc OV7670_VGA_0_OV7670_RESET 1 1 6 NJ 310 NJ 310 NJ 370 NJ 800 NJ 350 NJ
preplace netloc OV7670_HREF_1 1 0 1 NJ
preplace netloc Robot_Controller_0_robot_wheel_driver_2 1 2 5 NJ -180 NJ -180 NJ -180 NJ -180 NJ
preplace netloc microblaze_0_axi_periph_M04_AXI 1 0 6 -70 -220 NJ -160 NJ -160 NJ -160 NJ -160 2390
preplace netloc vp_in_1 1 0 4 NJ 210 NJ 250 NJ 210 NJ
preplace netloc vauxp3_1 1 0 4 NJ 200 NJ 200 NJ 90 NJ
preplace netloc vauxn11_1 1 0 4 NJ 180 NJ 220 NJ 180 NJ
preplace netloc axi_uartlite_1_interrupt 1 3 2 NJ 730 N
preplace netloc Robot_Controller_0_robot_wheel_driver_3 1 2 5 NJ 400 NJ 400 NJ 620 NJ 470 NJ
preplace netloc axi_uartlite_0_interrupt 1 2 3 NJ 710 NJ 710 N
preplace netloc miso_1 1 0 1 -120
preplace netloc OV7670_VGA_0_OV7670_SIOC 1 1 6 NJ 290 NJ 290 NJ 350 NJ 810 NJ 290 NJ
preplace netloc OV7670_D_1 1 0 1 NJ
preplace netloc Robot_Controller_0_robot_wheel_driver_4 1 2 5 NJ 850 NJ 850 NJ 850 NJ 850 NJ
preplace netloc microblaze_0_intr 1 5 1 NJ
preplace netloc axi_uartlite_1_UART 1 3 4 NJ 930 NJ 930 NJ 930 NJ
preplace netloc vn_in_1 1 0 4 NJ 220 NJ 260 NJ 230 NJ
preplace netloc OV7670_VGA_0_VGA_Green 1 1 6 NJ -200 NJ -200 NJ -200 NJ -200 NJ -200 NJ
preplace netloc microblaze_0_Clk 1 0 6 -80 120 370 650 1110 550 1520 390 2040 630 2410
preplace netloc microblaze_0_axi_periph_M06_AXI 1 1 5 470 690 NJ 690 NJ 690 NJ 660 2370
preplace netloc microblaze_0_axi_periph_M03_AXI 1 0 6 -60 -30 NJ -20 NJ -20 NJ -20 NJ 40 2370
preplace netloc microblaze_0_intc_axi 1 5 1 2400
preplace netloc microblaze_0_interrupt 1 1 6 NJ 780 NJ 780 NJ 780 NJ 780 NJ 780 2790
preplace netloc vauxp10_1 1 0 4 NJ 160 NJ 210 NJ 200 NJ
preplace netloc microblaze_0_ilmb_1 1 2 3 NJ -70 NJ -70 NJ
preplace netloc OV7670_PCLK_1 1 0 1 NJ
preplace netloc VGA_MODE_1 1 0 1 NJ
preplace netloc microblaze_0_axi_periph_M05_AXI 1 3 3 1540 680 NJ 650 2380
preplace netloc microblaze_0_axi_dp 1 2 3 NJ 130 1450 320 1940
preplace netloc vauxn10_1 1 0 4 NJ 150 NJ 190 NJ 150 NJ
preplace netloc Accelerometer_0_sclk 1 1 6 NJ -210 NJ -210 NJ -210 NJ -210 NJ -210 NJ
preplace netloc OV7670_VGA_0_VGA_VSYNC 1 1 6 NJ 490 NJ 490 NJ 490 NJ 610 NJ 450 NJ
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 4 1 1930
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 4 1 2000
preplace netloc microblaze_0_axi_periph_M01_AXI 1 1 5 NJ -30 NJ -30 NJ -30 NJ 60 2360
preplace netloc vauxp11_1 1 0 4 NJ 170 NJ 230 NJ 220 NJ
preplace netloc OV7670_VGA_0_VGA_HSYNC 1 1 6 NJ 480 NJ 480 NJ 480 NJ 600 NJ 430 NJ
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 0 6 -70 510 NJ 520 NJ 340 1530 340 2030 830 NJ
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 1 5 NJ 510 NJ 510 NJ 500 NJ 820 NJ
preplace netloc clk_wiz_1_locked 1 2 2 N 600 1460
preplace netloc axi_uartlite_0_UART 1 2 5 NJ 880 NJ 880 NJ 880 NJ 880 NJ
preplace netloc reset_rtl_0_1 1 0 4 NJ 500 NJ 500 NJ 500 NJ
preplace netloc microblaze_0_axi_periph_M07_AXI 1 2 4 1120 700 NJ 700 NJ 640 2360
preplace netloc microblaze_0_axi_periph_M02_AXI 1 0 6 -90 -210 NJ -170 NJ -170 NJ -170 NJ -170 2380
preplace netloc microblaze_0_dlmb_1 1 2 3 NJ -90 NJ -90 NJ
preplace netloc vauxn2_1 1 0 4 NJ -40 NJ -10 NJ 70 NJ
preplace netloc Net1 1 1 6 NJ 20 NJ -50 NJ -50 NJ 30 NJ 30 NJ
preplace netloc OV7670_VGA_0_VGA_Blue 1 1 6 NJ 470 NJ 470 NJ 470 NJ 590 NJ 410 NJ
preplace netloc Net 1 1 6 NJ 300 NJ 300 NJ 360 NJ 790 NJ 310 NJ
preplace netloc OV7670_VSYNC_1 1 0 1 NJ
preplace netloc clock_rtl_1 1 0 2 NJ 570 320
preplace netloc microblaze_0_debug 1 1 2 470 10 990
preplace netloc vauxp2_1 1 0 4 NJ -50 NJ 0 NJ 50 NJ
preplace netloc Net2 1 1 6 NJ 30 NJ -40 NJ -40 NJ 50 NJ 50 NJ
preplace netloc OV7670_VGA_0_OV7670_XCLK 1 1 6 NJ 270 NJ 260 NJ 380 NJ 580 NJ 270 NJ
preplace netloc mdm_1_debug_sys_rst 1 2 2 1000 -80 1500
preplace netloc OV7670_VGA_0_VGA_Red 1 1 6 NJ -190 NJ -190 NJ -190 NJ -190 NJ -190 NJ
preplace netloc OV7670_VGA_0_OV7670_PWDN 1 1 6 NJ 280 NJ 280 NJ 330 NJ -150 NJ -150 NJ
preplace netloc Robot_Controller_0_robot_wheel_driver_1 1 2 5 NJ 840 NJ 840 NJ 840 NJ 520 NJ
preplace netloc reset_rtl_1 1 0 2 NJ 550 330
levelinfo -pg 1 -140 170 780 1340 1760 2220 2680 2900 -top -230 -bot 1030
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


