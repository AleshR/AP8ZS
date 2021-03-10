%close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSTS
f_sample = 100; %hz
f_signal = 1/10;
T = 1/f_signal;

t = 0:1/f_sample:(4*pi);

Amp = 20;
DC = 20;

w0 = 1;

N3 = 3;
N10 = 10;
N30 = 30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIGNAL
y = DC+Amp*sawtooth((1/(2*f_signal*pi))*t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

myFunc=@(t) (4*t);
%  myFunc=@(t) exp(-t);
% myFunc=@(t) exp(-t).*sin(10*t);
y=myFunc(t);

A0=(2/T)*quadv(myFunc,0,4*pi);

%subplot(3,1,1);
%plot(t,y);
%hold on;
%plot(t,fouri(N3,y_f,a,t,w0));
%title(strcat('Fourierova řada pro N = ',' ',num2str(N3)));
%grid on;
%
%subplot(3,1,2);
%plot(t,y);
%hold on;
%plot(t,fouri(N10,y_f,a,t,w0));
%title(strcat('Fourierova řada pro N = ',' ',num2str(N10)));
%grid on;
%
%subplot(3,1,3);
%plot(t,y);
%hold on;
%plot(t,fouri(N30,y_f,a,t,w0));
%title(strcat('Fourierova řada pro N = ',' ',num2str(N30)));
%grid on;
