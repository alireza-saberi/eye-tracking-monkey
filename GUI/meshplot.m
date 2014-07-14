function meshplot(folder, from, to, t_Xmin,t_Xmax, t_Ymin, t_Ymax, resolution)
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
     [xx,yy]=meshgrid(xedges,yedges);
     histmat = hist2(X, Y, xedges, yedges); 
     figure; mesh(xx,yy,histmat); 
     title('Mesh plot for binned input');
     box on
     xlabel('X')
     ylabel('Y')
     zlabel('Numer of repeat')
end
