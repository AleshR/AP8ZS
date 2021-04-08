close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSTS
A=1;
f = 0;
f_signal = 100;

N3 = 3;
N10 = 10;
N30 = 30;

Ns=5;
t=linspace(-5,5,1000);
T=max(t);
w0 = (3*pi)/T;
pix2 = 2*pi;

Amp = 2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SIGNAL
y = Amp*sawtooth((1/(2*f_signal*pi))*t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k=1:Ns
  ak = ((4*A*sin(pix2*k) / (pix2*k)) + (4*A*cos(pix2*k) / (pix2*k)^2)-(4*A/(pix2*k)^2));
  bk = ((4*A*sin(pix2*k) / (pix2*k)^2) + (cos(pix2*k) / (pix2*k)));
  f = f+((ak*cos(k*w0*t)) - bk*sin(k*w0*t));
  
  fprintf('\n------------------------------------------------------\n');
  fprintf('Coeff a %d: ',k)
  fprintf('%G',ak)
  fprintf('\n');
  
  fprintf('Coeff b %d: ',k)
  printf('%G',bk)
end

for k=1:Ns
  ak = 2./T*y*cos(k*w0*t);
end


figure(1)
plot(t,y)
xlabel('Time');
ylabel('Amplitude');
grid on;