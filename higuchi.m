function fd = higuchi(x, kmax)
% input:    x       data
% output:   fd      fractal dimension estimate (using Higuchi method)
% 
% (C) 2023 Tom Burns
% Neural Coding and Brain Computing Unit
% OIST Graduate University
% 1919-1 Tancha, Onna-son
% Okinawa, Japan 904-0495
% http://tfburns.com
%
% history: modified by Chung

% set-up
N =      length(x); % get length of signal
%kmax =   5; % maximal degree of reduction/degree of time stretch (increasing this will increase FD estimates)
Lmk =    zeros(kmax,kmax);

% get the mean length of curve
for k = 1:kmax,
    for m = 1:k,
        Lmki = 0;
        for i=1:fix((N-m)/k),
            Lmki = Lmki+abs(x(m+i*k)-x(m+(i-1)*k));
        end;
        Ng =        (N-1)/(fix((N-m)/k)*k);
        Lmk(m,k) =  (Lmki*Ng)/k;
    end;
end;

Lk = zeros(1,kmax);
for k = 1:kmax,
    Lk(1,k) = sum(Lmk(1:k,k))/k;
end;

% calculate the logarithmic values for slope calculation (which is the FD estimate)
lnLk =  log(Lk);
lnk =   log(1./[1:kmax]);

% calculate the slope and assign it to output
b =     polyfit(lnk,lnLk,1);
fd =    b(1);