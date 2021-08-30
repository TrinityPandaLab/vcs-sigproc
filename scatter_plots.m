function scah = scatter_plots(res, ~)
% Scatter plot, error plot if 2 arguments
    narginchk(1,2)
    load colorcode
    
    if nargin == 1
        for ii = 1:numel(res)
            scah(ii) = scatter(res{ii}(:,1), res{ii}(:,2), 'filled', markerType(ii), 'MarkerEdgeColor', colmap(ii,:),'MarkerFaceColor',colmap(ii,:));
            hold on 
        end
    else 
        for ii = 1:numel(res)
            scah(ii) = errorbar(res{ii}(:,1), res{ii}(:,2), res{ii}(:,3),  markerType(ii) , 'Color', colmap(ii,:),'MarkerFaceColor',colmap(ii,:));
            hold on 
        end
    end
    legend(scah, "Section " + string((1:numel(res))-1))
end