%  This is the Matlab function Deleveloped by 
%  Alireza Saberi  in  prfessor Amir Shmuel  lab
% McGill University, Montreal, Quebec, Canada

function statics_calibratedV2(folder, TrialNo, from, Xlow,Xtop, Ylow,Ytop)

format long G;
extra = 'Ali_EyeTecker_Analyzer_Tool\';
folder2 = strcat(folder,extra);

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

    load(sprintf('%scalibrated_xy_%d.mat',folder2,fileNumber));
    x_calib = xy_calib(:,1);
    y_calib = xy_calib(:,2);
    
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
    save(sprintf('%sNewSet_XY_%d.mat',folder2,fileNumber),'NewXY');
    save(sprintf('%sNewSet_D_%d.mat',folder2,fileNumber),'D');
     
end
    close;

    save(sprintf('%sstatic_Max_distance.mat',folder2), 'Maximum_distance');
    save(sprintf('%sstatic_Min_distance.mat',folder2),'Minimum_distance');
    save(sprintf('%sstatic_Mean_distance.mat',folder2),'Mean_distance');
    save(sprintf('%sstatic_Var_distance.mat',folder2),'Var_distance');
    save(sprintf('%sstatic_Median_distance.mat',folder2),'Median_distance');
    save(sprintf('%sstatic_STD_distance.mat',folder2),'STD_distance');

    save(sprintf('%sNewSet_D.mat',folder2),'DD');
     

    Dsetting = [];
for(jj= from:TrialNo)
    Dtemp = load(sprintf('%sNewSet_D_%d.mat',folder2,jj));
    Dsetting = [Dsetting; Dtemp.D];
end

S=[min(Dsetting),max(Dsetting), mean(Dsetting),median(Dsetting),var(Dsetting), std(Dsetting)];
save(sprintf('%sExperiment_stats.mat',folder2),'S');   
  
end


    
