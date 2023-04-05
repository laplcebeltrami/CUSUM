%Fractal Test for CUSUM
%
% (C) 2023 Moo K. Chung, Anass Y El Yaagoubi Bourakna, Hernando Ombao
% University of Wisconsin-Madison

%------------------------------
%CUSUM for white noise without any change point
rng(42); %fixeed random seed
n = 1000;
y = randn(n, 1); %white noise

% Calculate the mean and standard deviations and normalize time series.
z=CUSUM_normalize(y);
%CUMSUM computation
[pos neg] = CUSUM_stat(z,0);
%CUMSUM display
CUSUM_display(z,pos,neg)

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-50 50])

%-------------------------------
%CUSUM for random permutation of white noise 

zper=z(randperm(n)) %random permutation 
[pos neg] = CUSUM_stat(zper, omega);
CUSUM_display(zper,pos,neg);

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-50 50])

%% ------------------------------
%% CUSUM for signal with one change point
rng(42);
n = 1000;
y = randn(n, 1);
y(501:end) = y(501:end) + 3;  % Introduce a structural break at t=500

% Calculate the mean and standard deviations and normalize time series.
z=CUSUM_normalize(y);
%CUMSUM computation
[pos neg] = CUSUM_stat(z,0);
%CUMSUM display
CUSUM_display(z,pos,neg)

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-50 50])

%-----
% CUSUM for random permutation of signal with one lage change point
zper=z(randperm(n)) %random permutation 
[pos neg] = CUSUM_stat(zper, omega);
CUSUM_display(zper,pos,neg);

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-50 50])

%% ------------------------------
%% CUSUM for signal with two change point
rng(42);
n = 1000;
y = randn(n, 1);
% Introduce a structural break at t=500
y(501:750) = y(501:750) + 3;
% Introduce a second structural break at t=750
y(751:end) = y(751:end) - 2;

% Calculate the mean and standard deviations and normalize time series.
z=CUSUM_normalize(y);
%CUMSUM computation
[pos neg] = CUSUM_stat(z,0);
%CUMSUM display
CUSUM_display(z,pos,neg)

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-400 400])

%-----
% CUSUM for random permutation of signal with one lage change point
zper=z(randperm(n)) %random permutation 
[pos neg] = CUSUM_stat(zper, omega);
CUSUM_display(zper,pos,neg);

%Fractal computation
FD = higuchi(pos, 10); %Higucci fractal computation
title(['CUSUM         FD=', num2str(FD)])
ylim([-50 50])

%------
%% pvalue computation for signal with one change point

rng(42);
n = 1000;
y = randn(n, 1);
y(501:end) = y(501:end) + 3;  % Introduce a structural break at t=500

% Calculate the mean and standard deviations and normalize time series.
z=CUSUM_normalize(y);
%CUMSUM computation
[pos neg] = CUSUM_stat(z,0);
observed = higuchi(pos, 10);

tic
dist=[]
for i=1:100000
    zper=z(randperm(n)); %random permutation
    [pos neg] = CUSUM_stat(zper, omega);
    %Fractal computation
    FD = higuchi(pos, 10); %Higucci fractal computation
    dist=[dist FD];
end
toc

figure; %hisgrom with 25 bins
plot_distribution(dist, 25, observed)
xlabel('Fractional dimension')
transPval = online_pvalues(dist, observed);
pval = transPval(end)


%------
%% pvalue computation for signal with two change point

rng(42);
n = 1000;
y = randn(n, 1);
% Introduce a structural break at t=500
y(501:750) = y(501:750) + 3;
% Introduce a second structural break at t=750
y(751:end) = y(751:end) - 2;


% Calculate the mean and standard deviations and normalize time series.
z=CUSUM_normalize(y);
%CUMSUM computation
[pos neg] = CUSUM_stat(z,0);
observed = higuchi(pos, 10);

tic
dist=[]
for i=1:100000
    zper=z(randperm(n)); %random permutation
    [pos neg] = CUSUM_stat(zper, omega);
    %Fractal computation
    FD = higuchi(pos, 10); %Higucci fractal computation
    dist=[dist FD];
end
toc

figure; %hisgrom with 25 bins
plot_distribution(dist, 25, observed)
xlabel('Fractional dimension')
transPval = online_pvalues(dist, observed);
pval = transPval(end)



