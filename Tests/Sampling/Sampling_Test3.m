clc; clear; close all;

N = 10; f_s = 10000; t_s = 1/f_s;

% Approxymation of analog signal
f_0 = 3000; t = 0:(t_s/100):N*t_s;
s_t = 1/4 + sin(2*pi*f_0*t);

% Sampling
samples = 0:t_s:N*t_s;
x_n = 1/4 + sin(2*pi*f_0*samples);

figure(1);
    subplot(2,1,1);
    plot(t,s_t); hold on;
    stem(samples, x_n);
    subplot(2,1,2);
    plot(samples, x_n);
