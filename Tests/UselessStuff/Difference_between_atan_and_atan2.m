%The difference between atan and atan2

clear; clc; close all;

% atan require one argument in the range of atan(-pi/2) to atan(pi/2)
% And only give angle in range of -pi/2 to pi/2
% So we can't calculate different angles using atan

% atan2 take two arguments realis and imaginalis of imaginary number
% knowing about these two values, we can find out exactly what angle
% a number has in the complex plane. 


a = tan(deg2rad(120));


z = -0.5 + sqrt(3)/2 * j;
real_z = real(z);
im_z = imag(z);

alpha = rad2deg(angle(z))
beta = rad2deg(atan2(im_z, real_z))

% we lost information about exact angle
gamma = rad2deg(atan(a))
