function heatedplot(folder, from, to, t_Xmin,t_Xmax, t_Ymin, t_Ymax, resolution)
stepSize = resolution ;
xedges = t_Xmin:stepSize:t_Xmax;
yedges = t_Xmin:stepSize:t_Xmax;
X = [];
Y = [];
for (ii = from:to)
    load(sprintf('%scalibrated_xy_%d.mat',folder,ii));
    x =  xy_calib(:,1);
    y =  xy_calib(:,2);
    X = [X;x];
    Y = [Y;y];
end
     histmat = hist2(X, Y, xedges, yedges); 
     figure; pcolor(xedges,yedges,histmat'); colorbar ; axis square tight; 
     title('Heated plot for binned input');
end
