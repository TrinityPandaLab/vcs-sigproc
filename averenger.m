% clc, clear
% % This script averages all the plots and plots it

% d = dir("ContactSensorData/*_0_*_b02.csv");
% for ii = 1:size(d,1)
%     filename = d(ii).name;
%     filename = strcat('ContactSensorData/' , filename);
%     T = readmatrix(filename);
%     
%     % Extraction of data from the marix
%     z = T(:,4);     % acc
% 
%     % Getting rid of the offset
%     z = z - mean(z);
% 
%     % Calc Fourier Tranformation
%     N = length(z);
%     zdft = abs(fft(z));
%     zdft = zdft(1:N/2+1);
%     zdft = zdft(2:end).';
%     
%     array_zdft0(ii,:) = zdft;
% end
 

% d = dir("ContactSensorData/*_1_*_b21.csv");
% for ii = 1:size(d,1)
%     filename = d(ii).name;
%     filename = strcat('ContactSensorData/' , filename);
%     T = readmatrix(filename);
%     
%     % Extraction of data from the marix
%     z = T(:,4);     % acc
% 
%     % Getting rid of the offset
%     z = z - mean(z);
% 
%     % Calc Fourier Tranformation
%     N = length(z);
%     zdft = abs(fft(z));
%     zdft = zdft(1:N/2+1);
%     zdft = zdft(2:end).';
%     
%     array_zdft1(ii,:) = zdft;
% end
 

% d = dir("ContactSensorData/*_2_*_b02.csv");
% for ii = 1:size(d,1)
%     filename = d(ii).name;
%     filename = strcat('ContactSensorData/' , filename);
%     T = readmatrix(filename);
%     
%     % Extraction of data from the marix
%     z = T(:,4);     % acc
% 
%     % Getting rid of the offset
%     z = z - mean(z);
% 
%     % Calc Fourier Tranformation
%     N = length(z);
%     zdft = abs(fft(z));
%     zdft = zdft(1:N/2+1);
%     zdft = zdft(2:end).';
%     
%     array_zdft2(ii,:) = zdft;
% end

% std_dft0 = std(array_zdft0);
% std_dft1 = std(array_zdft1);
% std_dft2 = std(array_zdft2);


clear, clc
load('averenger.mat')
figure(1)
clf
axh3 = axes();

p(1) = ciplot(mean_dft0, std_dft0, [0 0.3 0.6], 0.2, axh3);
p(2) = ciplot(mean_dft1, std_dft1, [0 .8 .5], 0.2, axh3);
p(3) = ciplot(mean_dft2, std_dft2, [0.7 0.2 0.4], 0.2, axh3);

xlim([0 100])
xlabel("Frequency(Hz)")
ylabel("Amplitude")
title("Aggregate of FFT in Band 0 - 100 Hz")
legend(p, "Untouched", "Region 1", "Region 2")
axh3.FontSize = 26;
