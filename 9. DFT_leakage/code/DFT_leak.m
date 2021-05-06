close all;
clear all;

#choice = menu("Parameters of signal", "Opt1", "Opt2", "Opt3");
printf('---------------------------------------------------------\n');
DC = input("Zadejte DC složku [V]: ");
A = input("Zadejte amplitudu [V]: ");
printf('---------------------------------------------------------\n');

k = input("Zadejte počet period: "); %Periods
N = input("Zadejte počet bodů posloupnosti:"); %Numbers of points
Freq = input("Zadejte kmitočet signálu [Hz]: "); 
F_smpl = input("Zadejte vzorkovací kmitočet [Hz]: "); %sampling frequency
Phi = input("Zadejte fázový posun [deg]: "); ;
printf('---------------------------------------------------------\n');

#Ts = 0:1/N:(k/Freq);
Ts = linspace(0,k/Freq,N);

switch(input("Zadejte signál:\n...
              1)  DC + A * cos(2*pi*Freq*Ts + Phi)\n...
              2)  DC + A * sin(2*pi*Freq*Ts + Phi)\n"))
  case 1
    sig = DC + A * cos(2*pi*Freq*Ts + Phi);
    printf("Your choice is: DC + A * cos(2*pi*Freq*Ts + Phi)\n");
    
  case 2
    sig = DC + A * sin(2*pi*Freq*Ts + Phi);
    printf("Your choice is: DC + A * sin(2*pi*Freq*Ts + Phi)\n");
  
  otherwise
    printf("invalid choice!!!\n");
printf('---------------------------------------------------------\n');  
%Signal
%sig = DC + A * cos(2*pi*Freq*Ts + Phi);
%sig = DC + A * sin(2*pi*Freq*Ts + Phi);
endswitch



fa = linspace(0,F_smpl/2,N/2);
df=F_smpl/N;%Step
f_dbl = (-F_smpl/2):df:(F_smpl/2)-df;%Faxis

switch(input("Zadej výsledné spektrum:\n 1) One-sided\n 2) Double-sided\n"))
  case 1
    fouri=fft(sig,N)/N;
    y = fouri(1:N/2);
    f_ax = fa;
    
  case 2
    fouri=fft(sig,N)/N;
    y=fftshift(fouri)/N;
    f_ax = f_dbl;
endswitch
printf('---------------------------------------------------------\n');

switch(input("Select window:\n 1) Hamming\n 2) Hanning\n"))
  case 1
    window = hamming(N,'symmetric');
  case 2
    window = hanning(N,'symmetric');
    
  otherwise
    window = 1;
    
endswitch

%fouri=fft(sig,N)/N;
%y=fftshift(fouri)/N;

figure(1);
subplot(4,2,1)
plot(Ts,sig);
hold on;
title('Signal A')
grid on;

subplot(4,2,2)
plot(window);
title('Window')
grid on;

subplot(4,1,2)
stem(sig.*window')
title('Signal and window')
grid on;

subplot(4,1,3)
stem(f_ax,abs(y),'-o-');
title('Spectrum - frequency')
grid on;

subplot(4,1,4)
stem(f_ax, angle(y)*180/pi,'-o-');
title('Spectrum - angle')
grid on;