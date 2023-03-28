clc; clear; close all;

dt = 0.001; t=-4*pi:dt:4*pi;
x_t = (sinc(2*t)).^2 .* cos(2*pi*t);

df = 0.01; f = -3:df:3;
X_f = My_FT(t,x_t,f);

subplot(2,1,1)
    plot(f,real(X_f))
subplot(2,1,2)
    plot(f,imag(X_f))

%Periodic signal definition
T = 2;
X_T =  X_f(f==0) * My_FT(t,ones(1, length(t)),f);

n = [-5,-4,-3,-2,-1,1,2,3,4,5];
for k=1:length(n)
    X_T = X_T + X_f(f==n(k)*(1/T)) * My_FT(t,ones(1, length(t)), ...
                    f-n(k)*(1/T));
    disp(n(k)) 
end

figure(2)
    subplot(2,1,1)
        plot(f,real(X_T))
    subplot(2,1,2)
        plot(f,imag(X_T))