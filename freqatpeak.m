function [zfreq, prominence] = freqatpeak(T, threshold)
% Finds the peak frequency and it's promince between the threshold
    narginchk(1,2);
    
    Fs = 3200;      % Sampling Frequency  
    z = T(:,4);     % acc in z-direction
    
    % Getting rid of the offset
    offset = mean(z);
    z = z - offset;
    freq = 0:Fs/length(z):Fs/2;
   
    % Calc Fourier Tranformation for Z-axis
    N = length(z);
    zdft = fft(z);
    zdft = zdft(1:N/2+1);
    zdft = abs(zdft);
    
    if nargin == 2
        [freq, zdft] = cutoffat(freq,zdft,threshold, 2);
    end
    
    [zmax, ind_zmax] = max(abs(zdft));
    zfreq = freq(ind_zmax);
    
%     minimum = max([min(zdft(1:ind_zmax)), min(zdft(ind_zmax:end))]);
    minimum = max(zdft(1), zdft(end));
    prominence = zmax - minimum;
end