module btn_debounce (
	input clk, 
	input reset,
	input slow_tick,									// output from clk_div, repeats at 59Hz
	input btn_raw,										// unfiltered button input
	output btn_clean );									// filtered button output
	
	reg [3:0] shift_reg;								// holds the last 4 inputs from btn_raw
	
	always @(posedge clk) begin
		if (reset)
			shift_reg <= 4'd0;
		else if (slow_tick)
			shift_reg <= {shift_reg[2:0], btn_raw};		// on a slow_tick pulse, shift in new sample and drop oldest bit
	end
	
	assign btn_clean = &shift_reg;						// filtered button output when 

endmodule
			
		
