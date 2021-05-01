close all;

Fs = 300;

%FFT
N=1024
fouri=fft(ECG_signal,N)/N;
y = fouri(1:N/2);

df=Fs/N;%Step
f_single = linspace(0,Fs/2,N/2);

figure(1)
subplot(3,1,1)
plot(ECG_signal);
title('Original ECG');

figure(2)
subplot(211)
stem(f_single,abs(y));
title("Signal in f domain - amplitude");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(f_single, abs(y.^2));
title("Signal in f domain - power");
xlabel('Frequency [Hz]');
ylabel('Angle [-]');
grid on;
