classdef tools
    methods(Static)
        
        function output = log_prob(z, bHat)
        % Logarithmic Fit, logit function
            b = 1.5;
            output = (b.^(bHat(1)+ bHat(2).*z(:,1)+ bHat(3).*z(:,2)))./(1 + b.^(bHat(1) + bHat(2).*z(:,1)+ bHat(3).*z(:,2)));
        end
        
        function [freq, zdft] = dft(sig, Fs)
        %
            % Getting rid of the offset
            sig = sig - mean(sig);

            % Calc Fourier Tranformation
            N = length(sig);
            zdft = abs(fft(sig));
            zdft = zdft(1:N/2+1);
            freq = 0:Fs/length(sig):Fs/2;

            %Getting rid of freq 0
            freq = freq(1:end);
            zdft = zdft(1:end);
        end
        
        function [freq, dft] = cutoffat(freq, dft, threshold)
        % Splice the dft data for given frequency(ies)
        % Mode 0 - get right side of thereshold
        % Mode 1 - get left side of thereshold
        % Mode 2 - get dft for freq between of theresholds
            index_1 = find(freq > threshold(1), 1);
            index_2 = find(freq > threshold(2), 1);
            freq = freq(index_1:index_2);
            dft = dft(index_1:index_2);
        end
    end
end