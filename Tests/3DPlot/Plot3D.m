
t = 0:0.01:2;
x = sin(2*pi*t);
y = cos(2*pi*t);
z = t;
figure(1)
    plot3(x,y,z,'*'); grid on;
    view([-25,30]);