clear, clc
% Creates features and label objects

load output_mfcc
load obj

for section = 1:6
    for filenum = 1:150
        fileid = 150 * (section-1) + filenum;
        featmat(fileid,:) = [filenum, section, mean(output{filenum, section}), phaseSig(obj{filenum, section})];
    end
end
clear filenum fileid section files obj output
save featmat

%% Normalize 
clear, clc
load featmat
X = normalize(featmat(:,3:end));
Y = featmat(:,2);
fn = featmat(:,1);
indices = randperm(150,150);
save deepTest

%% Split data by file num
clear, clc
load deepTest
clear XTrain YTrain XValidation YValidation

test_index = ismember(fn,indices(121:135));
train_index = test_index == 0;

Xtrain = X(train_index,:);
YTrain = categorical(Y(train_index));
Xval = X(test_index,:);
YValidation = categorical(Y(test_index));

for ii = 1:size(Xtrain,1)
    XTrain{ii} = Xtrain(ii,:)';
end

for ii = 1:size(Xval,1)
    XValidation{ii} = Xval(ii,:)';
end

clear Xval Xtrain ii featmat
save deepTest