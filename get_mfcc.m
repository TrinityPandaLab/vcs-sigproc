%% File Extraction
clear, clc
load fileswav

%% Get MFCC
for filenum = 1:150
    for section = 1:6
        filelist = files{section};
        file = filelist(filenum);
        filepath = file.folder+"/"+file.name;
        [audioIn,fs] = audioread(filepath);
        coeffs = mfcc(audioIn,fs);
        output{filenum, section} = coeffs(:,:,3);
    end
end

% save("output_mfcc.mat", "output")

%% Averanger and Normalizer
clear, clc
load output_mfcc
for section = 1:6
    for filenum = 1:150
        fileid = 150 * (section-1) + filenum;
        avg14(fileid,:) = [filenum, section, mean(output{filenum, section})];
    end
end
avg14(:,3:end) = normalize(avg14(:,3:end),1);
clear filenum fileid section

%% Stratify
for section = 1:6
    outav(:,section, :) = avg14(avg14(:,2) == section,3:end);
end
clear filenum section

%% Get Average of features
featav(:,:) = mean(outav);
featsd(:,:) = std(outav);
% save feat_summary


%% ErrPlot
clc, clear
load feat_summary
clf
coeffNum = 1:14;
for section = 1:6
    res{section} = [coeffNum(:), featav(section,coeffNum)', featsd(section,coeffNum)'];
end
sc = scatter_plots(res, 0);

%% Plot the feats
load output_mfcc
for fn = 1
    figure(fn)
    clf
    for section = 1:6
        subplot(2,3, section)
        plot(1:98, output{fn,section})
    end
end