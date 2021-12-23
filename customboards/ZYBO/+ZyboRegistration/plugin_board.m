function hB = plugin_board()
% Board definition

%   Copyright 2015-2017 The MathWorks, Inc.

% Construct board object
hB = hdlcoder.Board;

hB.BoardName    = 'ZYBO';

% FPGA device information
hB.FPGAVendor   = 'Xilinx';
hB.FPGAFamily   = 'Zynq';
hB.FPGADevice   = 'xc7z010';
hB.FPGAPackage  = 'clg400';
hB.FPGASpeed    = '-1';

% Tool information
hB.SupportedTool = {'Xilinx Vivado'};

% FPGA JTAG chain position
hB.JTAGChainPosition = 2;

%% Add interfaces
% Standard "External Port" interface
hB.addExternalPortInterface( ...
    'IOPadConstraint', {'IOSTANDARD = LVCMOS33'});

% Custom board external I/O interface
hB.addExternalIOInterface( ...
    'InterfaceID',    'LEDs General Purpose', ...
    'InterfaceType',  'OUT', ...
    'PortName',       'LEDs', ...
    'PortWidth',      4, ...
    'FPGAPin',        {'M14', 'M15', 'G14', 'D18'}, ...
    'IOPadConstraint', {'IOSTANDARD = LVCMOS33'});

hB.addExternalIOInterface( ...
     'InterfaceID',    'Push Buttons', ...
     'InterfaceType',  'IN', ...
     'PortName',       'PushButtons', ...
     'PortWidth',      4, ...
     'FPGAPin',        {'R18', 'P16', 'V16', 'Y16'}, ...
     'IOPadConstraint', {'IOSTANDARD = LVCMOS33'});
 
 hB.addExternalIOInterface( ...
	'InterfaceID',    'Slide switches ', ...
	'InterfaceType',  'IN', ...
	'PortName',       'SlideSwitches', ...
	'PortWidth',      4, ...
	'FPGAPin',        {'G15', 'P15', 'W13', 'T16'}, ...
	'IOPadConstraint', {'IOSTANDARD = LVCMOS33'});

% LocalWords:  ZYBO Zynq xc Vivado JTAG IOSTANDARD LVCMOS