clc; clear; close all;

clc; clear; close all;

c = (rand(2,1)-0.5)*10;       r = rand*3;
p = 0:pi/100:2*pi;
xr = c(1) + r*cos(p);
yr = c(2) + r*sin(p);

p0 = rand*2*pi;                 % losowanie punktu;
x0 = c(1) + r*cos(p0);
y0 = c(2) + r*sin(p0);

R = [ x0-c(1) , y0-c(2) ];      % wektor promienia;
A = R(1);         B=R(2);            C=-A*x0-B*y0;
x = c(1)-2*r  :  4*r  :  c(1)+2*r;
y = -(A*x + C)/B;
 
    figure(1); clf;
        plot(xr,yr,'k');   axis equal;   hold on;   grid on;
        plot(x0,y0,'ro');
        plot([c(1),c(1)+R(1)],[c(2),c(2)+R(2)],'b');
        plot(x,y,'m');