x = linspace(0, 10, 1000);
x2 = x.^10;

figure(1);
    plot(x,x);
    semilogx(x,x2);