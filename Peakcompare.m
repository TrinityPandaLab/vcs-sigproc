%% File Extraction
clear, clc

str0 = 'Contact-Sensor-Data/*_0.csv';
str1 = 'Contact-Sensor-Data/*_1.csv';
str2 = 'Contact-Sensor-Data/*_2.csv';
str3 = 'Contact-Sensor-Data/*_3.csv';
str4 = 'Contact-Sensor-Data/*_4.csv';
str5 = 'Contact-Sensor-Data/*_5.csv';
range = [0 200];

res0 = freq_prom(str0, range);
res1 = freq_prom(str1, range);
res2 = freq_prom(str2, range);
res3 = freq_prom(str3, range);
res4 = freq_prom(str4, range);
res5 = freq_prom(str5, range);

%% Plot

figh = figure(10);
clf
axh = axes(figh);
scatter(axh,res0(:,1), res0(:,2), 'filled', '^', 'MarkerEdgeColor',[0 0.3 0.6],'MarkerFaceColor',[0 0.4470 0.7410]);
hold on 
scatter(axh,res1(:,1), res1(:,2), 'filled', 's' ,'MarkerEdgeColor',[0 0.6 0.3] ,'MarkerFaceColor',[0 .8 .5]);
hold on
scatter(axh,res2(:,1), res2(:,2), 'filled','MarkerEdgeColor',[0.7 0.2 0.4] ,'MarkerFaceColor', [0.8500 0.3250 0.0980]);
hold on
scatter(axh,res3(:,1), res3(:,2), 'filled', 'v', 'MarkerEdgeColor',[0.5 0.4470 0.7410],'MarkerFaceColor',[0.5 0.4470 0.7410]);
hold on 
scatter(axh,res4(:,1), res4(:,2), 'filled', 'p' ,'MarkerEdgeColor',[0.2 .5 .8] ,'MarkerFaceColor',[0.2 .5 .8]);
hold on
scatter(axh,res5(:,1), res5(:,2), 'filled','d','MarkerEdgeColor',[0.5500 0.7250 0.0980] ,'MarkerFaceColor', [0.5500 0.7250 0.0980]);

xlabel("Frequency of the maximum (0Hz to 100 Hz)")
ylabel("Peak Prominence")
title("Sections")
legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")