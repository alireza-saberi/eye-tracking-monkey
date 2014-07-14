%scatter plot function
function scatter3D(folder, from, to, Xmin,Xmax, Ymin, Ymax)
figure;

for (ii = from:to)
    load(sprintf('%scalibrated_xyt_%d.mat',folder,ii));
    x =  BINGO(:,1);
    y =  BINGO(:,2);
    t =  BINGO(:,3);
    tnew = t - min(t);
    scatter3(x,y,tnew);
    axis([Xmin Xmax Ymin Ymax 0 350])
    grid on;
    hold on
    
    title('3D scatter plot for calibrated X-Y')
    xlabel('X')
    ylabel('Y')
    zlabel('Time')
end

end
