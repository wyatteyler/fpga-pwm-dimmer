# FPGA PWM LED Dimmer

Button controlled PWM LED Dimmer built in Verilog, tested and working on a Zybo Z7-10.

## Overview
Two buttons increase/decrease LED brightness via PWM duty cycle control. Built from five modules, clock division, debouncing, duty cycle, PWM generation, and the top level wiring.

## Architecture
'clk_div.v' - Divides the 125MHz system clock to 59Hz, this makes the a button hold sweep the full brightness range in seconds instead of instantly.
'btn_debounce.v' - Samples the raw button signal into a 4 bit shift register debounce to clean the button input.
'duty_cy.v" - 8 bit duty cycle register that also checks min/max bounds.
'pwm_count.v' - Counts 0-255 and compares against the duty cycle value to produce the PWM signal.
'pwm_top.v' - Top module connecting everything together.

## Other notes
The Zybo Z7's 125MHz reference clock (pin K17) is sourced from the onboard Ethernet PHY and is disabled unless the PHY reset pin (E17) is driven high. 'eth_rst_b' is tied high in 'pwm_top.v' to enable the clock.

## Tools
Vivado, Zybo Z7-10
