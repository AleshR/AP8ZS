%close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSTS
f_sample = 100; %hz
f_signal = 1/10;
t = -2*pi:1/f_sample:(2*pi);

Amp = 20;
DC = 20;

N3 = 3;
N10 = 10;
N30 = 300;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIGNAL
y = DC+Amp*sawtooth((1/(2*f_signal*pi))*t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=2*Amp/pi;
y_f = Amp;

function y_f = fouri(N,y_f,a,t)
  for i=1:N
    y_f=y_f+a*((-1)^(i-1))*(1/i)*sin(i*t); %((-1)^(i-1) mi vzdycky otaci sinus a cosinus
  end
end

subplot(3,1,1);
plot(t,y);
hold on;
plot(t,fouri(N3,y_f,a,t));
title(strcat('Fourierova řada pro N = ',' ',num2str(N3)));
grid on;

subplot(3,1,2);
plot(t,y);
hold on;
plot(t,fouri(N10,y_f,a,t));
title(strcat('Fourierova řada pro N = ',' ',num2str(N10)));
grid on;

subplot(3,1,3);
plot(t,y);
hold on;
plot(t,fouri(N30,y_f,a,t));
title(strcat('Fourierova řada pro N = ',' ',num2str(N30)));
grid on;
