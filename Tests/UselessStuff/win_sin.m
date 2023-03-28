clc; clear; close all;

t = -10:0.01:10;
y = zeros(size(t));

f = 1;
k = 2;
y(t>-pi*k/f&t<pi*k/f) = 1;

h = sin(f*t) .* y;

figure(1)
plot(t,y);
figure(2)
plot(t,h);