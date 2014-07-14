function scatter2D_binned(folder, from, to, Xmin,Xmax, Ymin, Ymax)
figure;

for (ii = from:to)
    load(sprintf('%sbinned_xy_%d.mat',folder,ii));
    x =  binned_xy(:,1);
    y =  binned_xy(:,2);
   axis([Xmin Xmax Ymin Ymax])

    c = linspace(10,20,length(x));
    s=c;
    scatter(x,y,c)
    grid on;
    hold on
    title('2D scatter plot for binned X-Y')
    xlabel('X')
    ylabel('Y')
end

end

