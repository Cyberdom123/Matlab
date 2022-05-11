% lecture no.7

clc; clear; close all;

C = 2*10^(-6); R=2*10^(3); dt=1; tmax=500; u0=1;
t = 0:dt:tmax;

options = odeset;
a = (-1)./(R.*C);

[t,u] = ode45(@opis_rownania, t, u0, options, C, R);

plot(t,u);