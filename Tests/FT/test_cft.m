clc; clear; close all;

dt = 0.001;
t = -15:dt:15;
%x = xtri(t/2 - 1);
%x = cos(8*pi*t) - sin(8*pi*t);
%x = cos(pi*t) .* sinc(t);
%x = cos(2*pi*100*t - pi/6);
%x = sinc(10*t) .* sin(20*pi*t);
%x = -1.j*sin(2*pi*100*t);
%x = cos(2 * pi * 10 * t - pi/3);
%x = sinc(2*5*t).^2 .* cos(2*pi*10*t);
%x = sinc(2*t).*sin(2*pi*10*t);
%x = sinc(20*t).*cos(2*pi*5*t);
%x = 2 * sinc((t-1)/3).^2
%x =-sinc(2*t).^2 .* sin(2 * pi *2*t);
%x = - sinc(2*t).^2 .* exp(-j*2*pi*2*t) + sinc(2*t).^2 .* exp(j*2*pi*2*t);
%x = sin(2*pi*2*t - pi/6);
%x = sin(2*pi*t) .* cos(2*pi* 2*t);
x = 3*sin(2*pi*t) .* (2 * cos(2*pi*t - pi/3) - cos(2*pi*2*t));
%x = sin(t);


df=0.01;       f=-5:df:5;
X_num = My_FT(t,x,f);

%X_testowe = X_num * -1.j .* sign(f);
%X_testowe = 6 * xtri(3*f) .* exp(-j*2*pi*f)
%X_testowe = 2*(sinc(2*f).^2).*exp(j*4*pi*f);
%X_testowe = (1/2) * xpi(f,-0.5,1) + (1/2) * xpi(f,0.5,1);


x_1 = (sinc(2*t)).^2; x_2 = 10*sin(2*pi*t);
X_1 = My_FT(t,x_1,f); X_2 = My_FT(t,x_2,f);
X = X_1 .* X_2;

x_num = My_IFT(f,X,t);

figure(1)
    plot(t,x)
figure(2)
    hold on;
    plot(f, real(X_num));
    %plot(f, X_testowe);
figure(3)
    plot(f, imag(X_num));
    %plot(f, imag(X_testowe));
figure(4)
    plot(t, x_num)

%a1 = rad2deg(angle(X_num(find(f==10))))
%a2 = rad2deg(angle(X_num(find(f==-10))))