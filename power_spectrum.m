clc, clear

% Sampling Frequency
Fs = 3200;

final_section = 1;
% section = 2;
set_num = 1;
% plot_num = section/final_section + 1;
%% Table extraction
d = dir("ContactSensorData\*_b3.csv");
filename = d(set_num).name;
filename = strcat('ContactSensorData/' , filename);
T = readmatrix(filename);

%% Calculations

% Extraction of data from the marix
t = T(:,1);     % time
z = T(:,4);     % acc

% Getting rid of the offset
z = z - mean(z);

% Calc Fourier Tranformation
N = length(z);
zdft = fft(z);
zdft = zdft(1:N/2+1);
freq = 0:Fs/length(z):Fs/2;

%Getting rid of freq 0
freq = freq(2:end);
zdft = zdft(2:end);

%% Plot Oscillation
% figure(1)
% % subplot(2,1,plot_num)

% plot(t,z)
% xlabel("Time")
% ylabel("Acceleration in Z-axis")

%% Fourier Transformation Plot

% % Filter
% m = abs(zdft);
% zdft(m < 0.05*max(m)) = 0;

% figure(2)
% % subplot(2,1,plot_num)
% findpeaks(abs(zdft),'MinPeakProminence',0.1*max(m), 'MinPeakDistance',30)

% plot(freq, abs(zdft))
% grid on
% title("FFT of " + filename)
% xlabel('Frequency (Hz)')

% xlim([0 200])
% ylim([0 4500])