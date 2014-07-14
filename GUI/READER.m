%  This is the Matlab function Deleveloped by 
%  Alireza Saberi  in  prfessor Amir Shmuel  lab
% McGill University, Montreal, Quebec, Canada

function READER(folder, TrialNo)

str1= 'Ali_EyeTecker_Analyzer_Tool\';
address = strcat(folder,str1);
mkdir(strcat(folder,str1));
format long;
Trials = [];
h = waitbar(0,'Looding experiment trials ......');
pause(0.5);

% ==========Trials are called from .mat files 
% ============== here, and we put them into
% =================== the matrix A
 for (i = 1:TrialNo) 
    file_name =  'Zeshan_Trial';
    file_index = i;
    h = waitbar(i/TrialNo,h,sprintf('Loading trial no. %d . . . ', file_index''));
    Trials = [Trials load(sprintf( '%s%s%d_part1.mat', folder, file_name,file_index))];
 end
 close ;

% ============ Trials  are called one by one
%  Events in trials are called one by one
% Fixation for whole trial
x_LocationOfFixations = [];
y_LocationOfFixations = [];
distances =[];
x_calibs = [];
y_calibs = [];
Events_size_vector = [];
EyeSample_no_vector = [];
EyeCalbration_no_vector = [];

g = waitbar(0,'Working experiment data ......');
pause(0.5);
for (j=1:TrialNo) 
    E = Trials(j);
    Events_size=size(E.events,2);
    Events_size_vector = [Events_size_vector;Events_size];
    
    EyeSample_index = [];
    EyeCalbration_index=[];
    
    % Fixcations for a trial
    x_LocationOfFixation = [];
    y_LocationOfFixation=[];
    time_Fixation=[];
    
     g = waitbar(j/TrialNo,g,sprintf('Working on data of trial no. %d   . . . ', j));
     pause(0.3);
    
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
    
   
    %-------- Saving locations and times ------%
     save (sprintf('%sCalibrated_T_%d.mat',address,j), 'time_Fixation');

     
    x_LocationOfFixations = [x_LocationOfFixations x_LocationOfFixation ];
    y_LocationOfFixations = [y_LocationOfFixations y_LocationOfFixation];
%     time_Fixations=[time_Fixations time_Fixation];

    % Now, working on clibrated points
    x_calib = double(zeros(1, EyeSample_no));
    y_calib = double(zeros(1, EyeSample_no));   
    distance = double(zeros(1,EyeSample_no));
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
                           distance(1,ii) = sqrt( x_calib(ii)^2 + y_calib(ii)^2 );
                  end ;
        end;
  end
        xy_calib = [x_calib' y_calib'];
        %save(sprintf('x_calib-%d.mat',j),'x_calib');
        %save(sprintf('y_calib-%d.mat',j),'y_calib');
        save(sprintf('%scalibrated_xy_%d.mat',address,j),'xy_calib');
        save(sprintf('%scalibrated_distance_%d.mat',address,j),'distance');
        
        x_calibs = [x_calibs x_calib];
        y_calibs = [y_calibs y_calib];
        distances =[distances distance];
      
        BINGOPrime = [(((x_calib))); (((y_calib)));time_Fixation];
        BINGO = BINGOPrime';
        save (sprintf('%scalibrated_xyt_%d.mat',address,j),'BINGO');
        dlmwrite(sprintf('%scalibrated_xyt_%d.txt',address,j),BINGO,'newline', 'pc','precision',16)
    
end
close;
save(sprintf('%sEvents_number_vector.mat',address), 'Events_size_vector');
save(sprintf('%sEyeSample_number_vector.mat',address), 'EyeSample_no_vector');
save(sprintf('%sEyeCalbration_number_vector.mat',address), 'EyeCalbration_no_vector');
 
%-------- Saving   locations and times ------%
XY_calibs = [x_calibs' y_calibs'];
save(sprintf('%scalibrated_XY.mat',address), 'XY_calibs');
save(sprintf('%scalibrated_distances.mat',address), 'distances');


BINGOsPrime = [abs(double(round(100*x_calibs))); abs(double(round(100*y_calibs)));80*ones(1,length(y_calibs))];
BINGOs = BINGOsPrime';
save (sprintf('%scalibrated_XYT_%d.mat',address,j),'BINGO');
dlmwrite(sprintf('%scalibrated_XYT_%d.txt',address,j),BINGO,'newline', 'pc','precision',4)



