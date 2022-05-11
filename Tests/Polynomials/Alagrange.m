clc; clear; close all;

x = Alagr(1)


function L = Alagr(n)
    a = [1, 0, -1];
    b = [1, 0, -1];
    if n == 0
       a = 1;
    end
    if n >= 2
        for k=2:n
            a = conv(a,b);
        end
    end
    for k = 1:n
        a = a(:).';
        z = length(a) - 1;
        a = (z:-1:1).*a(1:end-1);
    end

    L = 1/(2^n * factorial(n)) * a;
end