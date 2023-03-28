clc; clear; close all;

dt=1e-3;   t=-15:dt:15;

y = xpi(t, 2, 2);

figure(1);
    plot(t, y);
    ylim([-2 2])