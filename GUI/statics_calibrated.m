%  This is the Matlab function Deleveloped by 
%  Alireza Saberi  in  prfessor Amir Shmuel  lab
% McGill University, Montreal, Quebec, Canada

function statics_calibrated(folder, TrialNo, from)
format long G;
extra = 'Ali_EyeTecker_Analyzer_Tool\';
folder2 = strcat(folder,extra);

Minimum_distance = [];
Maximum_distance = [];
Mean_distance = [];
Median_distance = [];
Var_distance = [];
STD_distance = [];
timer = [];

h = waitbar(0,'Applying statistic functions ......');
pause(0.3);

% local investigation
for (fileNumber =from: TrialNo)
    h = waitbar(fileNumber/TrialNo,h,sprintf('Applying statistic functions on  trial no. %d . . . ', fileNumber''));
    pause(0.3);
    D= load(sprintf('%scalibrated_distance_%d.mat',folder2,fileNumber));
    Minimum_distance = [Minimum_distance;  min(D.distance)];
    Maximum_distance = [Maximum_distance; max(D.distance)];
    Mean_distance = [Mean_distance;  mean(D.distance)];
    Median_distance = [Median_distance;  median(D.distance)];
    Var_distance = [Var_distance;  var(double(D.distance))];
    STD_distance= [STD_distance;  std(double(D.distance))];
    
    TT= load(sprintf('%sCalibrated_T_%d.mat',folder2,fileNumber));
    if (size(TT.time_Fixation,1) ==0) 
        Trial_duration = NaN;
    else
            Trial_duration = max(TT.time_Fixation)-min(TT.time_Fixation);
    end    
    timer = [timer;Trial_duration]; 
        
end
close;

T = cumsum(timer);
save(sprintf('%sT_places.mat',folder2),'T');

save(sprintf('%sstatic_Max_distance.mat',folder2),'Maximum_distance');
save(sprintf('%sstatic_Min_distance.mat',folder2),'Minimum_distance');
save(sprintf('%sstatic_Mean_distance.mat',folder2),'Mean_distance');
save(sprintf('%sstatic_Var_distance.mat',folder2),'Var_distance');
save(sprintf('%sstatic_Median_distance.mat',folder2),'Median_distance');
save(sprintf('%sstatic_STD_distance.mat',folder2),'STD_distance');

 DD =load(sprintf('%scalibrated_distances.mat',folder2));
 S=[min(DD.distances);max(DD.distances); mean(DD.distances);median(DD.distances);var(DD.distances); std(DD.distances)];
 save(sprintf('%sExperiment_stats.mat',folder2),'S');
 
end