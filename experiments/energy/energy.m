clc; clear; close all;


dt = 0.001; t = 0:dt:1; f = 1;

x_t = (sin(2 * pi * f * t));

Energy = myIntegral(x_t.*conj(x_t), dt)
Energy2 = sPro(x_t, x_t, dt)

figure(1);
    plot(t, x_t);