% Reading the X files
format long G;
close all;
clear all;
clc
% ===========non-calib==============
% Minimum_X = [];
% Maximum_X = [];
% Mean_X = [];
% Var_X = [];
% Median_X = [];
% STD_X = [];
% for (fileNumber =1:37)
%     disp(sprintf('X-%d . . .  information',fileNumber))
%     load(sprintf('X-%d.mat',fileNumber));
%     if (size(x_LocationOfFixation,1) == 0) 
%         fileNumber
%     end;
%     Minimum_X = [Minimum_X; min(x_LocationOfFixation)];
%     Maximum_X = [Maximum_X; max(x_LocationOfFixation)];
%     Mean_X = [Mean_X; mean(x_LocationOfFixation)];
%     Median_X = [Median_X; median(x_LocationOfFixation)];
%     Var_X = [Var_X; var(double(x_LocationOfFixation))];
%     STD_X = [STD_X; std(double(x_LocationOfFixation))];
% end
% save('MAX_X.mat','Maximum_X');
% save('MIN_X.mat','Minimum_X');
% save('Mean_X.mat','Mean_X');
% ;save('VAR_X.mat','Var_X');
% save('MEDIAN_X.mat','Median_X');
% save('STD_X.mat','STD_X');
%=============calib===============
% Minimum_X_calib = [];
% Maximum_X_calib = [];
% Mean_X_calib = [];
% Median_X_calib = [];
% Var_X_calib = [];
% STD_X_calib = [];

% Minimum_Y_calib = [];
% Maximum_Y_calib = [];
% Mean_Y_calib = [];
% Median_Y_calib = [];
% Var_Y_calib = [];
% STD_Y_calib = [];
% 
% distance = [];

Minimum_distance = [];
Maximum_distance = [];
Mean_distance = [];
Median_distance = [];
Var_distance = [];
STD_distance = [];

for (fileNumber =1: 15)
%     %disp(sprintf('x_calib-%d . . .  information',fileNumber))
%     load(sprintf('x_calib-%d.mat',fileNumber));
%     Minimum_X_calib = [Minimum_X_calib; min(x_calib)];
%     Maximum_X_calib = [Maximum_X_calib; max(x_calib)];
%     Mean_X_calib = [Mean_X_calib; mean(x_calib)];
%     Median_X_calib = [Median_X_calib; median(x_calib)];
%     Var_X_calib = [Var_X_calib; var(double(x_calib))];
%     STD_X_calib = [STD_X_calib; std(double(x_calib))];
    
%     %disp(sprintf('y_calib-%d . . .  information',fileNumber))
%     load(sprintf('y_calib-%d.mat',fileNumber));
%     Minimum_Y_calib = [Minimum_Y_calib; min(y_calib)];
%     Maximum_Y_calib = [Maximum_Y_calib; max(y_calib)];
%     Mean_Y_calib = [Mean_Y_calib; mean(y_calib)];
%     Median_Y_calib = [Median_Y_calib; median(y_calib)];
%     Var_Y_calib = [Var_Y_calib; var(double(y_calib))];
%     STD_Y_calib = [STD_Y_calib; std(double(y_calib))];    
%     

    %disp(sprintf('x_calib-%d . . .  information',fileNumber))
    load(sprintf('distance-%d.mat',fileNumber));
    Minimum_distance = [Minimum_distance; min(distance)];
    Maximum_distance = [Maximum_distance; max(distance)];
    Mean_distance = [Mean_distance; mean(distance)];
    Median_distance = [Median_distance; median(distance)];
    Var_distance = [Var_distance; var(double(distance))];
    STD_distance= [STD_distance; std(double(distance))];
end
% save('MAX_X_calib.mat','Maximum_X_calib');
% save('MIN_X_calib.mat','Minimum_X_calib');
% save('Mean_X_calib.mat','Mean_X_calib');
% ;save('VAR_X_calib.mat','Var_X_calib');
% save('MEDIAN_X_calib.mat','Median_X_calib');
% save('STD_X.mat','STD_X_calib');

% save('MAX_Y_calib.mat','Maximum_Y_calib');
% save('MIN_Y_calib.mat','Minimum_Y_calib');
% save('Mean_Y_calib.mat','Mean_Y_calib');
% ;save('VAR_Y_calib.mat','Var_Y_calib');
% save('MEDIAN_Y_calib.mat','Median_Y_calib');
% save('STD_Y.mat','STD_Y_calib');

save('MAX_distance.mat','Maximum_distance');
save('MIN_distance.mat','Minimum_distance');
save('Mean_distance.mat','Mean_distance');
;save('VAR_distance.mat','Var_distance');
save('MEDIAN_distance.mat','Median_distance');
save('STD_distance.mat','STD_distance');

% figure;
% load('X.mat');
% cdfplot(x_LocationOfFixations)
% figure
% normplot(x_LocationOfFixations)
% % figure
% % probplot(double(x_LocationOfFixations))
% figure;
% qqplot(x_LocationOfFixations)

% ================================
% Minimum_Y = [];
% Maximum_Y = [];
% Mean_Y = [];
% Var_Y = [];
% Median_Y = [];
% STD_Y = [];
% for (fileNumber =1:231)
%     %disp(sprintf('Y-%d . . .  information',fileNumber))
%     load(sprintf('Y-%d.mat',fileNumber));
%     Minimum_Y = [Minimum_Y; min(y_LocationOfFixation)];
%     Maximum_Y =[Maximum_Y; max(y_LocationOfFixation)];
%     Mean_Y = [Mean_Y; mean(y_LocationOfFixation)];
%     Median_Y = [Median_Y; median(y_LocationOfFixation)];
%     Var_Y = [Var_Y; var(double(y_LocationOfFixation))];
%     STD_Y= [STD_Y; std(double(y_LocationOfFixation))];
% 
% end
% save('MAX_Y.mat','Maximum_Y');
% save('MIN_Y.mat','Minimum_Y');
% save('Mean_Y.mat','Mean_Y');
% ;save('VAR_Y.mat','Var_Y');
% save('MEDIAN_Y.mat','Median_Y');
% save('STD_Y.mat','STD_Y');


% figure;
% load('Y.mat');
% cdfplot(y_LocationOfFixations)
% figure
% normplot(y_LocationOfFixations)
% % figure
% % probplot(double(y_LocationOfFixations))
% figure;
% qqplot(x_LocationOfFixations)


timer = [];
for (fileNumber =1: 15)
    load(sprintf('T-%d.mat',fileNumber));
    if (size(time_Fixation,1) ==0) 
        Trial_duration = NaN;
    else
            Trial_duration = max(time_Fixation)-min(time_Fixation);
    end    
    timer = [timer;Trial_duration];
end