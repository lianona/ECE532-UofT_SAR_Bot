/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */
/*
#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "intc_header.h"
 */
#include "xil_printf.h"

volatile unsigned * robot_controller_addr = (unsigned *) 0x44a00000;
volatile unsigned * OV7670_VGA_Addr = (unsigned *) 0x44a10000;
volatile unsigned * xadc_addr = (unsigned *) 0x44a40000;
volatile unsigned * temp_sensor_addr = (unsigned *) 0x44a20000;
volatile unsigned * accelerometer_addr = (unsigned *) 0x44a30000;
volatile unsigned int *urt  = (unsigned int *) 0x40610000;
volatile unsigned int *utt  = (unsigned int *) 0x40610004;
volatile unsigned int *urtc = (unsigned int *) 0x4061000c;

const unsigned speed = 50;

int blue_tooth(char * mode, char * dir, char * enable_rf, unsigned * man_speed,
	char * prev_urt, char * curr_urt)
{
	if (((*curr_urt) = (*urt)) != (*prev_urt))
	{
		if ((*curr_urt) == 'm' || (*curr_urt) == 'a')
		{
			xil_printf("Robot has been set to mode %c.\n", *curr_urt);
			(*mode) = (*curr_urt);
		}
		if ((*curr_urt) == 'f' || (*curr_urt) == 'b' ||
			(*curr_urt) == 'i' || (*curr_urt) == 'j' ||
			(*curr_urt) == 'k' || (*curr_urt) == 't' ||
			(*curr_urt) == 'n' || (*curr_urt) == 'p' ||
			(*curr_urt) == 'o')
		{
			xil_printf("Robot has been set to direction %c.\n", *curr_urt);
			(*dir) = (*curr_urt);
		}
		if ((*curr_urt) == 'v' || (*curr_urt) == 'w')
		{
			xil_printf("Robot has been set to range_enable %c.\n", *curr_urt);
			(*enable_rf) = (*curr_urt);
		}
		if ((*curr_urt) >= 0x30 && (*curr_urt) <= 0x39)
		{
			xil_printf("Robot has been set to speed %d.\n", (*curr_urt) - 0x30);
			(*man_speed) = ((*curr_urt) - 0x30) * 10 + 50;
		}

		(*prev_urt) = (*curr_urt); return 1;
	}
	return 0;
}

void acce_to_str(char * buffer, unsigned acce)
{
	// char acce_buffer[6]; acce_buffer[5] = 0;
	if ((acce) >> 11)
	{
		buffer[0] = '-';
		acce = (1 << 12) - acce;
	}
	else
	{
		buffer[0] = '+';
	}
	buffer[1] =  acce / 1000 + '0';
	buffer[2] = '.';
	buffer[3] = (acce % 1000) / 100 + '0';
	buffer[4] = (acce %  100) /  10 + '0';
	/*
	for (unsigned i = 0; i < 5; ++i)
	{
		acce_buffer[i] = buffer[i];
	}
	xil_printf("Current Acceleration: %s\n", acce_buffer);
	 */
}

void temp_to_str(char * buffer, unsigned temp)
{
	// char temp_buffer[6]; temp_buffer[5] = 0;
	/*
	if ((temp >> 12))
	{
		buffer[0] = '-';
		temp = (1 << 13) - temp;
	}
	else
	{
		buffer[0] = '+';
	}
	 */
	// temperature integer part
	unsigned temp_int_part = temp >> 4;

	buffer[0] = temp_int_part / 10 + '0';
	buffer[1] = temp_int_part % 10 + '0';
	// sprintf(&(buffer[0]), "%2d", temp_int_part);

	buffer[2] = '.';
	// temperature fractional part
	switch(temp - (temp_int_part << 4))
	{
		case( 0): buffer[3] = '0'; buffer[4] = '0'; break;
		case( 1): buffer[3] = '0'; buffer[4] = '6'; break;
		case( 2): buffer[3] = '1'; buffer[4] = '3'; break;
		case( 3): buffer[3] = '1'; buffer[4] = '9'; break;
		case( 4): buffer[3] = '2'; buffer[4] = '5'; break;
		case( 5): buffer[3] = '3'; buffer[4] = '1'; break;
		case( 6): buffer[3] = '3'; buffer[4] = '8'; break;
		case( 7): buffer[3] = '4'; buffer[4] = '4'; break;
		case( 8): buffer[3] = '5'; buffer[4] = '0'; break;
		case( 9): buffer[3] = '5'; buffer[4] = '6'; break;
		case(10): buffer[3] = '6'; buffer[4] = '3'; break;
		case(11): buffer[3] = '6'; buffer[4] = '9'; break;
		case(12): buffer[3] = '7'; buffer[4] = '5'; break;
		case(13): buffer[3] = '8'; buffer[4] = '1'; break;
		case(14): buffer[3] = '8'; buffer[4] = '8'; break;
		case(15): buffer[3] = '9'; buffer[4] = '4'; break;
		default : buffer[3] = '0'; buffer[4] = '0'; break;
	}
	/*
	for (unsigned i = 0; i < 5; ++i)
	{
		temp_buffer[i] = buffer[i];
	}
	xil_printf("Current Temperature: %s\n", temp_buffer);
	 */
}

void gyro_to_str(char * buffer, unsigned gyro, unsigned calibration)
{
	// char gyro_buffer[6]; gyro_buffer[5] = 0;

	int ang_vec = (((int) gyro) - (int) calibration) / 9;

	if (ang_vec < 0)
	{
		buffer[0] = '-';
		ang_vec = -ang_vec;
	}
	else
	{
		buffer[0] = '+';
	}

	buffer[1] =  ang_vec / 10000         + '0';
	buffer[2] = (ang_vec % 10000) / 1000 + '0';
	buffer[3] = '.';
	buffer[4] = (ang_vec %  1000) /  100 + '0';

	/*
	for (unsigned i = 0; i < 5; ++i)
	{
		gyro_buffer[i] = buffer[i];
	}
	xil_printf("Current Angular Velocity: %d, %s\n", ang_vec, gyro_buffer);
	 */
}

#define __enable_printf__ 0

void update_sensors()
{
	char buffer[] = "#12.3456.7812.3456.7812.3456.78~";

	temp_to_str(&buffer[21], * temp_sensor_addr);
	acce_to_str(&buffer[ 1], *(accelerometer_addr + 0));
	acce_to_str(&buffer[ 6], *(accelerometer_addr + 1));
	gyro_to_str(&buffer[11], *(xadc_addr + 0), 450000);
	gyro_to_str(&buffer[16], *(xadc_addr + 2), 440000);

	for (unsigned i = 0; i < 32; ++i)
	{
		*(utt) = buffer[i];

		for (unsigned j = 0; j < 8000; ++j)
		{}
	}
}

int main() 
{
	// init_platform();
	*(robot_controller_addr) = 1;

	char mode = 'a'; char dir = 'o'; char enable_rf = 'v';
	unsigned man_speed = 50;
	char prev_urt = *urt;
	char curr_urt = *urt;

	while (1)
	{
		int ret = 0;

		// update_sensors();

		if (mode == 'a')
		{
			int rf_l = *(xadc_addr + 1);
			int rf_r = *(xadc_addr + 3);

			if (rf_l > 250000 && rf_r > 250000)
			{
				AVOID_OBSTACLE:
				xil_printf("Robot notices that something is blocking its way: %6d, %6d.\n",
						*(xadc_addr + 1), *(xadc_addr + 3));

				*(robot_controller_addr + 1) = 128 + (1 << 31);
				*(robot_controller_addr + 2) = 128 + (1 << 31);
				*(robot_controller_addr + 3) = 128 + (0 << 31);
				*(robot_controller_addr + 4) = 128 + (0 << 31);
				for (unsigned i = 0; i < 500000; ++i)
				{
					if (i % 100000 == 0) update_sensors();
					ret = blue_tooth(&mode, &dir, &enable_rf, &man_speed, &prev_urt, &curr_urt);
					if (ret) break;
				}
				if (ret) continue;

				*(robot_controller_addr + 1) = speed + (1 << 31);
				*(robot_controller_addr + 2) = speed + (1 << 31);
				*(robot_controller_addr + 3) = speed + (1 << 31);
				*(robot_controller_addr + 4) = speed + (1 << 31);
				for (unsigned i = 0; i < 600000; ++i)
				{
					if (i % 100000 == 0) update_sensors();
					ret = blue_tooth(&mode, &dir, &enable_rf, &man_speed, &prev_urt, &curr_urt);
					if (ret) break;
				}
				if (ret) continue;

				*(robot_controller_addr + 1) = 128 + (0 << 31);
				*(robot_controller_addr + 2) = 128 + (0 << 31);
				*(robot_controller_addr + 3) = 128 + (1 << 31);
				*(robot_controller_addr + 4) = 128 + (1 << 31);
				for (unsigned i = 0; i < 450000; ++i)
				{
					if (i % 100000 == 0) update_sensors();
					ret = blue_tooth(&mode, &dir, &enable_rf, &man_speed, &prev_urt, &curr_urt);
					if (ret) break;
				}
				if (ret) continue;

				*(robot_controller_addr + 1) = 0 + (1 << 31);
				*(robot_controller_addr + 2) = 0 + (1 << 31);
				*(robot_controller_addr + 3) = 0 + (1 << 31);
				*(robot_controller_addr + 4) = 0 + (1 << 31);

				continue;
			}

			unsigned cnt = *(OV7670_VGA_Addr);
// #if __enable_printf__
			unsigned avg_x = *(OV7670_VGA_Addr + 1);
// #endif // __enable_printf__
			unsigned avg_y = *(OV7670_VGA_Addr + 2);

#if __enable_printf__
			xil_printf("Cnt: %3d, Avg x: %3d, Avg y: %3d\n", cnt, avg_x, avg_y);
#endif // __enable_printf__

			if (cnt < 500)
			{
#if __enable_printf__
				xil_printf("Camera is not capturing any BLUE object. Robot stops and randomly rotates.\n");
#endif // __enable_printf

				*(robot_controller_addr + 1) = 0 + (1 << 31);
				*(robot_controller_addr + 2) = 0 + (1 << 31);
				*(robot_controller_addr + 3) = 0 + (1 << 31);
				*(robot_controller_addr + 4) = 0 + (1 << 31);
				/*
				*(robot_controller_addr + 1) = speed + (0 << 31);
				*(robot_controller_addr + 2) = speed + (0 << 31);
				*(robot_controller_addr + 3) = speed + (1 << 31);
				*(robot_controller_addr + 4) = speed + (1 << 31);
				 */

				goto UPDATE_SENSORS;
				// continue;
			}
			if (cnt > 10000)
			{
#if __enable_printf__
				xil_printf("Camera is getting too close to the object. Robot stops.\n");
#endif // __enable_printf__
				*(robot_controller_addr + 1) = 0 + (1 << 31);
				*(robot_controller_addr + 2) = 0 + (1 << 31);
				*(robot_controller_addr + 3) = 0 + (1 << 31);
				*(robot_controller_addr + 4) = 0 + (1 << 31);

				goto UPDATE_SENSORS;
				// continue;
			}

			if (avg_y < 80)
			{
				*(robot_controller_addr + 1) = speed + (1 << 31);
				*(robot_controller_addr + 2) = speed + (1 << 31);
				*(robot_controller_addr + 3) = speed + (0 << 31);
				*(robot_controller_addr + 4) = speed + (0 << 31);
			}
			else if (avg_y > 160)
			{
				*(robot_controller_addr + 1) = speed + (0 << 31);
				*(robot_controller_addr + 2) = speed + (0 << 31);
				*(robot_controller_addr + 3) = speed + (1 << 31);
				*(robot_controller_addr + 4) = speed + (1 << 31);
			}
			else
			{
				*(robot_controller_addr + 1) = speed + (1 << 31);
				*(robot_controller_addr + 2) = speed + (1 << 31);
				*(robot_controller_addr + 3) = speed + (1 << 31);
				*(robot_controller_addr + 4) = speed + (1 << 31);
			}
		}
		else
		{
			if (dir == 'f')
			{
				*(robot_controller_addr + 1) = man_speed + (1 << 31);
				*(robot_controller_addr + 2) = man_speed + (1 << 31);
				*(robot_controller_addr + 3) = man_speed + (1 << 31);
				*(robot_controller_addr + 4) = man_speed + (1 << 31);
			}
			if (dir == 'b')
			{
				*(robot_controller_addr + 1) = man_speed + (0 << 31);
				*(robot_controller_addr + 2) = man_speed + (0 << 31);
				*(robot_controller_addr + 3) = man_speed + (0 << 31);
				*(robot_controller_addr + 4) = man_speed + (0 << 31);
			}
			if (dir == 'o')
			{
				*(robot_controller_addr + 1) = 0 + (0 << 31);
				*(robot_controller_addr + 2) = 0 + (0 << 31);
				*(robot_controller_addr + 3) = 0 + (0 << 31);
				*(robot_controller_addr + 4) = 0 + (0 << 31);
			}
			if (dir == 'i')
			{
				*(robot_controller_addr + 1) = 10 + (1 << 31);
				*(robot_controller_addr + 2) = 10 + (1 << 31);
				*(robot_controller_addr + 3) = man_speed + (1 << 31);
				*(robot_controller_addr + 4) = man_speed + (1 << 31);
			}
			if (dir == 'j')
			{
				*(robot_controller_addr + 1) = man_speed + (1 << 31);
				*(robot_controller_addr + 2) = man_speed + (1 << 31);
				*(robot_controller_addr + 3) = 10 + (1 << 31);
				*(robot_controller_addr + 4) = 10 + (1 << 31);
			}
			if (dir == 'k')
			{
				*(robot_controller_addr + 1) = 10 + (0 << 31);
				*(robot_controller_addr + 2) = 10 + (0 << 31);
				*(robot_controller_addr + 3) = man_speed + (0 << 31);
				*(robot_controller_addr + 4) = man_speed + (0 << 31);
			}
			if (dir == 't')
			{
				*(robot_controller_addr + 1) = man_speed + (0 << 31);
				*(robot_controller_addr + 2) = man_speed + (0 << 31);
				*(robot_controller_addr + 3) = 10 + (0 << 31);
				*(robot_controller_addr + 4) = 10 + (0 << 31);
			}
			if (dir == 'n')
			{
				*(robot_controller_addr + 1) = man_speed + (0 << 31);
				*(robot_controller_addr + 2) = man_speed + (0 << 31);
				*(robot_controller_addr + 3) = man_speed + (1 << 31);
				*(robot_controller_addr + 4) = man_speed + (1 << 31);
			}
			if (dir == 'p')
			{
				*(robot_controller_addr + 1) = man_speed + (1 << 31);
				*(robot_controller_addr + 2) = man_speed + (1 << 31);
				*(robot_controller_addr + 3) = man_speed + (0 << 31);
				*(robot_controller_addr + 4) = man_speed + (0 << 31);
			}
		}

		// for (unsigned i = 0; i < 10000000; ++i) {}
		UPDATE_SENSORS: for (unsigned i = 0; i < 450000; ++i)
		{
				if (i % 200000 == 0)
				{
					update_sensors();

					int rf_l = *(xadc_addr + 1);
					int rf_r = *(xadc_addr + 3);

					if (mode == 'a' && (rf_l > 250000 && rf_r > 250000))
					{
						goto AVOID_OBSTACLE;
					}
				}
				ret = blue_tooth(&mode, &dir, &enable_rf, &man_speed, &prev_urt, &curr_urt);
				if (ret) break;
		}
		if (ret) continue;
	}
	// cleanup_platform();

	return 0;
}
