clear all;

x = [0,0,1,2,3,4,4,4,3,3,2,2,1,1];%druhy ukol
x_xmpl = [1,2,3,2,1] %prvni ukol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_xmpl = [0,0,1,2,3,0,0,0,0,0,0,0,0,0,0,0,0]; %prvni ukol
h = [0,0,0,2,1] %druhy ukol
h1 =[1];
h2 = [0, 0, 0, 1];
h3 = [-1, 1 ];
h4 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1 ];
h5 = [3];
h6 = [0, 0, 0, 3];
h7 = [0, 0, -2, -1, 0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_xmpl = conv(x_xmpl,h_xmpl); %prvni ukol
y = conv(x,h); %druhy ukol

y1 = conv(x,h1);
y2 = conv(x,h2);
y3 = conv(x,h3);
y4 = conv(x,h4);
y5 = conv(x,h5);
y6 = conv(x,h6);
y7 = conv(x,h7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = con(x_con,h_con)
  m = length(x_con);
  n = length(h_con);

  x_con=[x_con,zeros(1,n)];
  h_con=[h_con,zeros(1,m)];

  y=zeros(1,m+n-1);

  for i=1:m+n-1
    y(i)=0;
    for j=1:m+n-1
      if(j<i+1)
      y(i)=y(i)+x_con(j)*h_con(i-j+1);
      end
    end
  end
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function p = plt(inp_seq,conv_kernel,conv_orig)
  p = con(inp_seq,conv_kernel);
  subplot(411);
  stem(inp_seq,'filled','r','LineWidth',1.5);
  grid on;
  title(strcat('Input sequence: ','[',num2str(inp_seq),']'));
    
  subplot(412);
  stem(conv_kernel,'filled','b','LineWidth',1.5);
  grid on;
  title(strcat('Response h: ','[',num2str(conv_kernel),']'));
  
  subplot(413);
  stem(p,'filled','g','LineWidth',1.5);
  grid on;
  title(strcat('Response custom: ','[',num2str(p),']'));
  
  subplot(414);
  stem(conv_orig,'filled','k','LineWidth',1.5);
  grid on;
  title(strcat('Response conv:', '[',num2str(conv_orig),']'));
    
end

figure(1);
plt(x_xmpl,h_xmpl,y_xmpl);
figure(2);
plt(x,h,y)

%Plot s mym algoritmem 
#{
subplot(711);
plot(con(x,h1),'-o-');
grid on;
%
subplot(712);
plot(con(x,h2),'-o-');
grid on;
%
subplot(713);
plot(con(x,h3),'-o-');
grid on;
%
subplot(714);
plot(con(x,h4),'-o-');
grid on;
%
subplot(715);
plot(con(x,h5),'-o-');
grid on;
%
subplot(716);
plot(con(x,h6),'-o-');
grid on;
%
subplot(717);
plot(con(x,h7),'-o-');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
%Plot s conv funkci
subplot(711);
plot(y1,'-o-');
grid on;
%
subplot(712);
plot(y2,'-o-');
grid on;
%
subplot(713);
plot(y3,'-o-');
grid on;
%
subplot(714);
plot(y4,'-o-');
grid on;
%
subplot(715);
plot(y5,'-o-');
grid on;
%
subplot(716);
plot(y6,'-o-');
grid on;
%
subplot(717);
plot(y7,'-o-');
grid on;
#}