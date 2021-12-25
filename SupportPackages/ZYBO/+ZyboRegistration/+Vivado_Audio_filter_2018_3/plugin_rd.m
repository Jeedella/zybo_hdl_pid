function hRD = plugin_rd()
% Reference design definition

%   Copyright 2017-2020 The MathWorks, Inc.

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

hRD.ReferenceDesignName = 'Audio System with AXI4 Stream Interface';
hRD.BoardName = 'ZYBO';

% Tool information
hRD.SupportedToolVersion = {'2018.3', '2019.1','2019.2','2020.1','2020.2'};

%% Add custom design files
% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', 'system_top.tcl', ...
    'VivadoBoardPart',      'digilentinc.com:zybo:part0:1.0');

hRD.addIPRepository(...
    'IPListFunction', 'mathworks.hdlcoderdemo.vivado.hdlcoderdemo_ssm2603_iplist');

% Add constraint files
hRD.CustomConstraints = {'ZYBO_audio_filter_demo.xdc'};

%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',     'clk_wiz_0/clk_out1', ...
    'ResetConnection',     'reset_100MHz/peripheral_aresetn',...
    'DefaultFrequencyMHz', 80,...
    'MinFrequencyMHz',     5,...
    'MaxFrequencyMHz',     500,...
    'ClockModuleInstance', 'clk_wiz_0',...
    'ClockNumber',         1);

% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'Interconnect_IP/M02_AXI', ...
    'BaseAddress',         '0x40010000', ...
    'MasterAddressSpace',  'processing_system/Data');

% add AXI4-Stream interface
hRD.addAXI4StreamInterface( ...
    'MasterChannelEnable',      true, ...
    'SlaveChannelEnable',       true, ...
    'MasterChannelConnection', 'DUT_to_I2S/S_AXIS', ...
    'SlaveChannelConnection',  'I2S_to_DUT/M_AXIS', ...
    'MasterChannelDataWidth',   48, ...
    'SlaveChannelDataWidth',    48 ...
    );

hRD.DeviceTreeName = 'devicetree_axilite.dtb';

% LocalWords:  Zynq ZC vlnv xilinx zynq zc AXI axi Addr wiz aresetn IPCORE dma
% LocalWords:  avnet DMAIRQ devicetree axistream dtb Vivado ZYBO xdc axilite
