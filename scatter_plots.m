    clc, clear
load("nicest.mat");

res = [res0;res1;res2];
section = res(:,3);

% res(:,1) = rescale(res(:,1));
% res(:,2) = rescale(res(:,2));

res(:,1) = normalize(res(:,1)) + mean(res(:,1));
res(:,2) = normalize(res(:,2)) + mean(res(:,2));

res = [res(:,1),res(:,2),section];

res0 = res(section == 0,:);
res1 = res(section == 1,:);
res2 = res(section == 2,:);

figh = figure(1);
clf
axh = axes(figh);
s(1) = scatter(axh,res0(:,1), res0(:,2), 'filled', '^', 'MarkerEdgeColor',[0 0.3 0.6],'MarkerFaceColor',[0 0.4470 0.7410]);
hold on 
s(2) = scatter(axh,res1(:,1), res1(:,2), 'filled', 's' ,'MarkerEdgeColor',[0 0.6 0.3] ,'MarkerFaceColor',[0 .8 .5]);
hold on
s(3) = scatter(axh,res2(:,1), res2(:,2), 'filled','MarkerEdgeColor',[0.7 0.2 0.4] ,'MarkerFaceColor', [0.8500 0.3250 0.0980]);
% yline(mean(res(:,2)));
% xline(mean(res(:,1)));

%%
grid on
xlabel("Normalized Peak Frequency(Hz)")
ylabel("Normalized Peak Prominence")
title("Normalized Frequency of Peak in Band 0 - 100 Hz")
legend(s, "Untouched", "Region 1", "Region 2")
axh.FontSize = 26;