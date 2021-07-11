function res = freq_prom(in_str, range)
    % Creates vectior if max_freq and the prominence
    d = dir(in_str);
    for ii = 1:size(d,1)
        filename = d(ii).name;
        filename = strcat('Contact-Sensor-Data/' , filename);
        obj = sigProc(filename, 800);
        
        [zfreq, prominence] = freqatpeak(obj, range);
%         [zfreq, prominence] = freqatpeak(obj, range);
        res(ii,:) = [zfreq, prominence];
    end
end