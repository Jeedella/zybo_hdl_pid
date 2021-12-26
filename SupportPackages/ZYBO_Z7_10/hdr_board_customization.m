function r = hdlcoder_board_customization
% Board plugin registration file
% 1. Any registration file with this name on MATLAB path will be picked up
% 2. Registration file returns a cell array pointing to the location of 
%    the board plug-ins
% 3. Board plugin must be a package folder accessible from MATLAB path,
%    and contains a board definition file

%   Copyright 2015-2017 The MathWorks, Inc.

r = { ...
    'ZYBO_Z7_10Registration.plugin_board7010', ...
    };
end

% LocalWords:  Zybo
