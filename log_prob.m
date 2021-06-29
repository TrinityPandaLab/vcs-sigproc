function output = log_prob(z, bHat)
% Logarithmic Fit, logit function
    b = 1.5;
    output = (b.^(bHat(1)+ bHat(2).*z(:,1)+ bHat(3).*z(:,2)))./(1 + b.^(bHat(1) + bHat(2).*z(:,1)+ bHat(3).*z(:,2)));
end