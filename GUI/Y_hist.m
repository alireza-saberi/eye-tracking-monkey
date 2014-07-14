function Y_hist(folder, from, to, t_Ymin,t_Ymax, resolution)
stepSize = resolution ;
yedges = t_Ymin:stepSize:t_Ymax;
Y = [];
%extra = Ali_EyeTecker_Analyzer_Tool;
%str = strcat(folder,extra);
for (ii = from:to)
    load(sprintf('%scalibrated_xy_%d.mat',folder,ii));
    y =  xy_calib(:,2);
    Y = [Y;y];
end
    figure;
    hist(Y,yedges)
    title('Histogram for Y values');
    xlabel('Y');
    ylabel('Number of Y');
    axis([t_Ymin+stepSize t_Ymax-stepSize  0 6000]);
    grid on;
    h= findobj(gca,'Type','patch');
    set(h,'FaceColor','r','EdgeColor','w')
end
