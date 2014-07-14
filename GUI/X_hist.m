function X_hist(folder, from, to, t_Xmin,t_Xmax, resolution)
stepSize = resolution ;
xedges = t_Xmin:stepSize:t_Xmax;
X = [];
%extra = Ali_EyeTecker_Analyzer_Tool;
%str = strcat(folder,extra);
for (ii = from:to)
    load(sprintf('%scalibrated_xy_%d.mat',folder,ii));
    x =  xy_calib(:,1);
    X = [X;x];
end
    figure;
    hist(X,xedges)
    title('Histogram for X values');
    xlabel('X');
    ylabel('Number of X');
    axis([t_Xmin+stepSize t_Xmax-stepSize  0 10000]);
    grid on;
   h= findobj(gca,'Type','patch');
   set(h,'FaceColor','r','EdgeColor','b')
end
