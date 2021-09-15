%
clear, clc
load trainData

%% Contruct Layer
numHiddenUnits = 128;

layers_1 = [ ...
       sequenceInputLayer(14)
       bilstmLayer(numHiddenUnits,'OutputMode','last')
       fullyConnectedLayer(6)
       softmaxLayer
       classificationLayer];



%% Training Option
miniBatchSize = 20;
options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',100, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationData',{XValidation,YValidation}, ...
    'GradientThreshold',2, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots','training-progress');

%% Train
net = trainNetwork(XTrain,YTrain,layers_1,options);

%% Predict
YPred = classify(net,XValidation);
acc = mean(YPred == YValidation)

%% Plot
figure(2)
axh = confusionchart(confusionmat(YValidation, YPred));
axh.Title = "Confusion Matrix (MFCC features)";
axh.FontSize = 20;
