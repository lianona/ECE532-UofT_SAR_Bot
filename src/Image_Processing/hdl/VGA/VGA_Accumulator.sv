`timescale 1ns / 1ps

module VGA_Accumulator #
(
	parameter VGA_WIDTH  = 9'd320,
	parameter VGA_HEIGHT = 8'd240
)

(
	 input wire          clk,
	 input wire          thres,
	 input wire          vga_blank,
	 input wire [16 : 0] frame_addr ,
	output  reg [16 : 0] accu_cnt,
	output  reg [ 8 : 0] accu_avg_x,
	output  reg [ 7 : 0] accu_avg_y 
);
	reg [16 : 0] cnt; 
	reg [24 : 0] sum_x; // WIDTH * HEIGHT * HEIGHT
	reg [24 : 0] sum_y; // WIDTH * HEIGHT *  WIDTH

	initial
	begin
		cnt = 17'd0;
		sum_x = 9'd0;
		sum_y = 8'd0;
	end

	always@(posedge clk)
	begin
		if (vga_blank == 1'b0)
		begin
			if (thres)
			begin
				cnt <= cnt + 17'd1;
				sum_x <= sum_x + (frame_addr % VGA_WIDTH);
				sum_y <= sum_y + (frame_addr / VGA_WIDTH);
			end
		end
		if (frame_addr == VGA_WIDTH * VGA_HEIGHT - 17'd1)
		begin
			accu_cnt <= cnt;
			accu_avg_x <= cnt == 17'd0 ? -9'd1 : ((sum_x + cnt / 2) / cnt);
			accu_avg_y <= cnt == 17'd0 ? -8'd1 : ((sum_y + cnt / 2) / cnt);
			cnt <= 17'd0;
			sum_x <= 25'd0;
			sum_y <= 25'd0;
		end
	end
endmodule
