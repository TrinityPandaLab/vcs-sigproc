%
clear, clc
load deepTest.mat

%% Contruct Layer
layers_1 = [ ...
       sequenceInputLayer(15)
       lstmLayer(100)
       fullyConnectedLayer(6)
       softmaxLayer
       classificationLayer];
   

%% Training Option
miniBatchSize = 27;
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
net = trainNetwork(XTrain,YTrain,layers_2,options);

%% Predict
YPred = classify(net,XValidation);
acc = mean(YPred == YValidation)