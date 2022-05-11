clc; clear; close all;

x = -1:0.01:1;
y = acos(x);
g = RecInt(y,0.01)

function y = RecInt(y,dx)
    y = sum(y.*dx);
end
   