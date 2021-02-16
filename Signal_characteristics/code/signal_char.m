clear all;
f1 = 2;
f2 = 8;
f_sampl = 200; 

om1 = 2*pi*f1;
om2 = 2*pi*f2;

t = 0:1/f_sampl:0.5;
y = 5*cos(om1*t)-2*sin(om2*t)

figure(1);
plot(t,y,'-o-')
hold on;
plot(t,y);
xlabel('t [s]');
ylabel('y [V]');
legend('Samplovaný signál','Analogový signál');
grid on;


N = f_sampl*0.5;

avg_alg = 1/N * sum(y);
rms_alg = sqrt(1/N * sum(y.^2));
%var_alg = 1/N*sum()
%std_alg =
median_alg = median(y);
immP_alg = y.^2;
meanP_alg =  1/N * sum(y.^2);
energy_alg = sum(y.^2);

avg_fnc = mean(y);
rms_fnc = rms(y);
%Tady nevim
%var_alg = 1/N*sum()
%std_alg =
median_fnc = median(y);
%Tady nevim
%energy_inc = integral(y.^2,0,0.5);



figure(2);
plot(t,immP_alg,'-o-','color','r');
xlabel('t [s]');
ylabel('Instant power [W]');
title('Instant power');
grid on;

%Dodělat tu export do tabulky
