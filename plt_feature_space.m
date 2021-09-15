%% ErrPlot MFCC
clc, clear
load feat_summary
% load temp
clf
axh = axes();
featNum = 1:14;
for section = 1:6
    res{section} = [featNum(:), featav(section,featNum)', featsd(section,featNum)'];
end
sc = scatter_plots(res, 0);
ylabel("Normalized features", "Interpreter", "latex")
xlabel("MFC coefficent number", "Interpreter", "latex")
title("MFCC", "Interpreter", "latex")
set(axh, 'TickLabelInterpreter', 'latex');

axh.FontSize = 20;
axh.TitleFontSizeMultiplier = 1.5;
axh.XTick = 1:14;
axh.XLim = [0.5 14.5];
% axh.XTickLabel = ["Arctan", "Peak \omega_{500-550}", "Peak p_{500-550}", "\omega_{825-925}", "Peak p_{825-925}"];

%% ErrPlot Custom
clc, clear
% load feat_summary
load feat2_summary
clf
featNum = 1:7;
axh = axes();
for section = 1:6
    res{section} = [featNum(:), featav(section,featNum)', featsd(section,featNum)'];
end
sc = scatter_plots(res, 0);
ylabel("Normalized features", "Interpreter", "latex")
title("Custom Features", "Interpreter", "latex")
set(axh, 'TickLabelInterpreter', 'latex');

axh.FontSize = 20;
axh.TitleFontSizeMultiplier = 1.5;
axh.XLim = [0.5 7.5];
axh.XTick = 1:7;

axh.XTickLabel = ["$\theta$", "$\omega_{0}$", "$\pi_0$","$\omega_1$", "$\pi_1$", "$\omega_2$", "$\pi_2$"];

