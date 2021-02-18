clear all;

NP = 3;  %number of period
N= 128;  %length of the signal
DC = 0;  %offset
A= 10;   %amplitude

fsig = 5;  %frequency of the signal

%sampling frequency (fs) is calculated:

Tsig=1/fsig;
fs= 1/ (NP*Tsig/N);
Ts=1/fs;   %sampling period

k = 0:N-1;
y = DC + A*cos(2*pi*fsig*k*Ts);
