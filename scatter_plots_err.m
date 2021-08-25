function scatter_plots_err(res)

    res0 = res{1};
    res1 = res{2};
    res2 = res{3};
    res3 = res{4};
    res4 = res{5};
    res5 = res{6};
    
    errorbar(res0(:,1), res0(:,2), res0(:,3), '^', 'Color',[0 0.3 0.6],'MarkerFaceColor',[0 0.4470 0.7410]);
    hold on 
    errorbar(res1(:,1), res1(:,2), res1(:,3), 's' ,'Color',[0 0.6 0.3] ,'MarkerFaceColor',[0 .8 .5]);
    hold on
    errorbar(res2(:,1), res2(:,2), res2(:,3), 'o', 'Color',[0.7 0.2 0.4] ,'MarkerFaceColor', [0.8500 0.3250 0.0980]);
    hold on
    errorbar(res3(:,1), res3(:,2), res3(:,3), 'v', 'Color',[0.5 0.4470 0.7410],'MarkerFaceColor',[0.5 0.4470 0.7410]);
    hold on 
    errorbar(res4(:,1), res4(:,2), res4(:,3), 'p' ,'Color',[0.2 .5 .8] ,'MarkerFaceColor',[0.2 .5 .8]);
    hold on
    errorbar(res5(:,1), res5(:,2), res5(:,3),'d','Color',[0.5500 0.7250 0.0980] ,'MarkerFaceColor', [0.5500 0.7250 0.0980]);
    legend( "Section 0", "Section 1", "Section 2", "Section 3", "Section 4", "Section 5")
end