clear; clc; close all;


fp = 10;
dt = 1/fp;  
samples = 1:dt:7;

t = 1:0.0001:7; %oś czasu, małe odstępy w celu zapewnienia ciągłości
f = 1;      %częstotliwość w sygnale
y = sin(2 * pi * f * t); 

y_p = sin(2 * pi * f * samples);

s = 0;
for n = 1 : length(samples)
    stemp = y_p(n) .* sinc(fp * (samples - samples(n))); %sinc w matlabie mnoży przez pi
    s = s + stemp;
end

y_r = s;

figure(1)
subplot(2,1,1)
plot(t,y);  hold on;
stem(samples, y_p);
subplot(2,1,2)
plot(samples, y_r);
