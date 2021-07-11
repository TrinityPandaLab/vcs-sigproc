function [zfreq, prominence] = freqatpeak(obj, threshold)
% Finds the peak frequency and it's promince between the threshold
    narginchk(1,2);
    
    if nargin == 2
        [freq, zdft] = obj.fftat(threshold);
    else
        freq = obj.freq;
        zdft = obj.dft.z;
    end
    
    [zmax, ind_zmax] = max(zdft);
    zfreq = freq(ind_zmax);
    
%     minimum = max([min(zdft(1:ind_zmax)), min(zdft(ind_zmax:end))]);
    minimum = max(zdft(1), zdft(end));
    prominence = zmax - minimum;
end