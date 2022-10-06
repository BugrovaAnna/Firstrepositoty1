Ca=[1/8 1/4 1/4 1/4 1/8];
Ma=length(Ca);
Cb=[1/3 1/6 0 -1/6 -1/3];
Mb=length(Cb);

subplot(4,2,1)
stem(Ca)
title('Filter a')
Fd=250;
T=1/Fd;
f=0:Fd/2;
Ha=abs(1/4+1/2*cos(2*pi*f*T)+1/4*cos(4*pi*f*T));
subplot(4,2,3)
plot(f,Ha)

subplot(4,2,2)
stem(Cb)
title('Filter b')
Fd=250;
T=1/Fd;
f=0:Fd/2;
Hb=abs(1/3*sin(2*pi*f*T)+2/3*sin(4*pi*f*T));
subplot(4,2,4)
plot(f,Hb)

%импульсная хар-ка А
N=20;
for n=1:N
    x(n)=0;
end
x(10)=1;
y=zeros(1,N);
for n=Ma:N
    y(n)=1/8*x(n)+1/4*x(n-1)+1/4*x(n-2)+1/4*x(n-3)+1/8*x(n-4);
end
subplot(4,2,5)
stem(x, '.')
hold on
stem(y,'r')

%импульсная хар-ка В
N=20;
for n=1:N
    x(n)=0;
end
x(10)=1;
y=zeros(1,N);
for n=Mb:N
    y(n)=1/3*x(n)+1/6*x(n-1)+0*x(n-2)-1/6*x(n-3)-1/3*x(n-4);
end
subplot(4,2,6)
stem(x, '.')
hold on
stem(y,'r')

%переходная хар-ка А
for n=1:N/2 
X(n)=0; 
end
for n=N/2:N
X(n)=1
end
Y=zeros(1,N);
for n=Ma:N
Y(n)=1/8*X(n)+1/4*X(n-1)+1/4*X(n-2)+1/4*X(n-3)+1/8*X(n-4);
end
subplot(4,2,7)
stem(X,'.')
hold on
stem(Y,'r')

%переходная хар-ка В
for n=1:N/2
X(n)=0
end
for n=N/2:N
X(n)=1
end
Y=zeros(1,N);
for n=Mb:N
Y(n)=1/3*X(n)+1/6*X(n-1)-1/6*X(n-3)-1/3*X(n-4);
end
subplot(4,2,8)
stem(X,'.')
hold on
stem(Y,'r')
