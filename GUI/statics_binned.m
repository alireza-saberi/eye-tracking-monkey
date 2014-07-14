function statics_binned(folder, TrialNo, from)
format long G;
Minimum_distance = [];
Maximum_distance = [];
Mean_distance = [];
Median_distance = [];
Var_distance = [];
STD_distance = [];

h = waitbar(0,'Applying statistic functions ......');
pause(0.3);

% local investigation
for (fileNumber =from: TrialNo)
    h = waitbar(fileNumber/TrialNo,h,sprintf('Applying statistic functions on  trial no. %d . . . ', fileNumber''));
    pause(0.3);
    binned_D= load(sprintf('%sbinned_distance_%d.mat',folder,fileNumber));
    Minimum_distance = [Minimum_distance;  min(binned_D.d)];
    Maximum_distance = [Maximum_distance; max(binned_D.d)];
    Mean_distance = [Mean_distance;  mean(binned_D.d)];
    Median_distance = [Median_distance;  median(binned_D.d)];
    Var_distance = [Var_distance;  var(double(binned_D.d))];
    STD_distance= [STD_distance;  std(double(binned_D.d))];
end
close
save(sprintf('%sB_static_Max_distance.mat',folder),'Maximum_distance');
save(sprintf('%sB_static_Min_distance.mat',folder),'Minimum_distance');
save(sprintf('%sB_static_Mean_distance.mat',folder),'Mean_distance');
save(sprintf('%sB_static_Var_distance.mat',folder),'Var_distance');
save(sprintf('%sB_static_Median_distance.mat',folder),'Median_distance');
save(sprintf('%sB_static_STD_distance.mat',folder),'STD_distance');

DD =load(sprintf('%sbinned_D.mat',folder));
S=[min(DD.binned_D);max(DD.binned_D); mean(DD.binned_D);median(DD.binned_D);var(DD.binned_D); std(DD.binned_D)];
save(sprintf('%sExperiment_binned_stats.mat',folder),'S');
end
