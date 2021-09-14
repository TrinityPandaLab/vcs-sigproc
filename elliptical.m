%% Summary
clc, clear
load obj

%% Get RMS
for section = 1:6
    for filenum = 1:100
        zt(filenum) = sqrt(sum(obj{filenum,section}.tran.z.^2));
        yt(filenum) = sqrt(sum(obj{filenum,section}.tran.y.^2));
    end
    res{section} = [yt(:), zt(:)];
    angg(section,:) = atan2(zt, yt);
end
angg = reshape(normalize(angg(:)),6,[]);

angav = mean(angg, 2);
angsd = std(angg, 0,2);

for ii = 1:6
    res{ii} = [1, angav(ii), angsd(ii)];
end

scatter_plots(res,0);
clear filenum section

%%
clf
sp = 1;
for filenum = 20
    
    for section = 1:6
        objj = obj{filenum, section};
        
        subplot(2,3,sp)
        plot3(objj.time,objj.tran.y, objj.tran.z);
        sp = sp + 1;
        
        hold on
    end
end