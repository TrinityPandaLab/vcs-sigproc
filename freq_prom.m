function res = freq_prom(in_str, range, dmsn)
    % Creates vectior if max_freq and the prominence
    narginchk(2,3);
    if nargin == 2
        dmsn = 'z';
    end
    d = dir(in_str);
    
    for ii = 1:size(d,1)
        filename = d(ii).folder + "/" + d(ii).name;
        obj = sigProc(filename, 3200);
        
        [zfreq, prominence] = obj.freqatpeak(range, dmsn);
%         [zfreq, prominence] = freqatpeak(obj, range);
        res(ii,:) = [zfreq, prominence];
    end
end