function scatter_plots(res)

    res0 = res{1};
    res1 = res{2};
    res2 = res{3};
    res3 = res{4};
    res4 = res{5};
    res5 = res{6};
    
    scatter(res0(:,1), res0(:,2), 'filled', '^', 'MarkerEdgeColor',[0 0.3 0.6],'MarkerFaceColor',[0 0.4470 0.7410]);
    hold on 
    scatter(res1(:,1), res1(:,2), 'filled', 's' ,'MarkerEdgeColor',[0 0.6 0.3] ,'MarkerFaceColor',[0 .8 .5]);
    hold on
    scatter(res2(:,1), res2(:,2), 'filled','MarkerEdgeColor',[0.7 0.2 0.4] ,'MarkerFaceColor', [0.8500 0.3250 0.0980]);
    hold on
    scatter(res3(:,1), res3(:,2), 'filled', 'v', 'MarkerEdgeColor',[0.5 0.4470 0.7410],'MarkerFaceColor',[0.5 0.4470 0.7410]);
    hold on 
    scatter(res4(:,1), res4(:,2), 'filled', 'p' ,'MarkerEdgeColor',[0.2 .5 .8] ,'MarkerFaceColor',[0.2 .5 .8]);
    hold on
    scatter(res5(:,1), res5(:,2), 'filled','d','MarkerEdgeColor',[0.5500 0.7250 0.0980] ,'MarkerFaceColor', [0.5500 0.7250 0.0980]);
    legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")
end