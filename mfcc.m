%% File Extraction
clear, clc
load fileswav

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
clear coeffs audioIn filenum section filelist file filepath

%% Averanger and Normalizer
for section = 1:6
    for filenum = 1:150
        fileid = 150 * (section-1) + filenum;
        avngr(fileid,:) = [filenum, section, mean(output{filenum, section})];
    end
end
avngr(:,3:end) = normalize(avngr(:,3:end),1);
clear filenum fileid section

%% Stratify
for section = 1:6
    outav(:,section, :) = avngr(avngr(:,2) == section,3:end);
end
clear filenum section

%% 10 vs 13
clf
for ii = 1:6
    res{ii} = [outav(:,ii,8),outav(:,ii,10)];
end
scatter_plots(res)

%% Get Average of features
featav(:,:) = mean(outav);
featsd(:,:) = std(outav);
% save mfccfeat


%% ErrPlot
load feats
clf
coeffNum = 1:14;
for section = 1:6
    res{section} = [coeffNum(:), featav(section,coeffNum)', featsd(section,coeffNum)'];
end
scatter_plots(res, 0)


%% Scatter
% coeffNum = 1:14;
% sp = 1;
% for filenum = 1
% %     subplot(2,3, sp)
%     figh = figure(sp);
%     clf
%     feat(:,:) = outav(filenum,:,:);
%     for ii = 1:6
%         res{ii} = [coeffNum(:), feat(ii, coeffNum)'];
%     end
%     scatter_plots(res)
%     sp = sp + 1;
% end
% clear feat

%% Plots for features
% coeffNum = 1:14;
% featureSeg = 1:98;
% for filenum = 1:5
%     figh = figure(filenum);
%     clf
%     for section = 1:6
%         subplot(3,2,section)
%         plot(featureSeg,output{filenum, section})
%     end
% end
