function hRD = plugin_rd()
% Reference design definition

%   Copyright 2017-2018 The MathWorks, Inc.

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

hRD.ReferenceDesignName = 'Default';
hRD.BoardName = 'ZYBO Z7-10';

% Tool information
hRD.SupportedToolVersion = {'2018.2'};

% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', 'design_led.tcl');

%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',   'clk_wiz_0/clk_out1', ...
    'ResetConnection',   'proc_sys_reset_0/peripheral_aresetn');

% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'axi_interconnect_0/M00_AXI', ...
    'BaseAddress',         '0x40010000', ...
    'MasterAddressSpace',  'processing_system7_0/Data');

hRD.DeviceTreeName = 'devicetree_axilite.dtb';

% LocalWords:  Vivado ZYBO Tcl tcl digilentinc zybo wiz proc aresetn AXI axi
% LocalWords:  devicetree axilite dtb
