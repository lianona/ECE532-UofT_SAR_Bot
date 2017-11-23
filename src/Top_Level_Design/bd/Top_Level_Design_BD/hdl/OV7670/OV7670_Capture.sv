`timescale 1ns / 1ps

module OV7670_Capture
(
	 input wire          pclk ,
	 input wire          vsync,
	 input wire          href ,
	 input wire [ 7 : 0] d,
	output  reg [16 : 0] addr,
	output  reg [15 : 0] dout,
	output wire          we
);
    	reg [15 : 0] dout_buffer;
    	reg [16 : 0] addr_next;  
     	reg [ 1 : 0] we_hold;    
     	reg [ 1 : 0] cnt;

	always@(posedge pclk)
	begin 
 		if (vsync == 1'b1)
 		begin
           		addr      <= 17'd0;
           		addr_next <= 17'd0;
           		we_hold   <=  2'd0;
           		cnt       <=  2'd0;
           	end
		else
		begin
			if (addr < 17'd76800)
				addr <= addr_next;
			else
				addr <= 17'd76800;

		   	// we      <=  we_hold[1];
		   	// we_hold is used to generate a write-enable signal every other cycle.
		   	// Note that the input data is only valid when href is high.
		   	we_hold <= {we_hold[0], href && (!we_hold[0])};
		   	dout_buffer <= {dout_buffer[7 : 0], d};

           		if (we_hold[1] == 1'b1)
           		begin
              			addr_next <= addr_next + 17'd1;
              			dout <= dout_buffer;
           		end
        	end
	end
	
	assign we = we_hold[1];

endmodule
