clear, clc, clf
% load files
% %%
% obj = sigProc(fullfile(files{4}(10).folder,files{4}(10).name),3200);
% axh = axes();
% plot(obj.time*1000,obj.tran.z, "Linewidth", 3)
% xlim([0 50])
% xlabel("Time(ms)")
% ylabel("Acceleration (g)")
% axh.FontSize = 20;
% 
% 
% %%
% clear, clc, clf
% load files
% load colorcode
% fig = figure(1);
% 
% for ii = 1:6
%     s(ii) = subplot(3,2, ii);
%     obj = sigProc(fullfile(files{ii}(10).folder,files{ii}(10).name),3200);
%     plot(obj.time*1000, obj.tran.z, "Linewidth", 2, "Color", colmap(ii,:))
%     xlim([0 50])
%     s(ii).FontSize = 15;
%     title("$R_{"+string(ii-1)+"}$", "Interpreter", "latex");
% end
%     axh = axes(fig, "visible", "off");
%     axh.XLabel.Visible = "On";
%     axh.YLabel.Visible = "On";
% %     sgtitle("Transient data for z-axis", "FontSize", 25)
%     xlabel("Time(ms)", "Interpreter", "latex")
%     ylabel("Acceleration (g)", "Interpreter", "latex")
%     axh.FontSize = 20;
%     axh.TitleFontSizeMultiplier = 1.5;
% %     axh.Title.String = "Transient data for z-axis";
% %     axh.Title.HandleVisibility = "on";