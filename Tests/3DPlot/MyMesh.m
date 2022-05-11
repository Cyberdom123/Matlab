clc; clear; close all;

x = -1:0.1:1; y=-2:0.1:1; 
[X,Y] = meshgrid(x,y); %Iloczyn kartezjański zbiorów

Fxy = X.^2 - Y.^2;

figure(1)
    mesh(x,y,Fxy);
    view([-40;30]);