clc; clear; close all;

t = -2:0.0001:2;
x_2 = xpi((t-1)/2);
x_1 = xtri(t-1);

plot(t,x_2)
plot(t,x_1)