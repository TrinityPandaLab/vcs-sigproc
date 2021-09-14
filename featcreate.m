clear, clc
% Creates features and label objects

load output_normed
load obj
%%
for section = 1:6
    for filenum = 1:150
        fileid = 150 * (section-1) + filenum;
        [zfreq, zprom] = obj{filenum,section}.freqatpeak([500 550]);
        phs = phaseSig(obj{filenum, section});
        featmat(fileid,:) = [filenum, section, mean(output{filenum, section}), phs, zfreq, zprom];
    end
end
save("featmat.mat", "featmat")

%% Normalize 
clear, clc
load featmat
X = normalize(featmat(:,3:end));
Y = featmat(:,2);
fn = featmat(:,1);
indices = randperm(150,150);
clear featmat
save deepTest

%% Split data by file num
clear, clc
load deepTest
clear XTrain YTrain XValidation YValidation test_index 

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
save deepTest