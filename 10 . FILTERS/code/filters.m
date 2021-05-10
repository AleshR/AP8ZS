close all;
F_smpl = 900;
F_noise = 50;
ampl = 30;
%FFT
N=1024;
Tnoise = linspace(0,length(ECG_signal),length(ECG_signal));

signal = ECG_signal-mean(ECG_signal); %ECG without DC

noise50 = ampl*sin(2*pi*F_noise*Tnoise)'; %50Hz noise
noise = noise50.*(randn(size(noise50)));
sig_n_noise = signal+noise; 

FIR = fir1(100,[0.1 0.2], 'stop');
x_fir = filter(FIR, 1, sig_n_noise);

IIR = cheby1(20, 1 ,[0.4 0.8], 'stop');
x_iir = filter(IIR, 1, sig_n_noise);
scale = max(signal)/max(x_iir);
x_iir = x_iir*scale;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FOURIER
fouri=fft(signal,N)/N;
y=fftshift(fouri)/N;

df=F_smpl/N;%Step
f_dbl = (-F_smpl/2):df:(F_smpl/2)-df;%Faxis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
subplot(511)
plot(signal);
title('Original ECG');

subplot(512)
plot(noise);
title('Noise 50Hz');

subplot(513)
plot(sig_n_noise);
title('Noised ECG');

subplot(514)
plot(x_fir);
hold on;
plot(signal);
title('FIR filtered');

subplot(515)
plot(x_iir);
hold on;
plot(signal);
title('IIR filtered');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(211)
stem(f_dbl,abs(y));
title("Signal in f domain - amplitude");
xlabel('Frequency [Hz]');
ylabel('Amplitude [V]');
grid on;

subplot(212)
stem(f_dbl, abs(y.^2));
title("Signal in f domain - power");
xlabel('Frequency [Hz]');
ylabel('Power [W]');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
[H,w]=freqz(x_fir,1,1000);  %w je v rad/sample
[H1,w1]=freqz(x_iir,1,1000);  %w je v rad/sample

subplot(211)
plot(w*F_smpl/(2*pi),abs(H));
grid on;
title('Frequency response FIR');

subplot(212)
plot(w1*F_smpl/(2*pi),abs(H1));
grid on;
title('Frequency response IIR');