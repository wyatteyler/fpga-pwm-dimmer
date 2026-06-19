module duty_cy (
	input clk,
	input reset,
	input slow_tick,
	input btn_up,
	input btn_down,
	output reg [7:0] out_duty );
	
	always @(posedge clk) begin
	
		if (reset)
			out_duty <= 8'd0;
		else if (slow_tick && btn_up && out_duty < 8'd255)
			out_duty <= out_duty + 8'd1;
		else if (slow_tick && btn_down && out_duty > 8'd0)
			out_duty <= out_duty - 8'd1;
		end
		
endmodule
