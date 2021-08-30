function res = freq_prom(dirr, range)
    % Creates vector of max_freq and the prominence
    
    for ii = 1:size(dirr,1)
        filename = dirr(ii).folder + "/" + dirr(ii).name;
        obj = sigProc(filename, 3200);
        
        [zfreq, prominence] = obj.freqatpeak(range);
%         [zfreq, prominence] = freqatpeak(obj, range);
        res(ii,:) = [zfreq, prominence];
    end
end