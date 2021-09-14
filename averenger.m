% File Extraction
clear, clc
load files

%Create cell of sigProc objects
for fn = 1:150
    for section  = 1:6
        filelist = files{section};
        filename = filelist(fn).folder + "/" + filelist(fn).name;
        obj{fn,section} = sigProc(filename, 3200);
    end
end
clear fn section filelist filename
save obj

%% Get Average
clear, clc
load obj
for section = 1:6
    count = 1;
    for filenum = 1:150
        zdft(count,:) = obj{filenum,section}.dft.z;
        count = count+1;
    end
    avgfft{section} = mean(zdft);
    stdfft{section} = std(zdft);
end
clear count section zdft files obj filenum
save averenger

%% Plot

clear, clc
load averenger
range = [0 1600];

load colorcode
clf
axh = axes();

for section = 1:6
    p(section) = ciplot(avgfft{section}, stdfft{section}, colmap(section,:), 0.2, axh);
    hold on
end

legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")
