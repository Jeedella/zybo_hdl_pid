# ZYBO Audio Codec
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports Bit_clock]; 
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports MCLK];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports MUTEN]; 
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports Serial_data_out]; 
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports PBCLK];
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports Serial_data_in]; 
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports RECLK]; 
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports I2C_CLK]; 
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports I2C_DATA]; 