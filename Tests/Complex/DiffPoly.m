clc; clear; close all;

a = [2, 3, 6]
b = PolyDiff(a)


function y=PolyDiff(a) %Take poly coef
    a = a(:).'; %Transpose
    n = length(a) - 1;
    y = (n:-1:1).*a(1:end-1);
end