module pwm_count (
	input clk,
	input reset,
	input [7:0] in_duty, 					// comes from out_duty in duty_cy.v, sets the percentage of time the LED is on. 
	output out_pwm );						// e.g. in_duty = 255 means its nearly always on meaning brighter LED
	
	reg [7:0] count;						// pwm count (0-255)

	always @(posedge clk) begin
		if (reset) 
			count <= 8'd0;
		else 
			count <= count + 8'd1;			// increments count
		end
			
	assign out_pwm = count < in_duty;		// out_pwm is only driven high when the count is less than the threshold

endmodule
		
