%scatter plot function
function scatter2D(folder, from, to, Xmin,Xmax, Ymin, Ymax)
figure;

for (ii = from:to)
    load(sprintf('%scalibrated_xy_%d.mat',folder,ii));
    x =  xy_calib(:,1);
    y =  xy_calib(:,2);
    axis([Xmin Xmax Ymin Ymax]);
    %axis([Xmin Xmax Ymin Ymax])
    c = linspace(10,20,length(x));
    s=c;
    scatter(x,y,c)
    grid on;
    hold on
    title('2D scatter plot for calibrated X-Y')
    xlabel('X')
    ylabel('Y')
end

end
