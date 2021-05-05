clear all
t1=-3*pi:0.01:-pi;
t2=-pi:0.01:pi;
t3=pi:0.01:3*pi;

y1=t2;
y=[y1 y1 y1];
t=[t1 t2 t3];

plot(t1,y1);
hold on;
plot(t2,y1);
hold on;
plot(t3,y1);
hold on;

pause;
plot(t,2*sin(t));

pause;
figure
plot(t1,y1);
hold on;
plot(t2,y1);
hold on;
plot(t3,y1);
hold on;

plot(t,2*sin(t)-sin(2*t));

pause;
figure
plot(t1,y1);
hold on;
plot(t2,y1);
hold on;
plot(t3,y1);
hold on;

plot(t,2*sin(t)-sin(2*t)+(2/3)*sin(3*t))

pause;
figure
plot(t1,y1);
hold on;
plot(t2,y1);
hold on;
plot(t3,y1);
hold on;

plot(t,2*sin(t)-sin(2*t)+(2/3)*sin(3*t)-(2/4)*sin(4*t))

pause;
figure
plot(t1,y1);
hold on;
plot(t2,y1);
hold on;
plot(t3,y1);
hold on;

plot(t,2*sin(t)-sin(2*t)+(2/3)*sin(3*t)-(2/4)*sin(4*t)+(2/5)*sin(5*t))