%% MFCC
clf
load net_mfcc
load trainData
YPred = classify(net,XValidation);
axh = confusionchart(confusionmat(YValidation, YPred));
axh.Title = "Confusion Matrix (MFCC features)";
axh.FontSize = 20;

[c, r, rr] = confusion.getMatrix(double(YValidation), double(YPred));
[rr.Precision, rr.Sensitivity, (rr.TrueNegative + rr.TruePositive) / (180) ]

%% Custom
clf
load trainData2
load net_custom
% YPred = categorical(trainedModel.predictFcn(Xval));

Ypred = vec2ind(net(Xval'));
Yval = double(YValidation);
axh = confusionchart(confusionmat(Yval, Ypred));
axh.FontSize = 20;
axh.Title = "Confusion Matrix(Manully Selected Features)";
acc = mean(Yval' == Ypred)

[c, r, rr] = confusion.getMatrix(double(Yval), double(Ypred), 0);
[rr.Precision, rr.Sensitivity, (rr.TrueNegative + rr.TruePositive) / (180) ]