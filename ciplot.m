function p = ciplot(y,std,color,alpha, ax)
    % custom function to plot the graphs with confidence intervals
if nargin<4
    alpha=0.1;
end
if nargin<3
    color='b';
end

x = 1:length(y);
xconf = [x fliplr(x)] ;         
yconf = [y+std fliplr(y-std)];

ci = fill(ax, xconf,yconf,'red');
ci.FaceColor = color;      
ci.FaceAlpha = alpha;
ci.EdgeColor = 'none';           

hold on
p = plot(ax,x,y, 'Color',color, "LineWidth", 2);
