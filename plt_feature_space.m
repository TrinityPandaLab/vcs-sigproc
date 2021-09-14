%% ErrPlot MFCC
clc, clear
load feat_summary
clf
coeffNum = 1:14;
for section = 1:6
    res{section} = [coeffNum(:), featav(section,coeffNum)', featsd(section,coeffNum)'];
end
sc = scatter_plots(res, 0);