function BinMaker(folder,t_number,resolution_num)
   
    stepSize = resolution_num;
    binned_XY = [];
    binned_D = [];
    
    h = waitbar(0,'Looding experiment trials ......');
    pause(0.3);
for(ii = 1: t_number)
    h = waitbar(ii/t_number,h,sprintf('Loading trial no. %d . . . ', ii)); 
    load(sprintf('%scalibrated_xy_%d',folder,ii));
     x = xy_calib(:,1);
     y = xy_calib(:,2);
     x_binned = fix((x)/stepSize )*stepSize;
     y_binned = fix((y)/stepSize)*stepSize;
     d = sqrt(x_binned.^2 + y_binned.^2);
     binned_xy = [x_binned y_binned];
      
     binned_XY = [binned_XY;binned_xy];
     binned_D = [binned_D; d];
     
     save(sprintf('%sbinned_xy_%d.mat',folder,ii),'binned_xy');
     save(sprintf('%sbinned_distance_%d.mat',folder,ii),'d');

     pause(0.3);
end

save(sprintf('%sbinned_XY.mat',folder),'binned_XY');
save(sprintf('%sbinned_D.mat',folder),'binned_D');

close;
end

