classdef sigProc
    
    properties
        T
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
            
            % Saving the dft
            obj.dft.x = dft(:, 1);
            obj.dft.y = dft(:, 2);
            obj.dft.z = dft(:, 3);
        end
    end
    
    methods (Access = private)

    end
end