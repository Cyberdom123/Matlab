clc; clear; close all;

x = -10:0.01:10; a3 = 5; a2 = 1; a1 = 2; a0=10;
y = x.^4 + a3*x.^3 + a2*x.^2 + a1*x + a0;

p = sqrt(2*k + a3^2/4 - a2); q=(k*a3-a1)/(2*p);

g = x^2 + (a3/2 + p)*x + k + q;


figure(1)
    plot(x,y)