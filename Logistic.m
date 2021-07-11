clc, clear, clf
% This scripts does the logistic classification
T = readmatrix("result12_log.csv");

Freq = normalize(T(:,1));
Prom = normalize(T(:,2));
section = T(:,3);
score_label = T(:,4);
score_prob = T(:,5);


section(section == 1) = 0;
section(section == 2) = 1;

X = [Freq, Prom];
[bHat, dev, stat] = glmfit(X, section,'binomial');
%% Probability Calc
GS = 1000;
x1 = linspace(min(Freq), max(Freq), GS);
x2 = linspace(min(Prom), max(Prom), GS);

[x1grid, x2grid] = meshgrid(x1,x2);
X0 = [x1grid(:), x2grid(:)];
P0 = tools.log_prob(X0, bHat);
P = reshape(P0, [GS GS]);
P1 = tools.log_prob(X, bHat);

figure(3)
clf
axh6 = axes();

surface(axh6,x1grid,x2grid,P, "EdgeColor", "none", "FaceAlpha", 0.5)
view([0.5 0.5 0.5])
grid on
hold on
colormap('summer')
colorbar()
% Grid Lines
spacing = 30;  % play around so it fits the size of your data set
for ii = 1 : spacing : length(x1grid(:,1))
    plot3(axh6, x1grid(:,ii), x2grid(:,ii), P(:,ii),'-k','LineWidth' , 1.05);
    plot3(axh6, x1grid(ii,:), x2grid(ii,:), P(ii,:),'-k','LineWidth' , 1.05);
end

% Scatter plot of data set
ColorPalette = [0 0.3 0.6; 0.7 0.2 0.4];
s(1) = scatter3(axh6, T(section==0,1), T(section==0,2) ,score_prob(section==0), 'filled', "MarkerFaceColor", [0.7 0.2 0.4]);
hold on
s(2) = scatter3(axh6, T(section==1,1), T(section==1,2) ,score_prob(section==1), 'filled', "MarkerFaceColor", [0 0.3 0.6]);


xlabel("\omega", 'FontWeight', 'bold')
ylabel("p", 'FontWeight', 'bold')
zlabel("\rho (\omega, p)", 'FontWeight', 'bold')

%% Orthogonal Planes
[X1,Z1] = meshgrid(-2:2,-0.1:0.2:1.1);
Y1 = zeros(size(X1));    
sxz = surf(axh6, X1,Y1,Z1);
set(sxz, 'FaceColor',[0.1 1 0.5],'FaceAlpha',0.1,'EdgeColor','none')
hold on
[X1,Y1] = meshgrid(-2:2,-2:3);
Z1 = zeros(size(X1));    
sxy = surf(axh6,X1,Y1,Z1);
set(sxy, 'FaceColor',[0.1 0.5 1],'FaceAlpha',0.1,'EdgeColor','none')
[Y1,Z1] = meshgrid(-2:3,-0.1:0.2:1.1);
X1 = zeros(size(Y1));    
sxy = surf(axh6,X1,Y1,Z1);
set(sxy, 'FaceColor',[0.5 0.1 0.1],'FaceAlpha',0.1,'EdgeColor','none')

%%
title("Logisitic Function for Stage 1 Classifier")
legend(s, "Untouched", "Touched",'Location', "northwest")

% title("Logisitic Function for Stage 2 Classifier")
% legend(s, "Region 1", "Region 2",'Location', "northwest")

axh6.FontSize = 26;
load view_log;
view = view1;