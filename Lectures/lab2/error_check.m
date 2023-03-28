clc; clear; close all;

t = -2:0.0001:2;
x_2 = 1/2 * xpi((t-1)/2);
x_1 = xtri(t-1);
error = x_2 - x_1;

plot(t, error)