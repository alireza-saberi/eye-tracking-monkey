%scatter plot function
function scatter3D_binned(folder, from, to, Xmin,Xmax, Ymin, Ymax)
figure;

for (ii = from:to)
    load(sprintf('%sbinned_xy_%d.mat',folder,ii));
    load(sprintf('%scalibrated_xyt_%d.mat',folder,ii));
    x =  binned_xy(:,1);
    y =  binned_xy(:,2);
    t =  BINGO(:,3);
    tnew = t - min(t);
    scatter3(x,y,tnew);
    axis([Xmin Xmax Ymin Ymax 0 350])
    grid on;
    hold on
    
    title('3D scatter plot for binned X-Y')
    xlabel('X')
    ylabel('Y')
    zlabel('Time (Sec.)')
end

end
