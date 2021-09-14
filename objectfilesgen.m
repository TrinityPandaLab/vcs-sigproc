%% Files
clear, clc

for section = 1:6
    files{section} = dir("Contact-Sensor-Data\*"+string(section-1)+".csv");
end
save("files.mat", "files")

%% Files_wav
clear, clc

for section = 1:6
    files{section} = dir("Contact-Sensor-Data-wav\*"+string(section-1)+".wav");
end
save("fileswav.mat", "files")

%% Create cell of sigProc objects
clear, clc
load files

for fn = 1:150
    for section  = 1:6
        filelist = files{section};
        filename = filelist(fn).folder + "/" + filelist(fn).name;
        obj{fn,section} = sigProc(filename, 3200);
    end
end
save("obj.mat", "obj") 

%% Get MFCC
clear, clc
load fileswav

for fn = 1:150
    for section = 1:6
        filelist = files{section};
        file = filelist(fn);
        filepath = file.folder+"/"+file.name;
        [audioIn,fs] = audioread(filepath);
        coeffs = mfcc(audioIn,fs);
        output{fn, section} = coeffs(:,:,3);
    end
end

save("output_mfcc.mat", "output")
