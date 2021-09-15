classdef sigProc
    
    properties
        time
        tran
        freq
        dft
        Fs
    end
    
    methods
        function obj = sigProc(filename, fs)
            % Extraction of data from the filename
            T = readmatrix(filename);
            N = size(T,1);
            
            tran = T(:,2:4);
            % Getting rid of the offset
            tran = tran - mean(tran);
            
%             % Linear Normalize
%             maximum = max(max(abs(min(tran)), max(tran)));
%             tran = tran./maximum;
            
            %R = vector sum of X and Y
            tran(:,4) = sqrt(T(:,2).^2 + T(:,3).^2);
                       
          
            % Getting Fourier Tranform
            dft = abs(fft(tran));
            dft = dft(1:N/2+1,:);
            
            % Saving data in object
            obj.Fs  = fs; 
            
            % Saving the transient sig
            obj.time = T(:,1);
            obj.tran.x = tran(:, 1);
            obj.tran.y = tran(:, 2);
            obj.tran.z = tran(:, 3);
            obj.tran.r = tran(:, 4);

            % Saving the frequency domain
            obj.freq = 0:fs/N:fs/2;
            obj.dft.x = dft(:, 1);
            obj.dft.y = dft(:, 2);
            obj.dft.z = dft(:, 3);
            obj.dft.r = dft(:, 4);
        end
        
        function [sfreq, sdft] = fftat(obj, range, dmsn)
            narginchk(2,3)
            if nargin == 2
            % Gets the fft for certain range of frequency
                [sfreq, sdft] = tools.cutoffat(obj.freq, obj.dft.z, range);
            else
                if (dmsn == 'x')
                    [sfreq, sdft] = tools.cutoffat(obj.freq, obj.dft.x, range);
                elseif (dmsn == 'y')
                    [sfreq, sdft] = tools.cutoffat(obj.freq, obj.dft.y, range);
                elseif (dmsn == 'z')    
                    [sfreq, sdft] = tools.cutoffat(obj.freq, obj.dft.z, range);
                elseif (dmnsn == 'r')
                    [sfreq, sdft] = tools.cutoffat(obj.freq, obj.dft.r, range);
                end
            end
        end
        
        function plotdft(obj, range, dmsn)
            [sfreq, sdft] = fftat(obj, range, dmsn);
            plot(sfreq, sdft);
        end
        
        function [freq, prominence] = freqatpeak(obj, range, dmsn)
        % Finds the peak frequency and it's promince between the range
            narginchk(2,3);

            if nargin == 2
                [freq, ft] = obj.fftat(range);
            else
                [freq, ft] = obj.fftat(range, dmsn);
            end

            [val_max, ind_max] = max(ft);
            freq = freq(ind_max);

%             Read refinement
        %     minimum = max([min(zdft(1:ind_zmax)), min(zdft(ind_zmax:end))]);
            minimum = max(ft(1), ft(end));
            prominence = val_max - minimum;
        end
        
    end
    
    methods (Access = private)

    end
end