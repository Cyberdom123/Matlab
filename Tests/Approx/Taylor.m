clc; clear; close all;
x = -1:0.0001:1; 
x0 = 0; 
y = TaylorCosine(x,x0,10)

figure(1)
    plot(x,y); hold on;
    plot(x, cos(x));

function g = TaylorCosine(x,x0,n)
    y0 = cos(x0)
    h = ones(1, length(x)) .* y0;
    if n/2 == round(n/2)
        y = (-1)^(n/2)*cos(x);
    end
        y = (-1)^((n+1)/2)*sin(x);

    for k=1:n
        z = (-1)^((n+1)/2)*sin(x);
        if n/2 == round(n/2)
            z = (-1)^(n/2)*cos(x);
        end
        h = h + z/factorial(n) .* (x-x0).^n;
    end
    g = h; 
end
