function statics_binnedV2(folder, TrialNo, from, Xlow,Xtop, Ylow,Ytop)
format long G;
Minimum_distance = [];
Maximum_distance = [];
Mean_distance = [];
Median_distance = [];
Var_distance = [];
STD_distance = [];
DD = [];

h = waitbar(0,'Applying new setting on statistic factors ......');
pause(0.3);

% local investigation
for (fileNumber = 1: TrialNo)
    newX = [];
    newY = [];
    
    h = waitbar(fileNumber/TrialNo,h,sprintf('Applying new setting on statistic factors trial no. %d . . . ', fileNumber''));
    pause(0.3);
    
    load(sprintf('%sbinned_xy_%d.mat',folder,fileNumber));
    x_calib = binned_xy(:,1);
    y_calib = binned_xy(:,2);
    
    for (ii = 1: length(x_calib))
        if (x_calib(ii) <= Xtop && x_calib(ii)>= Xlow && y_calib(ii) <= Ytop && y_calib(ii)>= Ylow)
            newX = [newX x_calib(ii)];
            newY = [newY y_calib(ii)];
        end
    end
    
    D = sqrt(newX.^2 + newY.^2)';
    DD = [DD; D];
    
    Minimum_distance = [Minimum_distance min(D)];
    Maximum_distance = [Maximum_distance  max(D)];
    Mean_distance = [Mean_distance; mean(D)];
    Median_distance = [Median_distance; median(D)];
    Var_distance = [Var_distance; var(double(D))];
    STD_distance= [STD_distance; std(double(D))];
    
    NewXY = [newX' newY'];
    save(sprintf('%sB_NewSet_XY_%d.mat',folder,fileNumber),'NewXY');
    save(sprintf('%sB_NewSet_D_%d.mat',folder, fileNumber),'D');
      
end
    close;
    
    save(sprintf('%sB_static_Max_distance.mat',folder),'Maximum_distance');
    save(sprintf('%sB_static_Min_distance.mat',folder),'Minimum_distance');
    save(sprintf('%sB_static_Mean_distance.mat',folder),'Mean_distance');
    save(sprintf('%sB_static_Var_distance.mat',folder),'Var_distance');
    save(sprintf('%sB_static_Median_distance.mat',folder),'Median_distance');
    save(sprintf('%sB_static_STD_distance.mat',folder),'STD_distance');

    save(sprintf('%sB_NewSet_D.mat',folder),'DD');
    
    Dsetting = [];
for(jj= from:TrialNo)
    Dtemp = load(sprintf('%sB_NewSet_D_%d.mat',folder,jj));
    Dsetting = [Dsetting; Dtemp.D];
end
    S=[min(Dsetting),max(Dsetting), mean(Dsetting),median(Dsetting),var(Dsetting), std(Dsetting)];
    save(sprintf('%sExperiment_binned_stats.mat',folder),'S');  
end
