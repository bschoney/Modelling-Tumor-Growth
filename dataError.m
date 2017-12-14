time = [0 10 12 14 16 18 20 22];
bounds = zeros(8,1);
tumors = zeros(8,1);
for i = 1:7  
    errorcount = 0;
    tumors(i+1) = sum(sum(sum(cells(:,:,:,i)))).*10.^(-7);
    for z = 1:size(cells ,3)
        dbin = cells(:,:,z,i);
        bin = imbinarize(dbin);
        bw = bwboundaries(bin);
        for s = 1:length(bw)
            boundary = bw{s};
            for j = 1:size(boundary, 1)
                errorcount = errorcount + dbin(boundary(j,1), boundary(j,2));
            end
        end
    end
    bounds(i) = errorcount *10.^(-7).*(.5);
end

errorbar(time, tumors, bounds)
fig = gcf;
title('Gomperzian Fit For Rat Brain Tumor Growth')
xlabel('Time [days]');
ylabel('Tumor cell count');
legend('Experimental Data', 'location', 'northwest')
saveas(gcf,'errorPlot.png'); 
  