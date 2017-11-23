# University of Toronto Search and Rescue Robot

### Description

This repository contains the design source files for ECE 532 design project.
The project goal is to build a mobile robot that can track blue objects.
The robot has the ability of reporting to the user (via an App on Android device) the environment condition, which includes the following:

  - Temperature
  - Whether or not there is obstacle blocking its way
  - Acceleration (in the `x` and `y` direction)
  - Angular Acceleration (in the `x` and `z` direction)

(Note: `x` direction is defined as the direction that goes from the back to the front end of the robot.)

### How to Use

Please kindly follow the procedures below in order to build and run the project

  - Download the repository and extract all the files
  - Open the project `Top_Level_Design.xpr` that is located inside directory `Top_Level_Design` using Xilinx design software
  - Generate the bitstream and launch the SDK
  - Program the FPGA and download the `.elf` file to the board
  - All done! The program should be able to run properly on the board.

### Repository Structure

This repository is organized as follows:

  - `src/Accelerometer`: contains the Accelerometer IP block
  - `src/Image_Processing`: contains the Image Processing IP block
  - `src/Robot_Controller`: contains the Robot Controller IP block (controls the behavior of wheels of the robot)
  - `src/Temp_Sensor`: contains the Temperature Sensor IP block
  - `src/XADC`: contains the XADC IP block (measure the angular acceleration and also the distance of obstacles at front)
  
### Authors

  - Ahmed Cheriya Melat
  - Bojian Zheng
  - Kejian Lin
  - Jinghan Guan

### Acknowledgements

We would like to express our sincere gratitude to Digilent for providing the source code for the demo on Nexy4 DDR board.
Specifically, we made use of the following source files in our project

  - https://reference.digilentinc.com/learn/programmable-logic/tutorials/nexys-4-ddr-xadc-demo/start
  - https://reference.digilentinc.com/learn/programmable-logic/tutorials/nexys-4-ddr-user-demo/start

We would also like to thank teaching assistant Charles Lo for sharing an example project on PMOD camera: http://www.piazza.com/class_profile/get_resource/ixov7014v1f23d/iyz3c568nc44xz

