function [pos neg] = CUSUM_stat(y, omega)
%function change_point = CUSUM_stat(y, omega)
%
% Performs the CUSUM_test, which detects the change point in a time series.
%
% Input:
%   y: Time series data 
%   omega: Threshold for calculating the cumulative sum
%
% Output:
%   pos, neg: postive and negative change of CUSUM

% (C) 2023 Moo K. Chung
% University of Wisconsin-Madison


% Get the length of the time series
n = length(y);


% Initialize the cumulative sum for positive and negative directions
pos = zeros(n, 1);
neg = zeros(n, 1);

% Calculate the CUSUM test statistics for positive and negative directions
for t = 2:n
    pos(t) = max(0, pos(t-1) + y(t) - omega);
    neg(t) = min(0, neg(t-1) - y(t) - omega);
end


for t = 2:n
    pos(t) = max(0, pos(t-1) + y(t) - omega);
    neg(t) = min(0, neg(t-1) - y(t) - omega);
end

