clc; clear; close all

Fs = 1000;
dt = 1/Fs;
t_max = 10;
L = t_max/dt;
t = (0:L)*dt;
y_t = sin(2*pi*50*t) + cos(2*pi*100*t);


f = Fs*(0:(L/2))/L; %Nyquista–Shannona theorem

y_f = my_dtft(t,y_t,f);
y_f = y_f(1:L/2+1);

y_f2 = fft(y_t);
y_f2 = y_f2(1:L/2+1);


figure(1)
    plot(t,y_t);
figure(2)
    plot(f,abs(y_f));
figure(3)
    plot(f,abs(y_f2))