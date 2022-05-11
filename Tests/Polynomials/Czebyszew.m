clc; clear; close all;

x = -1:0.01:1;
y = Czebyszewo(2,x)

function y = Czebyszewo(n,x)
    f{1} = 1;
    f{2} = x
    if n > 2
        for k=(2:n-1)
           f{n+1} = 2*x*f{n} - f{n-1};
        end
    end
    y = f{n};
end