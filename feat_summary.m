%% MFCC
clear, clc
load("trainData.mat", "X", "Y");

for section = 1:6
    temp = X(:,:,Y == section);
    feat{section} = reshape(temp, 14, [])';
end


save("feat_summary_bean.mat", "feat")

%% Custom
clear, clc
load("trainData2.mat", "X", "Y");

for section = 1:6
    feat{section}= (X(Y == section, :));
end

save("feat2_summary_bean.mat", "feat")