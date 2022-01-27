function [f, spe] = spectrum(t, e, M)
    
dt = t(2)-t(1);
fs = 1/dt;
n = 2^(floor(log2(length(e))));
N = n/M;
 %% FFT:
f = (1/(2*dt))*(0:(N/2))/(N/2);
p = zeros(M,N);

for i = 1:1:M
    ei = e(1,((N*(i-1))+1):N*i);
    z = fft(ei,N);
    p(i,:) = 2*((z.*conj(z))/(N*fs));
end

p = mean(p);

p_h = zeros(1,N);
p_h(1)=p(1);

%% Hanning Smoothing:
for i = 2:1:(size(p,2)-1)
    p_h(i) = 0.5*p(1,i) + 0.25*(p(1,i-1) + p(1,i+1));
end


spe = p_h(1:((N/2)+1));

end

