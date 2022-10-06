X0=100; % Координата 3x" (на экране) нижнего левого угла окна
Y0=100; % Координата 2y" (на экране) нижнего левого угла окна
W0=1400; % Ширина окна
H0=600; % Высота окна

x1=55;
y1=420;
w1=210;
h1=160;
dy=30;
dx=100;
w2=40;
h2=10;
figure('Position',[X0,Y0,W0,H0]);
hAxes11=axes('Units','pixels','Position',[x1,y1,w1,h1]);
hAxes21=axes('Units','pixels','Position',[x1,y1-h1-dy,w1,h1]);
hAxes31=axes('Units','pixels','Position',[x1,y1-2*h1-2*dy,w1,h1]);
hAxes12=axes('Units','pixels','Position',[x1+w1+dx,y1,2*w1,h1]);
hAxes22=axes('Units','pixels','Position',[x1+w1+dx,y1-h1-dy,2*w1,h1]);
hAxes32=axes('Units','pixels','Position',[x1+w1+dx,y1-2*h1-2*dy,2*w1,h1]);
hAxes13=axes('Units','pixels','Position',[x1+3*w1+2*dx,y1,2*w1,h1]);
hAxes23=axes('Units','pixels','Position',[x1+3*w1+2*dx,y1-h1-dy,2*w1,h1]);
hAxes33=axes('Units','pixels','Position',[x1+3*w1+2*dx,y1-2*h1-2*dy,2*w1,h1]);


Fd=200;
T=1/Fd; 
tmax=2;
t=0:T:tmax-T;
A1=50;
F1=5;
s1=A1*sin(2*pi*F1*t); 
axes(hAxes11)
set (hAxes11,'YLim',[-Asum +Asum])
hold on 
plot(t, s1)

A2=40;
F2=3;
s2=A2*sin(2*pi*F2*t);
axes(hAxes21)
set (hAxes21,'YLim',[-Asum +Asum])
hold on 
plot(t,s2)

Asum=A1+A2;
s3=s1+s2;
axes(hAxes31)
set (hAxes31,'YLim',[-Asum +Asum])
hold on 
plot(t,s3)


tcf=-tmax+T:T:tmax-T; 
acf1=xcorr(s1,'coeff'); 
axes(hAxes12) 
set(hAxes12,'YLim',[-1 +1])
hold on 
plot(tcf,acf1)


tcf=-tmax+T:T:tmax-T; 
acf2=xcorr(s2,'coeff'); 
axes(hAxes22) 
set(hAxes22,'YLim',[-1 +1])
hold on 
plot(tcf,acf2)

tcf=-tmax+T:T:tmax-T; 
acf3=xcorr(s3,'coeff'); 
axes(hAxes32) 
set(hAxes32,'YLim',[-1 +1])
hold on 
plot(tcf,acf3)

tcf=-tmax+T:T:tmax-T; 
ccf13=xcorr(s1,s2,'coeff'); 
axes(hAxes13) 
set(hAxes13,'YLim',[-1 +1])
hold on 
plot(tcf,ccf13)

tcf=-tmax+T:T:tmax-T; 
ccf23=xcorr(s2,s3,'coeff'); 
axes(hAxes23) 
set(hAxes23,'YLim',[-1 +1])
hold on 
plot(tcf,ccf23)


tcf=-tmax+T:T:tmax-T; 
ccf33=xcorr(s3,s1,'coeff'); 
axes(hAxes33) 
set(hAxes33,'YLim',[-1 +1])
hold on 
plot(tcf,ccf33)

