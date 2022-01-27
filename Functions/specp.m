function [Tp, Hs, Tm, Tpm, Tzm] = specp(f, S)
[~,fp] = max(S);
Tp = 1/f(fp);

w = (2*pi).*f;
S1 = S./(2*pi);


for i=1:1:length(S1)
    if S1(i) < 0.001
        S1(i) = 0;
    end
end


% Moments
m0 = trapz(w, S1);
m1 = trapz(w, (w).*S1);
m2 = trapz(w, (w.^2).*S1);
m4 = trapz(w, (w.^4).*S1);

% Parameters
Hs = 4*sqrt(m0); 
Tm = (2*pi)*(m0/m1); 
Tpm = (2*pi)*sqrt(m2/m4);
Tzm = (2*pi)*sqrt(m0/m2);

end

