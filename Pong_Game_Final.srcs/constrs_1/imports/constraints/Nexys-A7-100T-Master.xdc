# Nexys A7-100T Pong Game Constraints
# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# VGA signals
set_property PACKAGE_PIN F17 [get_ports vga_R]
set_property IOSTANDARD LVCMOS33 [get_ports vga_R]

set_property PACKAGE_PIN F18 [get_ports vga_G]
set_property IOSTANDARD LVCMOS33 [get_ports vga_G]

set_property PACKAGE_PIN G17 [get_ports vga_B]
set_property IOSTANDARD LVCMOS33 [get_ports vga_B]

set_property PACKAGE_PIN E17 [get_ports vga_h_sync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_h_sync]

set_property PACKAGE_PIN D17 [get_ports vga_v_sync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_v_sync]

# Quadrature decoders
set_property PACKAGE_PIN B18 [get_ports quadA]
set_property IOSTANDARD LVCMOS33 [get_ports quadA]

set_property PACKAGE_PIN A18 [get_ports quadB]
set_property IOSTANDARD LVCMOS33 [get_ports quadB]
