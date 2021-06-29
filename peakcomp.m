function res = peakcomp(in_str, range)
    d = dir(in_str);
    first_file = d(1).name;
    last_file = d(end).name;
    
    for ii = 1:size(d,1)
        filename = d(ii).name;
        filename = strcat('ContactSensorData/' , filename);
        T = readmatrix(filename);
        
        [zfreq, prominence] = freqatpeak(T, range);
        res(ii,:) = [zfreq, prominence];
    end
end