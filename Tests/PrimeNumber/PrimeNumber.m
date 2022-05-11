clc; clear; close all;

test = PrimeTest(100)

function t=PrimeTest(m)
    t = 1;
    for n=2:m-1
        if m/n == round(m/n); t=0; end
    end
end