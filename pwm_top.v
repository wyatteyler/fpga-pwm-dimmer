module pwm_top (
	input clk,						// connected to pin K17
	input reset,
	input btn_up_raw,				// btn_up_raw is connected to one of the button pins, same for btn_down_raw
	input btn_down_raw,
	output eth_rst_b,				// connected to pin E17
	output out_pwm );
	
	assign eth_rst_b = 1'b1;		// required for the 125MHz clock on pin K17 to run on Zybo Z7-10, holds Ethernet PHY out of reset 
	
	wire [7:0] out_duty;
	wire slow_tick;
	wire btn_up_clean;				// two btn_debounce instances for both btn_up and btn_down, need wire for both
	wire btn_down_clean;
	
	clk_div u_clkdiv (
		.clk(clk),
		.reset(reset),
		.slow_tick(slow_tick) );
		
	btn_debounce u_up_debounce (
		.clk(clk),
		.reset(reset),
		.slow_tick(slow_tick),
		.btn_raw(btn_up_raw),
		.btn_clean(btn_up_clean) );
		
	btn_debounce u_down_debounce (
		.clk(clk),
		.reset(reset),
		.slow_tick(slow_tick),
		.btn_raw(btn_down_raw),
		.btn_clean(btn_down_clean) );
		
	duty_cy u_duty_cy (
		.clk(clk),
		.reset(reset),
		.slow_tick(slow_tick),
		.btn_up(btn_up_clean),
		.btn_down(btn_down_clean),
		.out_duty(out_duty) );
		
	pwm_count u_pwm (
		.clk(clk),
		.reset(reset),
		.in_duty(out_duty),
		.out_pwm(out_pwm) );
endmodule
