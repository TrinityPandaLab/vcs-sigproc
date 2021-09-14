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
save ("averenger.mat", "avgfft", "stdfft")

%% Plot
clear, clc
load averenger
load colorcode

range = [0 1600];

clf
axh = axes();

for section = 1:6
    p(section) = ciplot(avgfft{section}, stdfft{section}, colmap(section,:), 0.2, axh);
    hold on
end
legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")
