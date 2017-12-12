global T ndata logcellNum

T = [0 10 12 14 16 18 20 22];
ndata = length(T);
cellNum = zeros(ndata, 1);

cellNum(1) = 100000;
load('cells.mat')
for i = 2:ndata
    cellNum(i) = sum(sum(sum(cells(:,:,:,i-1))));
end

logcellNum = log(cellNum);

plot(...
    T ...
    , cellNum ...
    , '.-' ...
    , 'markersize', 30 ...
    , 'linewidth', 3 ...
    , 'color', 'blue' ...
    );
hold on;

lambda = 10;
c = 0.1;
sigma = 1;

parameters = [lambda c sigma];

avariable = fminsearch(@functiontwo,parameters);

disp(['lambda = ',num2str(avariable(1)),' c = ',num2str(avariable(2)),' sigma = ' num2str(avariable(3))]);

N0 = 100000;
points = 0:.05:25;
plottingvector = N0 * exp(avariable(1)*(1 - exp(-avariable(2)*points)));

hold on;
plot(points...
    , plottingvector ...
    , 'color', 'red' ...
    , 'linewidth', 3 ...
    );

xlabel('Time [days]')
ylabel('Tumor Cell Count')
legend({'Experimental Data','Gompertzian Fit'}, 'location','northwest');
title('Gompertzian Fit to Rat''s Brain Tumor Growth');

saveas(gcf,'GrowthModel.png');
