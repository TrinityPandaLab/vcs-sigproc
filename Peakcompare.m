%% File Extraction
clear, clc

str0 = 'ContactSensorData/*_0_1.5_*b02.csv';
str1 = 'ContactSensorData/*_1_1.5_*b21.csv';
str2 = 'ContactSensorData/*_2_1.5_*b02.csv';
range = [0 100];

res0 = peakcomp(str0, range);
res1 = peakcomp(str1, range);
res2 = peakcomp(str2, range);

%% Plot

figh = figure(10);
clf
axh = axes(figh);
s(1) = scatter(axh,res0(:,1), res0(:,2), 'filled', '^', 'MarkerEdgeColor',[0 0.3 0.6],'MarkerFaceColor',[0 0.4470 0.7410]);
hold on 
s(2) = scatter(axh,res1(:,1), res1(:,2), 'filled', 's' ,'MarkerEdgeColor',[0 0.6 0.3] ,'MarkerFaceColor',[0 .8 .5]);
hold on
s(3) = scatter(axh,res2(:,1), res2(:,2), 'filled','MarkerEdgeColor',[0.7 0.2 0.4] ,'MarkerFaceColor', [0.8500 0.3250 0.0980]);

xlabel("Frequency of the maximum (0Hz to 100 Hz)")
ylabel("Peak Prominence")
title("Section 0 vs Section 1 vs Section 2")
legend(s, "Section 0", "Section 1", "Section 2")

%% Summary

summary_res = summary(res0(:,1), res1(:,1), res2(:,1));
summary_prom = summary(res0(:,2), res1(:,2), res2(:,2));

%% Histogram

figure(11)
clf

histogram(max0(:,1), "BinEdges", min(res0(:,1)):max(res0(:,1)))
hold on
histogram(res1(:,1), "BinEdges", min(res1(:,1)):max(res1(:,1)))
hold on
histogram(res2(:,1), "BinEdges", min(res2(:,1)):max(res2(:,1)))

%% Variable clearing
clear str0 str1 str2
