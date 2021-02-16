f_sample = 100; %hz
f_signal = 1/10;
Amp = 20;
DC = 20;

N_3 = 30;
t = 0:1/f_sample:30;

y = DC+Amp*sawtooth(2*pi*f_signal*t);
subplot(311);
plot(t,y)
hold on;

Omega = 2*pi*f_signal;
a0 = 
an =
bn =
