clc, clf, clear
d = dir("ContactSensorData/06061547_2_1.5_3200_1_b02.csv");
filename = d(1).name;
filename = strcat('ContactSensorData/' , filename);
T = readmatrix(filename);

% Extraction of data from the marix
t = T(:,1);     % time
z = T(:,4);     % acc
z = z - mean(z);

Fs = 3200;
N = length(z);
zdft = fft(z);
zdft = zdft(1:N/2+1);
zdft = zdft(2:end);

freq = 0:Fs/length(zdft):Fs/2;

zdft(freq < 50 | freq > 70) = 0;
z = ifft(zdft);
t = t(1:end/2);

%% Attempt
for k = 1:2
    vec_a = exp(k*t).*z;
    fft(vec_a);

    N = length(z);
    ldft = fft(vec_a);
    ldft = ldft(1:end/2+1);
    lap(k) = abs(ldft(66));
end

%% Plot
figure(1)
clf
plot(real(z))

% figure(1)
% clf
% plot(t,vec_a)

figure(2)
clf
plot(abs(ldft));

figure(3)
clf
plot(lap)