clear all;

x = [2, 4, 6, 4, 2, 4, 3, 2, 1];

h1 =[1];
h2 = [0, 0, 0, 1];
h3 = [-1, 1 ];
h4 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1 ];
h5 = [3];
h6 = [0, 0, 0, 3];
h7 = [0, 0, -2, -1, 0];

y1 = conv(x,h1);
y2 = conv(x,h2);
y3 = conv(x,h3);
y4 = conv(x,h4);
y5 = conv(x,h5);
y6 = conv(x,h6);
y7 = conv(x,h7);

subplot(411);
plot(y1,'-o-');
grid on;
set(gca, 'xtick', 1:1:9);
axis([1 9 0 7]);

subplot(412);
plot(y7,'-o-');
grid on;
set(gca, 'xtick', 1:1:5);
axis([1 5 -3 1]);
