clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSTS
f_sample = 100; %hz
f_signal = 1/10;
t = 0:1/f_sample:30;

Amp = 20;
DC = 20;
N = 3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIGNAL
y = DC+Amp*sawtooth(2*pi*f_signal*t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Omega = 2*pi*f_signal;
function f = fouri(N,t,Omega,f_signal)
  a_0 = 2*pi*f_signal;
  
  for i=1:N
    a_n(i)=(2*f_signal)
  end  
end  

subplot(311);
plot(t,y)
hold on;



