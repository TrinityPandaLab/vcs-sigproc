classdef sigProc
    
    properties
        time
        freq
        tran
        dft
        Fs
    end
    
    methods
        function obj = sigProc(filename, fs)
            
            obj.Fs  = fs; 
            
            % Extraction of data from the filename
            T = readmatrix(filename);
            obj.time = T(:,1);     % time
            obj.freq = 0:fs/length(obj.time):fs/2;
            tran = T(:,2:4);
            
            % Getting rid of the offset
            tran = tran - mean(tran);
          
            % Getting Fourier Tranform
            dft = abs(fft(tran));
            N = size(dft,1);
            dft = dft(1:N/2+1,:);
            
            % Saving the transient sig
            obj.tran.x = tran(:, 1);
            obj.tran.x = tran(:, 2);
            obj.tran.x = tran(:, 3);
%             obj.tran.r = sqrt(obj.tran.x.^2+obj.tran.y.^2);
            
            % Saving the dft
            obj.dft.x = dft(:, 1);
            obj.dft.y = dft(:, 2);
            obj.dft.z = dft(:, 3);
        end
        
        function [freq, dft] = fftat(obj, threshold)
            [freq, dft] = tools.cutoffat(obj.freq, obj.dft.z, threshold);
        end
        
        function plotdft(obj, dimension)
            if dimension == 'x'
                plot(obj.freq, obj.dft.x)
            elseif dimension == 'y'
                plot(obj.freq, obj.dft.y)
            elseif dimension == 'z'
                plot(obj.freq, obj.dft.z)
            end         
        end
        
    end
    
    methods (Access = private)

    end
end