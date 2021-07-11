classdef tools
    methods(Static)
        
        function output = log_prob(z, bHat)
        % Logarithmic Fit, logit function
            b = 1.5;
            output = (b.^(bHat(1)+ bHat(2).*z(:,1)+ bHat(3).*z(:,2)))./(1 + b.^(bHat(1) + bHat(2).*z(:,1)+ bHat(3).*z(:,2)));
        end
        
        function [freq, dft] = dft(sig, Fs)
        % Static DFT function
            % Getting rid of the offset
            sig = sig - mean(sig);

            % Calc Fourier Tranformation
            N = length(sig);
            dft = abs(fft(sig));
            dft = dft(1:N/2+1);
            freq = 0:Fs/length(sig):Fs/2;

            %Getting rid of freq 0
            freq = freq(1:end);
            dft = dft(1:end);
        end
        
        function [x1, x2] = cutoffat(x1, x2, range)
        % Splice the dft data for given frequencies
        % get dft for freq between of theresholds
            index_1 = find(x1 > range(1), 1);
            index_2 = find(x1 > range(2), 1);
            x1 = x1(index_1:index_2);
            x2 = x2(index_1:index_2);
        end
        
        function [x1, prominence] = x1_atpeak_x2(x1, x2, range)
        % Finds the x1 at peak x2 and it's promince between the range
            narginchk(1,2);

            if nargin == 2
                [x1, x2] = tools.cutoff(x1,x2,range);
            end

            [x2max, ind_x2max] = max(x2);
            x1 = x1(ind_x2max);

            minimum = max(x2(1), x2(end));
            prominence = x2max - minimum;
        end
    end
end