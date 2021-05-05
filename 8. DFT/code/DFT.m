clear all;
close all;

f3=32; %32Hz
f2=64; %64Hz
f1=128; %128Hz

A3=2;
A2=1;
A1=-1;
DC=-3;

f_smpl=1024; %Hz
t=0:1/f_smpl:(4/f3);
N=128;

%Signal
x=DC + (A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t) + A3*cos(2*pi*f3*t));

%Signal + noise
noise = (randn(size(t)));
x_noise = noise + x;

%FFT
fouri=fft(x,N)/N;
y=fftshift(fouri)/N;

%FILTEEEEEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRR
fouri(fouri<0.00001) = 0;
y(y<0.00001) = 0;

%FILTEEEEEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRR

%FFT_noise
fouri_n=fft(x_noise,N)/N;
y_n=fftshift(fouri_n)/N;

%FILTEEEEEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRR
y_n(y_n<0.00001) = 0;
fouri_n(fouri_n<0.00001)=0;

%FILTEEEEEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRR



df=f_smpl/N;%Step
f_dbl = (-f_smpl/2):df:(f_smpl/2)-df;%Faxis
%f_dbl = linspace(-f_smpl/2,f_smpl/2, N)
%fa = 0:df:((N/2)*df-df);%Half f_axis
%fa = 0:df:f_smpl/2-df;
fa = linspace(0,f_smpl/2,N/2);

% Bez SUMU %
figure(1)
plot(t,x,'-o-')
title("Signal in timedomain");
xlabel('Time [s]');
ylabel('Amplitude [V]');
grid on;

figure(2)
subplot(211)
stem(f_dbl,abs(y));
title("Signal in f domain - amplitude");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(f_dbl, angle(y)*180/pi);
title("Signal in f domain - phase");
xlabel('Frequency [Hz]');
ylabel('Angle [-]');
grid on;

figure(3)
subplot(211)
stem(fa, abs(fouri(1:N/2)));
title("Signal in f domain - single sided");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(fa,angle(fouri(1:N/2))*180/pi);
title("Signal in f domain - single sided");
xlabel('Frequency [Hz]');
ylabel('Phase [-]');
grid on;

%Signal + noise
figure(4)
plot(t,x_noise,'r')
title("Signal in timedomain");
xlabel('Time [s]');
ylabel('Amplitude [V]');
grid on;

figure(5)
subplot(211)
stem(f_dbl,abs(y_n),'r');
title("Signal in f domain - amplitude");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(f_dbl, angle(y_n)*180/pi,'r');
title("Signal in f domain - phase");
xlabel('Frequency [Hz]');
ylabel('Angle [-]');
grid on;

figure(6)
subplot(211)
stem(fa, abs(fouri_n(1:N/2)),'r');
title("Signal in f domain - single sided");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(fa,angle(fouri_n(1:N/2))*180/pi,'r');
title("Signal in f domain - single sided");
xlabel('Frequency [Hz]');
ylabel('Phase [-]');
grid on;
