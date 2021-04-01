close all;
clear all;

Fs = 32000 %sample f
T = 2 %period no.
samples = [1,T*Fs]; %samples no
dt = 1/Fs;
h = [0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 1 1 1 ];

%load signals
[sig1, Fs] = audioread ('voice_short.wav', samples);
[sig2, Fs] = audioread('voice_short.wav', samples);

%convout
out = conv(sig2,h);

%Times
t1 = 0:dt:(length(sig1)*dt)-dt;
t2 = 0:dt:(length(out)*dt)-dt;

%subplot signal not conv
figure(1)
subplot(211)
plot(t1,sig1)
title({"Originální nahrávka"});
xlabel('Time [s]');
ylabel('Amplitude [-]');
ylim("auto");
grid on;

%subplot conv signal
subplot(212)
plot(t2,out,'r')
title({"Výstupní signál po konvoluci"});
xlabel('Time [s]');
ylabel('Amplitude [-]');
ylim("auto");
axis([0 2])
grid on;
 
%player
%sound(sig1, Fs);  % play original soundfile
#sound(out, Fs);  % play convolved soundfile

%Figures convolution
figure(2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h1 = [1 2 1;  2 4 2; 1 2 1];
h2=  [1 4	6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1];

image = imread('fruit_grey.jpg');
image2 = conv2(image,h1, 'same');
image3 = conv2(image,h2,'same');
%imshow(image)
imshow(image3,[])