clc; clear; close all;

dt=0.001; t = -3*pi:dt:3*pi;
x_t = cos(1.25*pi*t + 0.5*pi);


%plot(t,x_t);

f = -5:0.001:5;


%shifts in frequency domain
fp = 0.5;
n = [-3,-2,-1,1,2,3];
f_shift = n*fp;

X_f = My_FT(t,x_t,f);
X_f_temp = X_f;
for k=1:length(n)
    X_f = X_f + My_FT(t,x_t,f - f_shift(k));
end


figure(1)
subplot(2,1,1) 
    plot(f,real(X_f)); title("Real Xpf"); hold on;
subplot(2,1,2) 
    plot(f,imag(X_f)); title("Imag Xpf"); hold on;

figure(2)
subplot(2,1,1) 
    plot(f,real(X_f_temp)); title("Real Xf");
subplot(2,1,2) 
    plot(f,imag(X_f_temp)); title("Imag Xf");
