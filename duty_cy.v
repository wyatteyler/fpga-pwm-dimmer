module duty_cy (
	input clk,
	input reset,
	input slow_tick,											// from clk_div, think of it as enable 
	input btn_up,												// increments duty cycle
	input btn_down,												// reduces duty cycle
	output reg [7:0] out_duty );								// duty_cycle (0-255) drives pwm threshold
	
	always @(posedge clk) begin
	
		if (reset)
			out_duty <= 8'd0;
		else if (slow_tick && btn_up && out_duty < 8'd255)		// increments duty cycle when below the maximum value bound
			out_duty <= out_duty + 8'd1;
		else if (slow_tick && btn_down && out_duty > 8'd0)		// reduces duty cycle when above minimum value bound
			out_duty <= out_duty - 8'd1;
		end
		
endmodule
