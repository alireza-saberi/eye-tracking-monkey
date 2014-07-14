% Ploting in 3D
clc
clear all;
close all;
% loading  RAW 3D-data
for (i = 1 : 1)
    folder = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\eye-tracking\code\MATLAB-CODE\MONKEY-TRACKING\';
    x_location = sprintf('%sX-%d',folder,i);
    y_location = sprintf('%sY-%d',folder,i);
    t_location = sprintf('%sT-%d',folder,i);

    load(x_location);
    load(y_location);
    load(t_location);
% ------------------------------ Scatter plot
    figure
    scatter(x_LocationOfFixation,y_LocationOfFixation)
    grid on;

    
% ------------------------------Plot3 function
    % Crea
    te the 3D plot
        figure;
        New_time = time_Fixation - min(time_Fixation);
        plot3(x_LocationOfFixation, y_LocationOfFixation, New_time,'r');
        box on;
        grid on;
    % Set the viewing angle and the axis limits
        %%view(26, 42);
        %%axis([min(x_LocationOfFixation) max(x_LocationOfFixation) min(y_LocationOfFixation) max(y_LocationOfFixation) 0 max(New_time)]);
    % Add title and axis labels
        xlabel('X-fixations');
        ylabel('Y-fixations');
        zlabel('Time of fixation');
        title('3D plot of monkey gaze');
% -------------------------------Scatter plot 3D
        figure
        scatter3(x_LocationOfFixation,y_LocationOfFixation,New_time)

    
    
% %      % ------------------------------Bar3 function   
% %      % Create the 3D bar chart
% %     figure;
% %     bar3(temperatures);
% %     axis([0 13 0 12 0 80]);
% % 
% %     % Add title and axis labels
% %     title('Boston Monthly Temperatures 1900-2000');
% %     xlabel('Month');
% %     ylabel('Year');
% %     zlabel('Temperature');
% % 
% %     % Change the x and y axis tick labels
% %     set(gca, 'XTickLabel', months);
% %     set(gca, 'YTickLabel', years);
end

% Loading calibrated 3D-data
for (i = 1 : 1)
    folder = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\eye-tracking\code\MATLAB-CODE\MONKEY-TRACKING\';
    x_location = sprintf('%sx_calib-%d',folder,i);
    y_location = sprintf('%sy_calib-%d',folder,i);
    t_location = sprintf('%sT-%d',folder,i);

    load(x_location);
    load(y_location);
    load(t_location);
    % ------------------------------ Scatter plot
    figure
    c = linspace(10,20,length(x_calib));
    s=c;
    scatter(x_calib,y_calib,s,c)
    grid on;
    % ------------------------------Plot3 function
    % Create the 3D plot
    figure;
    New_time = time_Fixation - min(time_Fixation);
    plot3(x_calib, y_calib, New_time,'r');
    box on;
    grid on;
    
    % Set the viewing angle and the axis limits
    %view(26, 42);
    %axis([min(x_LocationOfFixation) max(x_LocationOfFixation) min(y_LocationOfFixation) max(y_LocationOfFixation) 0 max(New_time)]);

    % Add title and axis labels
    xlabel('X-fixations');
    ylabel('Y-fixations');
    zlabel('Time of fixation');
    title('3D plot of monkey gaze');
    
    % -----------------------------Scatter plot 3D
    figure
    scatter3(x_calib,y_calib,New_time)
    axis([-0.6 0.6 -0.6 0.6 0 350])
    

    
% %      % ------------------------------Bar3 function   
% %      % Create the 3D bar chart
% %     figure;
% %     bar3(temperatures);
% %     axis([0 13 0 12 0 80]);
% % 
% %     % Add title and axis labels
% %     title('Boston Monthly Temperatures 1900-2000');
% %     xlabel('Month');
% %     ylabel('Year');
% %     zlabel('Temperature');
% % 
% %     % Change the x and y axis tick labels
% %     set(gca, 'XTickLabel', months);
% %     set(gca, 'YTickLabel', years);
end