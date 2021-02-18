clear all;
amp = 2; %amplituda
offset = 1; %DC složka

f_sig = 0.2; %frekvence signalu
f_samp = 5; %vzorkovaci frekvence

omega = 2*pi*f_sig %uhlova frekvence
t = 0:1/f_samp:2*1/f_sig;

sinus = offset+amp*sin(omega*t);
sqr = offset+amp*square(omega*t);
saw = offset+amp*sawtooth(omega*t);

figure(1);
clf();
subplot(311);;
stem(t,sinus,'r');

title({"Sinusový navzorkovaný průběh" ; "Amp = 2V, DC=1V, fi0 = 0 rad, F_{sig} = 0.2Hz, F_{S} = 5 Hz"});
xlabel('Time [s]');
ylabel('Voltage [V]');
ylim("auto");
grid on;

subplot(312);
stem(t,sqr);

title({"Obdélníkový navzorkovaný průběh" ; "Amp = 2V, DC=1V, fi0 = 0 rad, F_{sig} = 0.2Hz, F_{S} = 5 Hz"});
xlabel('Time [s]');
ylabel('Voltage [V]');
grid on;

subplot(313);
stem(t,saw,'k');

title({"Pilový navzorkovaný průběh" ; "Amp = 2V, DC=1V, fi0 = 0 rad, F_{sig} = 0.2Hz, F_{S} = 5 Hz"});
xlabel('Time [s]');
ylabel('Voltage [V]');
grid on;
savefig("test.png");