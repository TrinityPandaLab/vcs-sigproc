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
legend( p, "R0", "R1", "R2", "R3", "R4", "R5")
xlim([0 1600])
ylim([0 500])
axh.FontSize = 20;
xlabel("Frequency (Hz)")
ylabel("Amplitude")
axh.Title.String = "Aggregate FFTs";
grid on

%%
xlim([0 120])
ylim([0 250])
axh.Title.String = "Aggregate FFTs in band 0-120 Hz";
grid on

%% 
xlim([500 550])
ylim([0 60])
axh.Title.String = "Aggregate FFTs in band 500-550 Hz";
%%
xlim([825 925])
ylim([0 60])
axh.Title.String = "Aggregate FFTs in band 825-925 Hz";