close all;
clear all;
N = 2;
f_sig = 1;
f_sample = 100;
t = 0:1/f_sample:(2*1/f_sig);

AMP = 325;
DC = 0;
SNR = 20; %dB
SNRlin = 10^(SNR/20);

sine = DC+AMP*sin(2*f_sig*pi*t);

out_awgn = awgn(sine,SNR,'measured');
noise = SNRlin*(randn(size(t)));

out_alg = sine+noise;

%Pocitam neco spatne, nebo jenom blbe generuju šum?
SNR_realAWGN = 20*log10(rms(sine)/rms(out_awgn-sine));
SNR_realFNC = 20*log10(rms(sine)/rms(noise));

plot(t,sine,'color','r');
hold on;
plot(t,out_awgn,'color','b');
hold on;
plot(t,out_alg,'color','k');
hold on;
xlabel('t [s]');
ylabel('U [V]');
grid on;
set(gca, 'xtick', 0:0.2:2);
set(gca, 'ytick', -500:100:500);
legend('Čistý signál',strcat('AWGN: ',num2str(SNR_realAWGN)),strcat('Alg rndn: ', num2str(SNR_realFNC)));