# Debounce button and config finished LED
set_property PACKAGE_PIN R18 [get_ports button_debounce]
set_property PACKAGE_PIN M14 [get_ports led_config_finished]

# Top JE
set_property PACKAGE_PIN H15 [get_ports ov7670_reset]
set_property PACKAGE_PIN J16 [get_ports {ov7670_d[1]}]
set_property PACKAGE_PIN W16 [get_ports {ov7670_d[3]}]
set_property PACKAGE_PIN V12 [get_ports {ov7670_d[5]}]

# Bottom JE
set_property PACKAGE_PIN Y17 [get_ports ov7670_pwdn]
set_property PACKAGE_PIN T17 [get_ports {ov7670_d[0]}]
set_property PACKAGE_PIN U17 [get_ports {ov7670_d[2]}]
set_property PACKAGE_PIN V13 [get_ports {ov7670_d[4]}]

# Top JD
set_property PACKAGE_PIN R14 [get_ports {ov7670_d[7]}]
set_property PACKAGE_PIN P14 [get_ports ov7670_pclk]
set_property PACKAGE_PIN T15 [get_ports ov7670_vsync]
set_property PACKAGE_PIN T14 [get_ports ov7670_sioc]

# Bottom JD
set_property PACKAGE_PIN V18 [get_ports {ov7670_d[6]}]
set_property PACKAGE_PIN V17 [get_ports ov7670_xclk]
set_property PACKAGE_PIN U15 [get_ports ov7670_href]
set_property PACKAGE_PIN U14 [get_ports ov7670_siod]

# Red channel of VGA output
set_property PACKAGE_PIN M19 [get_ports {RED_O[0]}]
set_property PACKAGE_PIN L20 [get_ports {RED_O[1]}]
set_property PACKAGE_PIN J20 [get_ports {RED_O[2]}]
set_property PACKAGE_PIN G20 [get_ports {RED_O[3]}]
set_property PACKAGE_PIN F19 [get_ports {RED_O[4]}]

# Green channel of VGA output
set_property PACKAGE_PIN H18 [get_ports {GREEN_O[0]}]
set_property PACKAGE_PIN N20 [get_ports {GREEN_O[1]}]
set_property PACKAGE_PIN L19 [get_ports {GREEN_O[2]}]
set_property PACKAGE_PIN J19 [get_ports {GREEN_O[3]}]
set_property PACKAGE_PIN H20 [get_ports {GREEN_O[4]}]
set_property PACKAGE_PIN F20 [get_ports {GREEN_O[5]}]
# Blue channel of VGA output
set_property PACKAGE_PIN P20 [get_ports {BLUE_O[0]}]
set_property PACKAGE_PIN M20 [get_ports {BLUE_O[1]}]
set_property PACKAGE_PIN K19 [get_ports {BLUE_O[2]}]
set_property PACKAGE_PIN J18 [get_ports {BLUE_O[3]}]
set_property PACKAGE_PIN G19 [get_ports {BLUE_O[4]}]

# Horizontal and vertical synchronization of VGA output
set_property PACKAGE_PIN P19 [get_ports HSYNC_O]
set_property PACKAGE_PIN R19 [get_ports VSYNC_O]

# Voltage levels
set_property IOSTANDARD LVCMOS33 [get_ports button_debounce]
set_property IOSTANDARD LVCMOS33 [get_ports led_config_finished]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_pclk]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_sioc]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_reset]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_pwdn]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_href]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_xclk]
set_property IOSTANDARD LVCMOS33 [get_ports ov7670_siod]
set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_d[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RED_O[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GREEN_O[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BLUE_O[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports HSYNC_O]
set_property IOSTANDARD LVCMOS33 [get_ports VSYNC_O]

# Magic
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ov7670_pclk_IBUF]