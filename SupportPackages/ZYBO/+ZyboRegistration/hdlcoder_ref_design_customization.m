function [rd, boardName] = hdlcoder_ref_design_customization
% Reference design plugin registration file
% 1. The registration file with this name inside of a board plugin folder 
%    will be picked up
% 2. Any registration file with this name on MATLAB path will also be picked up
% 3. The registration file returns a cell array pointing to the location of 
%    the reference design plugins
% 4. The registration file also returns its associated board name
% 5. Reference design plugin must be a package folder accessible from 
%    MATLAB path, and contains a reference design definition file

%   Copyright 2015-2019 The MathWorks, Inc.

rd = {'ZyboRegistration.Vivado_Audio_filter_2017_2.plugin_rd', ...
      'ZyboRegistration.Vivado_Audio_filter_2018_2.plugin_rd', ...
	  'ZyboRegistration.Vivado_Audio_filter_2018_3.plugin_rd', ...
      'ZyboRegistration.Vivado2014_2.plugin_rd', ...
      'ZyboRegistration.Vivado2016_4.plugin_rd', ...
      'ZyboRegistration.Vivado2017_2.plugin_rd', ...
      'ZyboRegistration.Vivado2018_2.plugin_rd', ...
     };

boardName = 'ZYBO';
end

% LocalWords:  plugins Zybo Vivado ZYBO
