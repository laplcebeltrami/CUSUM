function z = CUSUM_normalize(y)
%function function z = CUSUM_normalize(y)
%
% Normalize time series y for CUSUM computation. 
%
% (C) 2023 Moo K. Chung
% University of Wisconsin-Madison


mean_data = mean(y);
std_data = std(y);
z = (y -mean_data)/std_data;

