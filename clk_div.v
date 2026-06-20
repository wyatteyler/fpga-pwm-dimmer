module clk_div #(
	parameter CLK_FREQ = 125000000,					// reference clock 
	parameter OUT_FREQ = 59							// derived clock
) (
	input clk,
	input reset,
	output slow_tick );

	localparam DIVIDER = CLK_FREQ / OUT_FREQ;		// determines the period slow_tick repeats at
	localparam WIDTH = $clog2(DIVIDER);				// number of bits needed to represent DIVIDER
	
	reg [WIDTH-1:0] count;							// counter sized to hold values 0 through DIVIDER - 1
	
	always @(posedge clk) begin						
		if (reset || count == DIVIDER - 1) 			// sets counter back to zero when period is reached or at reset
			count <= 0;
		else 
			count <= count + 1;						// increment the counter
		end
		
	assign slow_tick = (count == DIVIDER - 1);		// single cycle pulse that repeats at 59Hz
	
endmodule
			
	
