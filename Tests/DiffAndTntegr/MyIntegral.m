%Trapezoidal method

clc; clear; close all;
dx=0.01; x = 0:dx:100;

NumIntegral(cos(x), dx)

function g=NumIntegral(y, dx)
    g = (y(1) + y(end))*dx/2 + sum(y(2:end-1))*dx;
end