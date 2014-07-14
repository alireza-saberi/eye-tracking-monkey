% bin maker version 2
clc
close all;
clear all;
folder = 'D:\DRIVE C\SCIENTIFIC-DRIVE\MNI-research-center\eye-tracking\code\MATLAB-CODE\MONKEY-TRACKING\';

% set bins round 1
nLow = -30; nHigh = 30;
stepSize = 0.1;

xedges = -3:0.1:3;
yedges = -3:0.1:3;


for (ii= 1:1)
    load(sprintf('%sx_calib-%d',folder,ii));
    load(sprintf('%sy_calib-%d',folder,ii));
    %t  = 0.08 * ones(length(x_calib),1);
%     t = [0: 0.08: 327.76];
%     figure;
%     c = linspace(10,20,length(x_calib));
%     s=c;
%     scatter(x_calib,y_calib,s,c);
%     axis([-30 30 -30 30]);
%     grid on;
%     colormap(jet)
    % transform to integer values based on stepSize
     % stepSize is an offset so the number lies between the bin boundaries
    x2 = floor(abs(x_calib)/stepSize )*stepSize;
    y2 = floor(abs(y_calib)/stepSize)*stepSize;
    
       
     histmat = hist2(x_calib, y_calib, xedges, yedges); 
     figure; pcolor(xedges,yedges,histmat'); colorbar ; axis square tight; 
 


    %  figure
    %c = linspace(10,20,length(x2));
    %s=c;
    %scatter(x2,y2,s,c);
    %axis([-3 3 -3 3]);
    %grid on;
    %colormap(jet)
    %xyt = [10*x2' 10*y2'  t];
    %save(sprintf('xytEYETRACKET-%d.mat',ii),'x2');
    %dlmwrite(sprintf('xytEYETRACKET-%d.txt',ii),xyt,'newline', 'pc','precision',4)
    
%     scatter3(x2',y2',t')
%     axis([0 3 0  3 0  350]);

%      
%      
%       for ( jj = 1:length(x_calib))
%             for  (kk = 1:length(x_seed))
%                 if (x_calib(jj) >= x_seed(kk))
%                     x_bin(jj) = x_seed(kk);
% %                   if (x_bin(jj) < 0.1) 
% %                       x_bin(jj) = 0;
% %                   end
%                 end
%             end
%       end
%        
%       for ( jj = 1:length(y_calib))
%             for  (kk = 1:length(y_seed))
%                 if (y_calib(jj) >= y_seed(kk))
%                     y_bin(jj) = y_seed(kk);
% %                   if (y_bin(jj) < 0.1) 
% %                       y_bin(jj) = 0;
%                 end
%             end
%        end
% 
% % counting X bins        
% for i=1: length(x_bin)
%     for j = 1: length(x_seed)
%         if  (x_bin(i) ==  x_seed(j) )
%             counterX(j) = counterX(j) + 1;
%         end   
%     end
% end   
% save(sprintf('Xcounter-%d.mat',ii),'counterX');
% 
% % counting Y bins        
% for i=1: length(y_bin)
%     for j = 1: length(y_seed)
%         if  (y_bin(i) ==  y_seed(j) )
%             counterY(j) = counterY(j) + 1;
%         end   
%     end
% end        
% save(sprintf('Ycounter-%d.mat',ii),'counterY');
% 
% % % counting X-Y bins   
% %  length(x_seed)
% %  length(y_seed)
% %  
% %  for i=1: length(x_bin)
% %      i
% %      for ii = 1:  length(y_bin)
% %         for j = 1: length(x_seed)
% %              for jj = 1: length(y_seed)
% %                  if  (x_bin(i) ==  x_seed(j) && y_bin(ii) ==  y_seed(jj))
% %                          counterXY(j,jj) = counterXY(j,jj) + 1;
% %                  end   
% %              end
% %          end
% %      end
% %  end    

end