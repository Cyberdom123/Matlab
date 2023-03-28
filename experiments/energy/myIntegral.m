function g=myIntegral(y, dx)
    g = (y(1) + y(end))*dx/2 + sum(y(2:end-1))*dx;
