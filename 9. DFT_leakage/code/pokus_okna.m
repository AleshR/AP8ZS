% FIR filtr pasmova propust  prikaz fir1 - metoda zpetne fourierovy
% transformace a oken; rad filtru 50; propustne pasmo 130-150 Hz
% pouzito kaiserovo okno beta=0.5
clear all;
Fv=2000;
Tv=1/Fv;
t=0:Tv:200e-3;
tmax=max(t);
N=length(t);
f=(0:N-1)/tmax;

s1=sin(2*pi*50*t);
s2=sin(2*pi*140*t);
s3=sin(2*pi*250*t);


signal=s1+s2+s3;

SIGNAL=fft(signal);
V=SIGNAL.*conj(SIGNAL)/N;
plot(f,V);
title('vykonove spektrum nefiltrovaneho signalu');

b=fir1(20,[0.13 0.15]);   %neni-li zadan parametr okno, je pouzito Hammingovo okno
x=filter(b,1,signal);
X=fft(x);
XX=X.*conj(X)/N;
figure;
plot(f,XX);
title('vykonove spektrum filtrovaneho signalu - rad filtru 20');


b1=fir1(20,[0.13 0.15],kaiser(21)); %pouzito kaiserovo okno; parametr 21 je delka okna - musi souhlasit s delkou filtru (tj. rad filtru + 1)
x1=filter(b1,1,signal);
X1=fft(x1);
XX1=X1.*conj(X1)/N;
figure;
plot(f,XX1);
title('vykonove spektrum filtrovaneho signalu - rad filtru 20, kaiserovo okno');




pause;

plot(t,signal);
title('nefiltrovany signal');

figure;
plot(t,x);
title('filtrovany signal-rad filtru 20, kaiserovo okno');

figure;
plot(t,x1);
title('filtrovany signal-rad filtru 20');




pause;

[H,w]=freqz(b,1,512);  %w je v rad/sample
[H1,w1]=freqz(b1,1,512);


plot(w*Fv/(2*pi),abs(H));
hold on;
stairs([0 130 150 1000],[0 1 0 0]);
title('magnituda frekvencni charakteristiky filtru - rad filtru 20');

figure;

plot(w1*Fv/(2*pi),abs(H1));
hold on;
stairs([0 130 150 1000],[0 1 0 0]);
title('magnituda frekvencni charakteristiky filtru - rad filtru 20, kaiserovo okno');

