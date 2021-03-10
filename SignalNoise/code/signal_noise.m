clear all;
close all;
amp = 1; %amplituda
offset = 5; %DC složka

f_sig = 1; %frekvence signalu
f_samp = 100; %vzorkovaci frekvence

omega = 2*pi*f_sig %uhlova frekvence
t = 0:1/f_samp:2*1/f_sig; %zadefinovany pocet periodogram

%SNR consts
SNR5 = 5;
SNR10 = 10;
SNR25 = 25;

signal = offset+amp*sin(omega*t);%sig genetator

%SNR
function y = noisegen(SNRin, ampl, t, signal)
  SNRlin = ampl/sqrt(2)/10^(SNRin/20);
  noise = SNRlin*(randn(size(t)));
  SNR_test = 20*log10(rms(signal)/rms(noise));
  y = noise;
end

%sig+noise calc
sig_n_noise5 = signal + noisegen(SNR5, amp, t, signal);
sig_n_noise10 = signal + noisegen(SNR10, amp, t, signal);
sig_n_noise25 = signal + noisegen(SNR25, amp, t, signal); 

figure(1);
clf();
plot(t,signal,'r');

hold on;
plot(t,noisegen(SNR5, amp, t, signal),'k');

title({"Sinusový navzorkovaný průběh" ; "Amp = 1V, DC=5V, F_{sig} = 1Hz, F_{S} = 100 Hz"});
xlabel('Time [s]');
ylabel('Voltage [V]');
ylim("auto");
legend('Signal', 'Noise');
grid on;

figure(2);
clf();
plot(t,signal+noisegen(SNR25, amp, t, signal),'r');

title({"Sinus + superponovaný šum" ; 'SNR = 25 dB'});
xlabel('Time [s]');
ylabel('Voltage [V]');
ylim("auto");
grid on;
