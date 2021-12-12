function [Precision, Recall, Accuracy, F1] = metrics(confn)
    TP  = zeros(6,1);
    FP  = zeros(6,1);
    TN  = zeros(6,1);
    FN  = zeros(6,1);
    for n = 1:6
        TP(n) = confn(n,n);
        FP(n) = sum(confn(:,n)) - TP(n);
        FN(n) = sum(confn(n,:)) - TP(n);
        TN(n) = sum(sum(confn)) - TP(n) - FP(n) - FN(n);
    end
    Accuracy = (TN + TP) ./ 900;
    Precision = TP ./ (TP + FP);
    Recall = TP ./ (TP + FN);
    F1 = 2 * (Precision .* Recall)./(Precision + Recall);
    
end