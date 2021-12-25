%use the "mex -setup" cmmand in the command line to select and the use mingw64 compiler


% idea do the search for the thing once then create a txt file with the
% vivado path in there if this file exists dont search

% carefull to take into acc that this file can also be coppied from one
% person to another so make a fail safe that overwrites old file if not
% correct pc

Current_dir =  pwd;
fprintf('%s\n',Current_dir);
mr = "C:\PathFiles_Vivado\";
%checks if directory exists
if ~exist(mr, 'dir')
       mkdir(mr)
end
rs =fullfile(mr, "Vivado2018_2Path.txt");
result = isfile(rs);


if result == 1
    VivadoPathID = fopen(rs);
    formatSpec = '%s';
    VivadoPath = fscanf(VivadoPathID, formatSpec);
    hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', VivadoPath);
    fclose(VivadoPathID);
    
else
    fprintf("\n vivadoPathFile does not exist yet starting search for path \n when found placed in %s under filename Vivado2018_2Path.txt \n", mr);
    fprintf("search may take some time depending on your storage type (hdd/ssd), storage size and if placed in C: or D: directory\n");
    fprintf("this procedure granted if the safefile is not removed will only be done once, and subsequent launches will be way faster\n");
    filelist=dir(fullfile('C:','**','Vivado\2018.2\bin\vivado.bat'));
    
    if isempty(filelist) == 0
        VivadoPath = append(filelist.folder, '\', filelist.name);
        fprintf("file found\n");
        fprintf('%s\n',VivadoPath);
        %path to local vivado, must be version 2018.2
        hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', VivadoPath)
        
            VivadoPathID = fopen(rs, 'w');
            
            fprintf("\n trying to print the directory bellow \n")
            temp = sprintf("%s", VivadoPath);
            fprintf( "%s" ,temp);
            fprintf(VivadoPathID, "%s", temp);
            fclose(VivadoPathID);
        
    else
        fprintf("vivado not found in C: directory trying D: directory\n");
        filelist=dir(fullfile('D:','**','Vivado\2018.2\bin\vivado.bat'));
        
        if isempty(filelist) == 0
            VivadoPath = append(filelist.folder, "\", filelist.name);
            fprintf("file found\n");
            fprintf('%s\n',VivadoPath);
            %path to local vivado, must be version 2018.2
            
            hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', VivadoPath);
            B = convertCharsToStrings(VivadoPath);
            VivadoPathID = fopen(rs, 'w');
            
            fprintf("\n trying to print the directory bellow \n")
            temp = sprintf("%s", VivadoPath);
            fprintf( "%s" ,temp);
            fprintf(VivadoPathID, "%s", temp);
            fclose(VivadoPathID);
        
        end
        
    end
end

%add path to the custom board disign, should not be changed
%addpath(fullfile('.','customboards','ZYBO'))
%addpath(fullfile('.','SupportPackages','ZYBO_Z7_10_2'))
%addpath(fullfile('.','SupportPackages','ZYBO_Z7_10'))
%addpath(fullfile('.','SupportPackages','ZYBO_Z7_20'))
addpath(fullfile('.','SupportPackages','ZYBO'))
%enable the model property EnableLBRepository. Your library can appear
%in the browser only if this property is on when you save your library.
%set_param(gcs,'EnableLBRepository','on');
%add libraries to simulink library browser
%addpath('Cstm_Interfaces');

%sampling time and frequency
t_sample = 0.0005;  %desired sampling time
f_pga = 100 * 10^6;                     %fpga clock frequency, 100MHz
t_fpga = 1/f_pga;                       %fpga clock time period
oversampleFactor = t_sample / t_fpga;   %factor used in HDL coder, copy this number when using HDL workflow advisor
%open simulink model
open_system('gm_Encoder_test')
open_system('hdlcoder_led_blinking_4bit')