function hRD = plugin_rd()
% Reference design definition

%   Copyright 2021 The MathWorks, Inc.

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

hRD.ReferenceDesignName = 'Demo system';
hRD.BoardName = 'ZYBO Z7-10';

% Tool information
hRD.SupportedToolVersion = {'2020.1', '2020.2', '2018.2'};

% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', 'design_led.tcl', ...
    'VivadoBoardPart',      'digilentinc.com:zybo-z7-10:part0:1.0');

%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',   'core_clkwiz/clk_out1', ...
    'ResetConnection',   'sys_core_rstgen/peripheral_aresetn');

% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'axi_cpu_interconnect/M00_AXI', ...
    'BaseAddress',         '0x40010000', ...
    'MasterAddressSpace',  'sys_cpu/Data');

hRD.DeviceTreeName = 'devicetree_axilite.dtb';

% LocalWords:  Vivado ZYBO Tcl tcl digilentinc zybo wiz proc aresetn AXI axi
% LocalWords:  devicetree axilite dtb
