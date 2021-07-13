classdef sigProc
    
    properties
%         time
%         tran
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
            tran(:,4) = sqrt(T(:,2).^2 + T(:,3).^2);
            
            % Getting rid of the offset
            tran = tran - mean(tran);
          
            % Getting Fourier Tranform
            dft = abs(fft(tran));
            dft = dft(1:N/2+1,:);
            
            % Saving data in object
            obj.Fs  = fs; 
            
%             % Saving the transient sig
%             obj.time = T(:,1)
%             obj.tran.x = tran(:, 1);
%             obj.tran.x = tran(:, 2);
%             obj.tran.x = tran(:, 3);
%             obj.tran.r = tran(:, 4);

            % Saving the frequency domain
            obj.freq = 0:fs/N:fs/2;
            obj.dft.x = dft(:, 1);
            obj.dft.y = dft(:, 2);
            obj.dft.z = dft(:, 3);
            obj.dft.r = dft(:, 4);
        end
        
        function [freq, dft] = fftat(obj, range, dmsn)
            narginchk(2,3)
            if nargin == 2
            % Gets the fft for certain range of frequency
                [freq, dft] = tools.cutoffat(obj.freq, obj.dft.z, range);
            else
                if (dmsn == 'x')
                    [freq, dft] = tools.cutoffat(obj.freq, obj.dft.z, range);
                elseif (dmsn == 'y')
                    [freq, dft] = tools.cutoffat(obj.freq, obj.dft.z, range);
                elseif (dmsn == 'z')    
                    [freq, dft] = tools.cutoffat(obj.freq, obj.dft.z, range);
                elseif (dmsn == 'r')
                    [freq, dft] = tools.cutoffat(obj.freq, obj.dft.r, range);
                end
            end
        end
        
        function plotdft(obj, dmsn)
            % Plots the dft for one dimension
            if dmsn == 'x'
                plot(obj.freq, obj.dft.x)
            elseif dmsn == 'y'
                plot(obj.freq, obj.dft.y)
            elseif dmsn == 'z'
                plot(obj.freq, obj.dft.z)
            elseif dmsn == 'r'
                plot(obj.freq, obj.dft.r)
            end         
        end
        
        function [freq, prominence] = freqatpeak(obj, range, dmsn)
        % Finds the peak frequency and it's promince between the range
            narginchk(2,3);

            if nargin == 3
                [freq, ft] = obj.fftat(range, dmsn);
            else
                [freq, ft] = obj.fftat(range);
            end

            [zmax, ind_zmax] = max(ft);
            freq = freq(ind_zmax);

        %     minimum = max([min(zdft(1:ind_zmax)), min(zdft(ind_zmax:end))]);
            minimum = max(ft(1), ft(end));
            prominence = zmax - minimum;
        end
        
    end
    
    methods (Access = private)

    end
end