function [freq, dft] = cutoffat(freq, dft, threshold, mode)
% Splice the dft data for givven frequency
% Mode 0 - get right side of thereshold
% Mode 1 - get left side of thereshold
% Mode 2 - get dft for freq between of theresholds
    if mode == 0
        index = find(freq > threshold, 1);
        freq = freq(index:end);
        dft = dft(index:end);
    elseif mode == 1 
        index = find(freq > threshold, 1);
        freq = freq(1:index);
        dft = dft(1:index);
    elseif mode == 2
        index_1 = find(freq > threshold(1), 1);
        index_2 = find(freq > threshold(2), 1);
        freq = freq(index_1:index_2);
        dft = dft(index_1:index_2);
    end

end