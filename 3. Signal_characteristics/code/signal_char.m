close all;
clear all;
clf reset;
f1 = 2;
f2 = 8;
f_sampl = 200; 

om1 = 2*pi*f1;
om2 = 2*pi*f2;

t = 0:1/f_sampl:0.5;
y = 5*cos(om1*t)-2*sin(om2*t) %zadana funkce

figure(1);
plot(t,y,'-o-')
hold on;
plot(t,y);
xlabel('t [s]');
ylabel('y [V]');
legend('Samplovaný signál','Analogový signál');
grid on;


N = f_sampl*0.5;
%N = size(t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean_alg = 1/N * sum(y); 
meanP_alg =  1/N * sum(y.^2);
rms_alg = sqrt(1/N * sum(y.^2));
var_alg = 1/N *sum((y-mean_alg).^2)
std_alg = sqrt(var_alg);
iP_alg = y.^2;
energy_alg = sum(y.^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean_fnc = mean(y);
rms_fnc = rms(y);
var_fnc = var(y);
std_fnc = std(y);
median_fnc = median(y);


%Výpis hodnot z vestavenych funkci
printf("\n----------------------------------------------------\n");
printf("Build in\n \
        Mean: %f [V]\n \
        RMS: %.3f [V]\n \
        Variance: %.3f [V^2]\n \
        STD: %.3f [V]\n \
        Median: %d [V]\n \
        Mean Power: %.3f [V^2]\n \
        Energy: %.2f [J]\n \
        \n" \
        , mean_fnc, rms_fnc, var_fnc, std_fnc, median_fnc, meanP_alg, energy_alg);

printf("----------------------------------------------------\n");        

%Výpis hodnot z mych vlastnich funkci
printf("\n----------------------------------------------------\n");
printf("Algorithm\n \
        Mean: %f [V]\n \
        RMS: %.3f [V]\n \
        Variance: %.3f [V^2]\n \
        STD: %.3f [V]\n \
        Median: %d [V]\n \
        Mean Power: %.3f [V^2]\n \
        Energy: %.2f [J]\n \
        \n"\
        , mean_alg, rms_alg, var_alg, std_alg, median_fnc, meanP_alg,energy_alg);
printf("----------------------------------------------------");        
figure(2);
plot(t,iP_alg,'-o-','color','r');
xlabel('t [s]');
ylabel('Instant power [W]');
title('Instant power');
grid on;

%Dodělat tu export do tabulky
