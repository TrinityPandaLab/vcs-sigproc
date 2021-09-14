clear, clc
load obj
filespersec = 150;

for section = 1:6
    for filenum = 1:filespersec
        fileid = filespersec * (section-1) + filenum;
        [zfreq5, zprom5] = obj{filenum,section}.freqatpeak([500 550]);
        [zfreq8, zprom8] = obj{filenum,section}.freqatpeak([825 925]);
        phs = phaseSig(obj{filenum, section});
        featmat(fileid,:) = [filenum, section, phs, zfreq5 , zprom5, zfreq8, zprom8 ];
    end
end
save("featmat2.mat", "featmat")

%% Normalize 
clear, clc
load featmat2
load splitter
X = normalize(featmat(:,3:end));
Y = featmat(:,2);
fn = featmat(:,1);
save trainData2

%% Split data by file num
clear, clc
load trainData2
clear XTrain YTrain XValidation YValidation

% Split Train and Test set
test_index = ismember(fn,indices(1:15));
train_index = test_index == 0;

Xtrain = X(train_index,:);
YTrain = categorical(Y(train_index));
Xval = X(test_index,:);
YValidation = categorical(Y(test_index));

% Randomize the order
train_size = numel(YTrain);
test_size = numel(YValidation);
train_r_index = randperm(train_size, train_size);
test_r_index = randperm(test_size, test_size);

Xtrain = Xtrain(train_r_index,:);
YTrain = YTrain(train_r_index);
Xval = Xval(test_r_index,:);
YValidation = YValidation(test_r_index);

clear train_size test_size train_r_index test_r_index

% Store as cells
for ii = 1:size(Xtrain,1)
    XTrain{ii} = Xtrain(ii,:)';
end

for ii = 1:size(Xval,1)
    XValidation{ii} = Xval(ii,:)';
end

clear Xval Xtrain ii
save trainData2
