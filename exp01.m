%% File Extraction
clear, clc

str0 = 'Contact-Sensor-Data-wav/*_0.wav';
str1 = 'Contact-Sensor-Data-wav/*_1.wav';
str2 = 'Contact-Sensor-Data-wav/*_2.wav';
str3 = 'Contact-Sensor-Data-wav/*_3.wav';
str4 = 'Contact-Sensor-Data-wav/*_4.wav';
str5 = 'Contact-Sensor-Data-wav/*_5.wav';


% Cell of structs
files{1} = dir(str0);
files{2} = dir(str1);
files{3} = dir(str2);
files{4} = dir(str3);
files{5} = dir(str4);
files{6} = dir(str5);
clear str0 str1 str2 str3 str4 str5

for filenum = 1:100
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
    for filenum = 1:100
        fileid = 100 * (section-1) + filenum;
        avngr(fileid,:) = [filenum, section,mean(output{filenum, section})];
    end
end
avngr(:,3:end) = normalize(avngr(:,3:end),1);
clear filenum fileid section

%% Stratify
for section = 1:6
    outav(:,section, :) = avngr(avngr(:,2) == section,3:end);
end
clear filenum section

featav(:,:) = mean(outav);
featsd(:,:) = std(outav);


%% Ciplot
clf
for section = 1:6
    res{section} = [coeffNum(:), featav(section,:)', featsd(section,:)'];
end
scatter_plots_err(res)


%% Scatter
coeffNum = 1:14;
sp = 1;
for filenum = 1:5
%     subplot(2,3, sp)
    figh = figure(sp);
    clf
    feat(:,:) = outav(filenum,:,:);
    for ii = 1:6
        res{ii} = [coeffNum(:), feat(ii, coeffNum)'];
    end
    scatter_plots(res)
    sp = sp + 1;
end
clear feat

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
