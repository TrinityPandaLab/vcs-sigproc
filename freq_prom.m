function res = freq_prom(in_str, range)
    % Creates vectior if max_freq and the prominence
    d = dir(in_str);
    
    for ii = 1:size(d,1)
        filename = d(ii).folder + "/" + d(ii).name;
        obj = sigProc(filename, 3200);
        
        [zfreq, prominence] = obj.freqatpeak(range);
%         [zfreq, prominence] = freqatpeak(obj, range);
        res(ii,:) = [zfreq, prominence];
    end
end