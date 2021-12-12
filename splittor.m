function splittor(range)
    load trainData
    clear XTrain YTrain XValidation YValidation

    % Split Train and Test set
    test_index = ismember(fn,indices(range));
    train_index = test_index == 0;

    Xtrain = X(:,:,train_index);
    YTrain = categorical(Y(train_index));
    Xval = X(:,:,test_index);
    YValidation = categorical(Y(test_index));

    % Randomize the order
    train_size = numel(YTrain);
    test_size = numel(YValidation);
    train_r_index = randperm(train_size, train_size);
    test_r_index = randperm(test_size, test_size);

    Xtrain = Xtrain(:,:,train_r_index);
    YTrain = YTrain(train_r_index);
    Xval = Xval(:,:,test_r_index);
    YValidation = YValidation(test_r_index);

    clear train_size test_size train_r_index test_r_index

    % Store as cells
    for ii = 1:size(Xtrain,3)
        XTrain{ii} = Xtrain(:,:,ii);
    end

    for ii = 1:size(Xval,3)
        XValidation{ii} = Xval(:,:,ii);
    end

    XTrain = XTrain';
    XValidation = XValidation';

    clear Xval Xtrain ii
    save trainData
end