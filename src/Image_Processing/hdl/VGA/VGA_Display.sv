`timescale 1ns / 1ps

module VGA_Display
(
	 input wire         clk_25MHz,
	output  reg [3 : 0] vga_red  ,
	output  reg [3 : 0] vga_green,
	output  reg [3 : 0] vga_blue ,
	output  reg         vga_hsync,
	output  reg         vga_vsync,
	 input wire         vga_mode,
	output  reg [9 : 0] hCnt,
	output  reg [9 : 0] vCnt,

	output  reg [16 : 0] frame_addr ,
	 input wire [15 : 0] frame_pixel,

	output  reg vga_blank,
	 input wire blue_thres	
);
    	// Timing constants
      	parameter hRez         = 10'd640;
      	parameter hStartSync   = 10'd640 + 10'd16;
      	parameter hEndSync     = 10'd640 + 10'd16 + 10'd96;
      	parameter hMaxCount    = 10'd800;
    
      	parameter vRez         = 10'd480;
      	parameter vStartSync   = 10'd480 + 10'd10;
      	parameter vEndSync     = 10'd480 + 10'd10 + 10'd2;
      	parameter vMaxCount    = 10'd480 + 10'd10 + 10'd2 + 10'd33;
    
    	parameter hsync_active = 1'b0;
    	parameter vsync_active = 1'b0;
   
	initial vga_blank = 1'b1;    
   
   	always@(posedge clk_25MHz)
   	begin
            	if (hCnt == hMaxCount - 10'd1)
            	begin
   			hCnt <= 10'd0;
   				
   			if (vCnt == vMaxCount - 10'd1)
   				vCnt <= 10'd0;
   			else
   				vCnt <= vCnt + 10'd1;
   			end
   		else
   			hCnt <= hCnt + 10'd1;
   		//****************************************************************
   		if (vga_blank == 1'b0) 
   		begin
   			vga_red   <= vga_mode ? frame_pixel[11 : 8] : (blue_thres ? 4'hf : 4'h0); // frame_pixel[11 : 8];
   			vga_green <= vga_mode ? frame_pixel[ 7 : 4] : (blue_thres ? 4'hf : 4'h0); // frame_pixel[ 7 : 4];
   			vga_blue  <= vga_mode ? frame_pixel[ 3 : 0] : (blue_thres ? 4'hf : 4'h0); // frame_pixel[ 3 : 0];
   		end
   		else 
   		begin
   			vga_red   <= 4'd0;
   			vga_green <= 4'd0;
   			vga_blue  <= 4'd0;
   		end
   		//****************************************************************
   		if (vCnt >= 10'd360 || vCnt < 10'd120)
   		begin
   			frame_addr <= 17'd0; 
   			vga_blank <= 1'd1;
   		end
   		else
   		begin
   			if (hCnt < 10'd480 && hCnt >= 10'd160) 
   			begin
   				frame_addr <= frame_addr + 17'd1;
   				vga_blank <= 1'b0;
   			end
   			else
   				vga_blank <= 1'b1;
   		end;
   		//****************************************************************
   		// Are we in the hSync pulse?
   		if (hCnt >  hStartSync && hCnt <= hEndSync)
   			vga_hsync <=  hsync_active;
   		else
   			vga_hsync <= ~hsync_active;
   		// Are we in the vSync pulse?
   		if (vCnt >= vStartSync && vCnt <  vEndSync )
   			vga_vsync <=  vsync_active;
   		else
   			vga_vsync <= ~vsync_active;
   	end
endmodule
