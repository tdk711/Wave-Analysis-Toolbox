function [Tm, Hm, Trms, Hrms, Hs, Ho, heights] = dcp(t, e)
%% Assigning Variables:
e = (e - mean(e))';
t = t';
dt = t(2)-t(1);
fs = 1/dt;
indx = [];
tm = [];

%% Down-Crossing Calculations:

for i = 1:1:(length(t)-1)
    if e(i+1)<0 && e(i)>0 
        indx = [indx i];
        tm = [tm (t(i)+t(i+1))/2];
    end
end


periods = zeros(1,length(indx)-1);
heights = zeros(1,length(indx)-1);

for i = 1:1:(length(indx)-1)
    periods(i) = tm(i+1)-tm(i);
    heights(i) = max(e(indx(i):indx(i+1)))-min(e(indx(i):indx(i+1)));
end

heights = sort(heights, 'descend');


%% Results
Tm = mean(periods);
Hm = mean(heights);

Trms = rms(periods);
Hrms = rms(heights);

Hs = mean(heights(1,1:floor(length(heights)/3)));
Ho = mean(heights(1,1:floor(length(heights)/10)));

end

