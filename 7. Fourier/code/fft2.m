close all;
clear all;
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSTS
f_sample = 100; %hz

t = -pi:1/f_sample:pi; %ťime
T = max(t)-min(t); %period

f = 1/T; %freq

Ns=[5 10 30];

myFunc=@(t) (t);
y = myFunc(t);

N=Ns(1); %N

Tn = 3; %Number of period

A0=(2/T)*quadv(myFunc,min(t),max(t)); %A0 coeff

AN = NaN(1,N);
BN = NaN(1,N);

printf('A0 is: %G /n',A0);

for j=1:N
  a=@(t) myFunc(t).*cos(2*j*pi*f*t); %Acoeff
  A=2/T*quadv(a,min(t),max(t));
  
  b=@(t) myFunc(t).*sin(2*j*pi*f*t); %Bcoeff
  B=2/T*quadv(b,min(t),max(t));
  
  AN(j)=A;
  BN(j)=B;
  
  printf('Coeff A %d\n',j);
  printf('%G\n',A);
  
  printf('Coeff B %d\n',j);
  printf('%G\n',B);
end