## PWM Project - Zybo Z7 Constraints
## clk, reset, btn_up_raw, btn_down_raw, out_pwm

## Clock signal (125 MHz)
set_property -dict { PACKAGE_PIN K17  IOSTANDARD LVCMOS33 } [get_ports { clk }]; #Sch=sysclk
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];

## Ethernet PHY reset - must be driven HIGH or the 125MHz clock on K17 will not run
set_property -dict { PACKAGE_PIN E17  IOSTANDARD LVCMOS33 } [get_ports { eth_rst_b }]; #Sch=eth_rst_b

## Buttons
## btn[0] = reset
## btn[1] = btn_up_raw
## btn[2] = btn_down_raw
set_property -dict { PACKAGE_PIN K18  IOSTANDARD LVCMOS33 } [get_ports { reset }];        #Sch=btn[0]
set_property -dict { PACKAGE_PIN P16  IOSTANDARD LVCMOS33 } [get_ports { btn_up_raw }];   #Sch=btn[1]
set_property -dict { PACKAGE_PIN K19  IOSTANDARD LVCMOS33 } [get_ports { btn_down_raw }]; #Sch=btn[2]

## LED (PWM output)
set_property -dict { PACKAGE_PIN M14  IOSTANDARD LVCMOS33 } [get_ports { out_pwm }]; #Sch=led[0]
