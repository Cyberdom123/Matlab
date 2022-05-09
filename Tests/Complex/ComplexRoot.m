clc; clear; close all;

a = 1+1i;

b = Croot(a, 2)

function x=Croot(C, n)
    k=0:1:n-1;
    a=abs(C); p=angle(C);
    x(k+1) = a^(1/2)*exp(j*(2*pi*k + p)/n); 
end