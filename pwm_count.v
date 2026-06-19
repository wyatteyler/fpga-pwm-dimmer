module pwm_count (
	input clk,
	input reset,
	input [7:0] in_duty,
	output out_pwm );
	
	reg [7:0] count;

	always @(posedge clk) begin
		if (reset) 
			count <= 8'd0;
		else 
			count <= count + 8'd1;			
		end
			
	assign out_pwm = count < in_duty;

endmodule
		