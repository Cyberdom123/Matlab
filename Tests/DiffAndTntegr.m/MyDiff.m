clc; clear; close all;

dx = 0.01; x=-2:dx:2;

% z = [1,2,3,4,5]
% z = f(z)
% z(2:end)
% z(1:end-1)

f = @(x)x.^2-3;
y = f(x);
h = x.^2 - 3;

%df1 = (y(2:end) - y(1:end-1))/dx;
%df = (df1(1:end-1) + df1(2:end))/2


dh = NumDiff(h, dx)
%error = max(max(abs(dh - df)))

function g=NumDiff(y, dx)
   dy1 = (y(2:end) - y(1:end-1))/dx;
   g = (dy1(1:end-1) + dy1(2:end))/2;
end