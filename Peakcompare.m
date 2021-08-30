%% File Extraction
clear, clc

load files

range = [500 550];

for ii = 1:6
    res{ii} = freq_prom(files{ii}, range);
end

%% Plot

figh = figure(10);

scatter_plots(res)

xlabel("Frequency of the maximum (0Hz to 100 Hz)")
ylabel("Peak Prominence")
title("Sections")