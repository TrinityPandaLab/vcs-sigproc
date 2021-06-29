% Filename testing
clear, clc
d = dir('ContactSensorData/*060815*_1.5_*_1.csv');
% d = d(1:end)

for ii = 1:size(d,1)
    if d(ii).name == '06071600_1_1.5_3200_1.csv'
        break
    end
end

