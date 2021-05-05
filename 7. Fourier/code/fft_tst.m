clear;
close;

A = input('Enter Ampitude A :   ');
M = input('Enter limts of Summation N, where Summation limes -N:N :   ');
T0 = 2;
wo = 2*pi/T0;                          
c0 = 0;                            
for i = 0:M
N = i;
t = -5:0.01:5;                     
figure(1)                          
y = c0*ones(size(t));

nvec = [-N:-1:-1,1:N];            

for n = nvec,
  cn = 2/(1j*n*wo);                 
  y = y + A*real(cn*exp(1j*n*wo*t)); 
  printf('\nFourier coefficent C %d\n', n)
  printf('%G\n', cn)
end

cla;
P = T0/2;
plot([-5 -4 -4 -3 -3 -2 -2 -1 -1  0 0  1 1 2 2 3 3 4 4 5],...    
     [-A -A A A  -A -A  A  A -A -A A A -A -A A A -A -A A A], ':');
hold;
plot(t,y);         
xlabel('t (seconds)'); ylabel('y(t)');
ttle = ['Exponential Fourier Series with N = ',...
         num2str(N)];
title(ttle);
hold;
pause(0.5);
end