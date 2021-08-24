%% File Extraction
clear, clc

str = 'Contact-Sensor-Data/*.csv';
filelist = dir(str);

%%
for ii  = 1:1169
    filename = filelist(ii).folder + "/" + filelist(ii).name;
    outfilename = filelist(ii).folder + "-wav/" + replace(filelist(ii).name, 'csv','wav');
    tools.csvtowav(filename, outfilename, 3200)
end