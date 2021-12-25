# ZYBO Z7-10 & Z7-20 Audio Codec
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports Bit_clock]; 
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports MCLK];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports MUTEN]; 
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports Serial_data_out]; 
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports PBCLK];
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports Serial_data_in]; 
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports RECLK]; 
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports I2C_CLK]; 
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports I2C_DATA]; 
