clc; clear; close all;

a = [1,     0,    -2,     0,     1]
b = PolyDiff(a)


function y=PolyDiff(a) %Take poly coef
    a = a(:).'; %Transpose
    n = length(a) - 1;
    y = (n:-1:1).*a(1:end-1);
end