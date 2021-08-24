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
%%

filenum = 20;

for ii = 1:6
    filelist = files{ii};
    file = filelist(filenum);
    filepath = file.folder+"/"+file.name;
    [audioIn,fs] = audioread(filepath);
    [coeffs,delta,deltaDelta,loc] = mfcc(audioIn,fs);
    coeff{ii} = mean(coeffs(:,:,3));
end

%%

% out0 = coeff{1};
% out1 = coeff{2};
% out2 = coeff{3};
% out3 = coeff{4};
% out4 = coeff{5};
% out5 = coeff{6};
clf
coeffNum = 3:14;
figure(1)
for ii = 1:6
    scatter(coeffNum, coeff{ii}(3:end))
    hold on
end
legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")


%% Histogram of coefficients
% nbins = 60;
% coefficientToAnalyze = 13;
% for ii = 1:6
%     subplot(2,3,ii)
%     histogram(coeff{ii}(:,coefficientToAnalyze+1),nbins,"Normalization","pdf")
% end

