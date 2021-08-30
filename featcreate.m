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

%% Normalize and partition
load featmat
X = normalize(featmat(:,3:end));
Y = featmat(:,2);

% Split data by file num
train_index = featmat(:,1)> 0 & featmat(:,1)<101;
test_index = train_index == 0;

Xtrain = X(train_index,:);
for ii = 1:size(Xtrain,1)
    XTrain{ii} = Xtrain(ii,:)';
end
YTrain = categorical(Y(train_index));

Xval = X(test_index,:);
for ii = 1:size(Xval,1)
    XValidation{ii} = Xval(ii,:)';
end
YValidation = categorical(Y(test_index));

clear filenum fileid section train_index test_index outmat X Y Xval Xtrain ii featmat
save deepTest