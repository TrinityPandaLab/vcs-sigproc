%% MFCC
clear, clc
load("trainData.mat", "X", "Y");

for featnum = 1 : 14
    for section = 1:6
        temp = X(featnum,:,Y == section);
        featav(section, featnum) = mean(temp(:));
        featsd(section, featnum) = std(temp(:));
    end
end

save("temp.mat", "featav", "featsd")

%% Custom
clear, clc
load("trainData2.mat", "X", "Y");

for section = 1:6
    feat{section}= (X(Y == section, :));
end

save("feat2_summary_bean.mat", "feat")