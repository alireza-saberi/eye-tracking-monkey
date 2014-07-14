%  This is the Matlab function Deleveloped by 
%  Alireza Saberi  in  prfessor Amir Shmuel  lab
% McGill University, Montreal, Quebec, Canada
clc;
clear all;
close all;
format long;
Trials = [];

% **********Folders area
folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\26-Jun-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\28-Mar-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\01-Apr-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\03-Apr-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\10-Apr-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\18-Apr-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\22-Apr-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\23-Apr-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\25-Apr-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\26-Apr-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\29-Apr-2013\Zeshan\';
 %folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\01-May-2013\Zeshan\';
%folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\06-May-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\07-May-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\09-May-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\10-May-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\15-May-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\03-Jun-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\04-Jun-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\10-Jun-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\13-Jun-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\17-Jun-2013\Zeshan\';
% folder1 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\Lab-data\monkey\28-Jun-2013\Zeshan\';

location2 = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\eye-tracking\code\MATLAB-CODE\MONKEY-TRACKING\';
% ==========Trials are called from .mat files 
% ============== here, and we put them into
% =================== the matrix A
 for (i = 1:1) 
    file_name =  'Zeshan_Trial';
    file_index = i;
    disp(sprintf('Loading trial no. %d . . . ', file_index''));
    Trials = [Trials load(sprintf( '%s%s%d_part1.mat', folder1, file_name,file_index))];
 end
 
% ============ Trials  are called one by one
%  Events in trials are called one by one
% Fixation for whole trial
x_LocationOfFixations = [];
y_LocationOfFixations = [];
time_Fixations=[];
x_calibs = [];
y_calibs = [];
Events_size_vector = [];
EyeSample_no_vector = [];
EyeCalbration_no_vector = [];

for (j=1:1) 
    E = Trials(j);
    Events_size=size(E.events,2);
    Events_size_vector = [Events_size_vector;Events_size];
    
    EyeSample_index = [];
    EyeCalbration_index=[];
    
    % Fixcations for a trial
    x_LocationOfFixation = [];
    y_LocationOfFixation=[];
    time_Fixation=[];
        
    Disp2= sprintf('Working on  data of trial no. %d  with %d events in it . . . ', j, Events_size);
    disp(Disp2);
    
     for(k=1:Events_size)
         % Getting indexs for x y locations info
          if (strcmp(E.events{k}.name,'eyeSample'))
              % saving x,y, and t into matrix
              EyeSample_index = [ EyeSample_index k ];
              x_LocationOfFixation = [x_LocationOfFixation  E.events{k}.rawEyeUnits(1)];
              y_LocationOfFixation = [y_LocationOfFixation  E.events{k}.rawEyeUnits(2)];
              time_Fixation = [time_Fixation  E.events{k}.sampleTimeSecs];                
          end
          if (strcmp(E.events{k}.name,'eyeCalibration')) 
              % getting index for degrees info
              EyeCalbration_index = [EyeCalbration_index k ];
          end          
     end
     
    EyeSample_no = size(EyeSample_index,2);
    EyeCalbration_no = size(EyeCalbration_index,2);
    EyeSample_no_vector = [EyeSample_no_vector;EyeSample_no ];
    EyeCalbration_no_vector = [EyeCalbration_no_vector; EyeCalbration_no];
    
    disp(sprintf('      >>>  No of fixation points[x,y]  or eyeSamples are : %d',EyeSample_no));
    disp(sprintf('      >>>  No of eyeCalibrations are : %d',EyeCalbration_no)); 
    
    %-------- Saving   locations and times ------%
% %     save (sprintf('%sX-%d.mat',location2,j),'x_LocationOfFixation');
% %     dlmwrite(sprintf('%sX-%d.txt',location2,j),x_LocationOfFixation,'precision',8)
% %     save(sprintf('%sY-%d.mat',location2,j), 'y_LocationOfFixation');
% %     dlmwrite(sprintf('%sY-%d.txt',location2,j),y_LocationOfFixation,'precision',8)
     save (sprintf('%sT-%d.mat',location2,j), 'time_Fixation');
     %dlmwrite(sprintf('%sT-%d.txt',location2,j),time_Fixation,'precision',16)
   
% ----------------- plot test for Xs-------------%
%       figure;
%       plot(x_LocationOfFixation);
% ----------------- plot test for Ys ------------%
%     figure;
%     hold on;
%     plot(y_LocationOfFixation,'r');
%      hold off    
    x_LocationOfFixations = [x_LocationOfFixations x_LocationOfFixation ];
    y_LocationOfFixations = [y_LocationOfFixations y_LocationOfFixation];
    time_Fixations=[time_Fixations time_Fixation];

     % Saving XYT in a same place for each event
% %     BIGPrime = [double(x_LocationOfFixation); double(y_LocationOfFixation);time_Fixation];
% %     BIG = BIGPrime';
% %     save (sprintf('%sXYT-%d.mat',location2,j),'BIG');
% %     dlmwrite( sprintf('%sXYT-%d.txt',location2,j),BIG,'newline', 'pc','precision',16)
    
    % Now, working on clibrated points
    x_calib = double(zeros(1, EyeSample_no));
    y_calib = double(zeros(1, EyeSample_no));   
    distance = double(zeros(EyeSample_no,1));
  for(ii = EyeSample_no:-1:1 )
         for(jj =EyeCalbration_no: -1 : 1 )
                 if (EyeSample_index(ii)>= EyeCalbration_index(jj) )
                           Xunit = E.events{EyeSample_index(ii)}.rawEyeUnits(1);
                           Yunit = E.events{EyeSample_index(ii)}.rawEyeUnits(2);
                           m11 = E.events{EyeCalbration_index(jj)}.units2Deg(1);
                           m21 = E.events{EyeCalbration_index(jj)}.units2Deg(2);
                           tx = E.events{EyeCalbration_index(jj)}.units2Deg(3);
                           m12 = E.events{EyeCalbration_index(jj)}.units2Deg(4);
                           m22 = E.events{EyeCalbration_index(jj)}.units2Deg(5);
                           ty = E.events{EyeCalbration_index(jj)}.units2Deg(6);
                           x_calib(ii) = (m11 *double(Xunit)) + (double(Yunit)* m21)+ tx;
                           y_calib(ii) = (m12 *double(Xunit)) + (double(Yunit) * m22 )+ ty;
                           distance(ii,1) = sqrt( x_calib(ii)^2 + y_calib(ii)^2 );
                  end ;
        end;
  end
        save(sprintf('%sx_calib-%d.mat',location2,j),'x_calib');
        save(sprintf('%sy_calib-%d.mat',location2,j),'y_calib');
        save(sprintf('%sdistance-%d.mat',location2,j),'distance');
        plot(distance)
     
        %dlmwrite(sprintf('%sx_calib-%d.txt',location2,j),x_calib,'precision',8);
        %dlmwrite(sprintf('%sy_calib-%d.txt',location2,j),y_calib,'precision',8);
        
        x_calibs = [x_calibs x_calib];
        y_calibs = [y_calibs y_calib];
      
        
        BINGOPrime = [abs(double(round(100*x_calib))); abs(double(round(100*y_calib)));time_Fixation];
        BINGO = BINGOPrime';
        save (sprintf('%sXYT_calib-%d.mat',location2,j),'BINGO');
        dlmwrite(sprintf('%sXYT_calib-%d.txt',location2,j),BINGO,'newline', 'pc','precision',16)
    
end
 save(sprintf('Events_number_vector.mat'), 'Events_size_vector');
 save(sprintf('EyeSample_number_vector.mat'), 'EyeSample_no_vector');
 save(sprintf('EyeCalbration_number_vector.mat'), 'EyeCalbration_no_vector');
 
%-------- Saving   locations and times ------%
% % save(sprintf('%sX.mat',location2), 'x_LocationOfFixations');
% % dlmwrite(sprintf('%sX.txt',location2),x_LocationOfFixations,'precision',8)
% % save(sprintf('%sY.mat',location2), 'y_LocationOfFixations');
% % dlmwrite(sprintf('%sY.txt',location2),y_LocationOfFixations,'precision',8)
save(sprintf('%sT.mat',location2), 'time_Fixations');
%dlmwrite(sprintf('%sT.txt',location2),time_Fixations,'precision',16)

% % BIGYPrime = [double(x_LocationOfFixations); double(y_LocationOfFixations);time_Fixations];
% % BIGY = BIGYPrime';
% % save (sprintf('%sXYT.mat',location2),'BIGY');
% % dlmwrite(sprintf('%sXYT.txt',location2),BIGY,'newline', 'pc','precision',16) ; 
 
save(sprintf('%sX_calib.mat',location2), 'x_calibs');
save(sprintf('%sY_calib.mat',location2), 'y_calibs');
dlmwrite(sprintf('%sX_calib.txt',location2),x_calibs,'precision',8);
dlmwrite(sprintf('%sY_calib.txt',location2),y_calibs,'precision',8);

BINGOsPrime = [abs(double(round(100*x_calibs))); abs(double(round(100*y_calibs)));time_Fixations];
BINGOs = BINGOsPrime';
save (sprintf('%sXYT_calib-%d.mat',location2,j),'BINGO');
dlmwrite(sprintf('%sXYT_calib-%d.txt',location2,j),BINGO,'newline', 'pc','precision',16)



