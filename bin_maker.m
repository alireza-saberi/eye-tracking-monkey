% the bin maker!
clc
clear all;
folder = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\eye-tracking\code\MATLAB-CODE\MONKEY-TRACKING\';
format short;
x_seed = [-147: 1.2: 36];
y_seed = [-120: 1.2: 130];
 counterX = zeros(1, length(x_seed));
 counterY = zeros(1, length(y_seed));
% counterXY = zeros(length(x_seed), length(y_seed));
% size(counterXY)

for (ii= 1:15)
    load(sprintf('%sx_calib-%d',folder,ii));
    load(sprintf('%sy_calib-%d',folder,ii));
   
     x_bin = zeros(1, length(x_calib));
     y_bin = zeros(1, length(y_calib));  
     figure
     hist(x_calib,x_seed)
     figure
     hist(y_calib,y_seed)
     
     
      for ( jj = 1:length(x_calib))
            for  (kk = 1:length(x_seed))
                if (x_calib(jj) >= x_seed(kk))
                    x_bin(jj) = x_seed(kk);
%                   if (x_bin(jj) < 0.1) 
%                       x_bin(jj) = 0;
%                   end
                end
            end
      end
       
      for ( jj = 1:length(y_calib))
            for  (kk = 1:length(y_seed))
                if (y_calib(jj) >= y_seed(kk))
                    y_bin(jj) = y_seed(kk);
%                   if (y_bin(jj) < 0.1) 
%                       y_bin(jj) = 0;
                end
            end
       end

% counting X bins        
for i=1: length(x_bin)
    for j = 1: length(x_seed)
        if  (x_bin(i) ==  x_seed(j) )
            counterX(j) = counterX(j) + 1;
        end   
    end
end   
save(sprintf('Xcounter-%d.mat',ii),'counterX');

% counting Y bins        
for i=1: length(y_bin)
    for j = 1: length(y_seed)
        if  (y_bin(i) ==  y_seed(j) )
            counterY(j) = counterY(j) + 1;
        end   
    end
end        
save(sprintf('Ycounter-%d.mat',ii),'counterY');

% % counting X-Y bins   
%  length(x_seed)
%  length(y_seed)
%  
%  for i=1: length(x_bin)
%      i
%      for ii = 1:  length(y_bin)
%         for j = 1: length(x_seed)
%              for jj = 1: length(y_seed)
%                  if  (x_bin(i) ==  x_seed(j) && y_bin(ii) ==  y_seed(jj))
%                          counterXY(j,jj) = counterXY(j,jj) + 1;
%                  end   
%              end
%          end
%      end
%  end    

end


