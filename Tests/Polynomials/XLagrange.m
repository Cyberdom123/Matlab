clc; clear; close all;


k = 3; x=-1:0.1:1;

z = XLagrange(x, k)

function y = Xlagrange(x, k)
L{1} = ones(1,length(x));
L{2} = x;
for n=2:k-1 %generowanie następnych wielomianów
L{n+1} = (2 .* n + 1)/(n+1) .* x .* L{n} - n .* L{n-1} / (n+1);
end
y = L(2);
y = y{1};
end