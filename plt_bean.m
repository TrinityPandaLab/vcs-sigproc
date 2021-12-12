clear, clf, clc
load feat2_summary_bean.mat
load colorcode

A = linspace(1,5)'; 
B = linspace(1,10)';
axh = axes();
for ii = 1:6
    p{ii} = violin(feat{ii}, 'facecolor' , colmap(ii,:), 'facealpha', 0.3, 'edgecolor', [], 'medc', [], 'mc', ii);
    hold on
end
xlabel("Feature", "Interpreter", "latex")
ylabel("Normalized features", "Interpreter", "latex")
title("Manually Selected Features", "Interpreter", "latex")
set(axh, 'TickLabelInterpreter', 'latex');

axh.FontSize = 25;
axh.TitleFontSizeMultiplier = 1.5;
axh.XLim = [0.5 7.5];
axh.XTick = 1:7;
axh.XTickLabel = ["$\theta$", "$\omega_{0}$", "$\pi_0$","$\omega_1$", "$\pi_1$", "$\omega_2$", "$\pi_2$"];
axh.YLim = [-4 5];

for ii = 1:6
    h(ii) = plot(NaN,NaN,'LineWidth', 2 , 'Color', colmap(ii,:));
end
legend(h, "R"+string([0 1 2 3 4 5]), "Interpreter", "latex", "FontSize", 18, "Location", "southwest");

%%
clear, clf, clc
% load feat_summary_bean.mat
load feat_sum_bean_2.mat
load colorcode

axh = axes();
for ii = 1:6
    p{ii} = violin(feat{ii}, 'facecolor' , colmap(ii,:), 'facealpha', 0.3, 'edgecolor', [], 'medc', [], 'mc', ii);
    hold on
end

xlabel("Feature", "Interpreter", "latex")
ylabel("Normalized features", "Interpreter", "latex")
title("MFCC Features", "Interpreter", "latex")
set(axh, 'TickLabelInterpreter', 'latex');

axh.FontSize = 25;
axh.TitleFontSizeMultiplier = 1.5;
axh.XLim = [0.5 14.5];
axh.XTick = 1:14;
axh.XTickLabel = "C("+string([0 1 2 3 4 5 6 7 8 9 10 11 12 13])+")";
axh.YLim = [-5 4];

for ii = 1:6
    h(ii) = plot(NaN,NaN,'LineWidth', 2 , 'Color', colmap(ii,:));
end
legend(h, "R"+string([0 1 2 3 4 5]), "Interpreter", "latex", "FontSize", 18, "Location", "southwest");