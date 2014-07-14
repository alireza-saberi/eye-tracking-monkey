  events = 1000000; 
  x1 = sqrt(0.05)*randn(events,1)-0.5; x2 = sqrt(0.05)*randn(events,1)+0.5; 
  y1 = sqrt(0.05)*randn(events,1)+0.5; y2 = sqrt(0.05)*randn(events,1)-0.5; 
  x= [x1;x2]; y = [y1;y2]; 
  
 %For linearly spaced edges: 
  xedges = linspace(-1,1,64); yedges = linspace(-1,1,64); 
  %xedges = [-1:0.1:1], yedges = [-1:0.1:1];
  histmat = hist2(x, y, xedges, yedges); 
  figure; pcolor(xedges,yedges,histmat'); colorbar ; axis square tight; 
  
 %For nonlinearly spaced edges: 
%   xedges_ = logspace(0,log10(3),64)-2; yedges_ = linspace(-1,1,64); 
%   histmat_ = hist2(x, y, xedges_, yedges_); 
%   figure; pcolor(xedges_,yedges_,histmat_'); colorbar ; axis square tight;