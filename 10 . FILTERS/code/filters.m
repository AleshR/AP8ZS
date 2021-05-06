close all;

F_smpl = 300;
F_noise = 50;
ampl = 10;
%FFT
N=1024;
Tnoise = linspace(0,length(ECG_signal),length(ECG_signal));

signal = ECG_signal-mean(ECG_signal); %ECG without DC
noise50 = ampl*sin(2*pi*F_noise*Tnoise)'; %50Hz noise
noise = noise50.*(0.1*ampl).*(randn(size(noise50)));

sig_n_noise = signal+noise; 

FIR = fir1(12,[0.49,0.51], 'stop');
x_fir = filter(FIR, 1, sig_n_noise);

IIR = cheby1(8, 5 ,[0.45,0.55], 'stop');
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
legend('FIR','Original');

subplot(515)
plot(x_iir);
hold on;
plot(signal);
title('IIR filtered');
legend('IIR','Original');

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

%figure(3)
%subplot(211)
%plot(freqz(x_fir,300));
%title('Frequency response FIR');
%
%subplot(212)
%plot(freqz(x_iir,300));
%title('Frequency response IIR');