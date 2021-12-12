%% MFCC
clear, clc, clf
% load net_mfcc
% load trainData
% 
% YPred = classify(net,XValidation);
% cm1 = confusionmat(YValidation, YPred);
% [~, ~, rr] = confusion.getMatrix(double(YValidation), double(YPred));
% [rr.Precision, rr.Sensitivity, (rr.TrueNegative + rr.TruePositive) / (180) ]

load agg
axh = confusionchart(aggconf,categorical("R"+string([0 1 2 3 4 5])), 'FontName','cmmi10');
title("Confusion Matrix (MFCC features)")
axh.FontSize = 25;



%% Custom
clear, clc, clf
% load trainData2
% load net_custom
% 
% YPred = vec2ind(net(Xval'));
% YValidation = double(YValidation);
% cm2 = confusionmat(YValidation, YPred);
% [~, ~, rr] = confusion.getMatrix(double(YValidation), double(YPred), 0);
% [rr.Precision, rr.Sensitivity, (rr.TrueNegative + rr.TruePositive) / (180)]
% acc = mean(YValidation' == YPred)

load agg2

axh = confusionchart(aggconf,categorical("R"+string([0 1 2 3 4 5])));
axh.Title = "Confusion Matrix(Manully Selected Features)";
axh.FontSize = 20;


