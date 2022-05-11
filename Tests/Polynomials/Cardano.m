clc; clear; close all;

x =  -10:0.001:10;

a = [1, -7, -1, 3];

roots = CardBomPoly(a)

y = polyval(a,x);
val = polyval(a, roots)

figure(1)
    hold on;
    plot(x,y)
    plot(roots, polyval(a, roots), 'o')



function b = CardBomPoly(a) %a(1) have to be 1.
    p = (3*a(3) - a(2)^2)/9;
    q = a(2)^3/27 - a(2)*a(3)/6 + a(4)/2;

    D = q^2 + p^3
    if D >= 0
        u  = nthroot(-q + sqrt(D), 3);
        v = nthroot(-q-sqrt(D), 3);

        y1 = u + v;
        y2 = (-1/2)*(u+v) - j*(sqrt(3)/2)*(u-v);
        y3 = (-1/2)*(u+v) + j*(sqrt(3)/2)*(u-v);
        
        b = [y1, y2, y3]-a(2)/3;
    end
    if D < 0
        k = [1,2,3];
        phi = acos(-q/sqrt(-p^3));
        y(k) = 2 * sqrt(-p) * cos((phi + 2*pi*(k-1))/3);
        b = [y(1), y(2), y(3)]-a(2)/3;
    end
end