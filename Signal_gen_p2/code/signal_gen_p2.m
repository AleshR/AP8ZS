clear all;
Ts = 1 %perioda;
T_sig = 10;
t = -20:(1/Ts):20;

y1 = tripuls(t,T_sig);
y2 = 2*tripuls(t-5,T_sig,1);
y3 = 3*tripuls(t+5,T_sig,-1);

figure(1);
subplot(311);
plot(t,y1,'-o-');

title("Aperiodic triangle pulse y_1");
xlabel('Time [s]');
ylabel('y_1 [-]');
set(gca,'xtick',-20:5:20);
grid on;

subplot(312);
plot(t,y2,'-o-');

title("Aperiodic triangle pulse y_2");
xlabel('Time [s]');
ylabel('y_2 [-]');
set(gca,'xtick',-20:5:20);
grid on;

subplot(313);
plot(t,y3,'-o-');

title("Aperiodic triangle pulse y_3");
xlabel('Time [s]');
ylabel('y_3 [-]');
set(gca,'xtick',-20:5:20);
grid on;

t2 = -10:0.5:10;
dirac1 = dirac(t2);
dirac2 = dirac(t2-5);
heav1 = heaviside(t2);
heav2 = heaviside(t2+4);
sin_c = sinc(t2);

idx1 = dirac1 == Inf; % find Inf
dirac1(idx1) = 1;     % set Inf to finite value

idx2 = dirac2 == Inf; % find Inf
dirac2(idx2) = 1;     % set Inf to finite value

figure(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,1);
stem(t2,dirac1,'r','linewidth', 1);
axis([-10 10 0 2]);
grid on;

title({"Jednotkový pulz" '\delta_1'});
xlabel('n [-]');
ylabel('\delta_1 [-]');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,2);
stem(t2,dirac2,'r','linewidth', 1);
axis([-10 10 0 2]);
grid on;

title({"Jednotkový pulz" '\delta_2'});
xlabel('Time [s]');
ylabel('\delta_2 [-]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,3);
stem(t2,heav1,'linewidth', 1);
axis([-10 10 0 2]);
grid on;

title({"Jednotkový skok u_1"});
xlabel('n [-]');
ylabel('u_1 [-]');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,4);
stem(t2,heav2,'linewidth', 1);
axis([-10 10 0 2]);
grid on;

title({"Jednotkový skok u_2"});
xlabel('n [-]');
ylabel('u_2 [-]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,5:6);
plot(t2,sin_c,'k');
axis([-10 10 -1 2]);
grid on;

title({"Funkce Sinc(t)"});
xlabel('t [s]');
ylabel('y [-]');




