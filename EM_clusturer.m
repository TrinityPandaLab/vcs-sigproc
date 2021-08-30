clc, clear,clf
% this scripts does the unsupervised training
load ('nicest.mat', 'res0', 'res1', 'res2');

res = [res0;res1;res2];
%%
res(:,1) = normalize(res(:,1));
res(:,2) = normalize(res(:,2));
X = res(:,1:2);
ColorPalette = [0 0.6 0.3; 0.7 0.2 0.2; 0 0.3 0.6];


list_section = [1 2 0];
section = res(:,3);

rng(3);
k = 6; % Number of GMM components
options = statset('MaxIter',1000);

d = 500; % Grid length
x1 = linspace(min(X(:,1))-2, max(X(:,1))+2, d);
x2 = linspace(min(X(:,2))-2, max(X(:,2))+2, d);
[x1grid,x2grid] = meshgrid(x1,x2);
X0 = [x1grid(:) x2grid(:)];
%%
% threshold = sqrt(chi2inv(0.999,2));

gmfit = fitgmdist(X,k,'CovarianceType','diagonal','SharedCovariance',false,'Options',options); % Fitted GMM
clusterX = cluster(gmfit,X); % Cluster index 

% probX0 = pdf(gmfit, X0);
% probX = pdf(gmfit, X);
% probX0 = mvnpdf(X0, gmfit.mu(1,:), gmfit.Sigma(:,:,1));
% P0 = reshape(probX0, [d d]);    
%%
figure(1)
axh4 = axes();

for iji = 1:3
    score_prob = mvnpdf(X, gmfit.mu(iji,:), gmfit.Sigma(:,:,iji));
    threshold = linspace(min(score_prob), max(score_prob));
    class = score_prob;
    
    select = list_section(iji);
    ii = 1;
    for thres = threshold
        class(score_prob<thres) = 0;
        class(score_prob>=thres)= 1;
    %     C = confusionmat(section,class);
        C = [sum(section ~= select & class == 0), sum(section ~= select & class == 1)
            sum(section == select & class == 0), sum(section == select & class == 1)];
        TPR(ii) = C(2,2)/(C(2,2)+ C(2,1));
        FPR(ii) = C(1,2)/(C(1,2)+ C(1,1));
        ii = ii +1;
    end
    AUC(list_section(iji) + 1) = trapz(fliplr(FPR), fliplr(TPR));
    p(list_section(iji) + 1) = plot(FPR,TPR,'Color', ColorPalette(iji,:), 'LineWidth',4);
    hold on 
end

%%

x = linspace(0,1);
y = linspace(0,1);
p(4) = scatter(x,y,'filled', 'MarkerFaceColor', [0.5 .5 .5]);
title("ROC for EM Classifier")
ylabel("True Positive Rate")
xlabel("False Positive Rate")
grid on
legend(p,"Untouced", "Region 1" , "Region 2", "Chance", "Location", "southeast")

axh4.FontSize = 26;


%%
% figure(1)
% axh5 = axes();
% ColorPalatte = [0 0.3 0.6; 0 .8 .5; 0.7 0.2 0.4];
% h1 = gscatter(X(:,1),X(:,2),clusterX, ColorPalatte(clusterX,:));
% hold on
% cn = contour(x1grid, x2grid, P0);
% plot(gmfit.mu(:,1),gmfit.mu(:,2),'kx','LineWidth',2,'MarkerSize',10)
% title("EM centroids and clusters")
% % legend(cn, "Cluster 1", "Cluster 2", "Cluster 3")
% axh5.FontSize = 26;

% figure(10)
% clf
% s = surface(x1grid, x2grid, P0, "EdgeColor", "k");
% colormap('summer')
% xlim([-2 2])
% ylim([-2 2])
