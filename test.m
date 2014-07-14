close all;
% generate points in x-y coordinate
p = randn(10000,2);
figure(1),subplot(2,2,1),plot(p(:,1),p(:,2),'.');

% set bins
nLow = -5; nHigh = 5;
stepSize = 0.5;

% transform to integer values based on stepSize
% 0.5 is an offset so the number lies between the bin boundaries
p2 = floor(p/stepSize + 0.5);

% make every value positive with offset that is the length of bins
p3 = p2 - nLow/stepSize;
figure(1),subplot(2,2,2),plot(p3(:,1),p3(:,2),'.');

% make it 1D so that you can use the function 'unique'
% factor1D is some arbitrary large number
factor1D = 1000;
p4 = p3(:,1)+p3(:,2)*factor1D;

%type "doc unique" in command line for its description
[a,b,c] = unique(p4);

%generate bin matrix
im = zeros((nHigh-nLow)/stepSize+1);

%the only loop that is the size of 2D bin
for i = 1:length(a)
    im(floor(a(i)/factor1D),rem(a(i),factor1D)) = b(i);
end

figure(1),subplot(2,2,3),imagesc(im)

%plot the graph in the same as the original coordinate
figure(1),subplot(2,2,4),imagesc(nLow:stepSize:nHigh,nLow:stepSize:nHigh,flipud(im))

colormap jet