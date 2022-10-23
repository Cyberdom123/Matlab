% m-plik skryptowy: ts_demo_03.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 18.10.2022

clc; clear; close all;

dt=1e-3;  t=-2:dt:2;        % pseudo-ciagla os czasu;
A=2; f0=2; p0=pi/8;     % zadawane wartosci parametrów sygnalu;  
x=A*exp(j*(2*pi*f0*t-p0));  % sygnal harmoniczny x=x(t);

x_re   = real(x);
x_im   = imag(x);
x_faza = angle(x);
x_ampl = abs(x);

for n=1:10:length(t)
    figure(1); clf;
        subplot(4,2,1); plot(t, x_re); grid on; hold on;
                        plot(t(n), x_re(n),'ro');
        subplot(4,2,3); plot(t, x_im); grid on; hold on;
                        plot(t(n), x_im(n),'ro');
        subplot(4,2,5); plot(t, x_ampl); grid on; hold on;
                        plot(t(n), x_ampl(n),'ro');
        subplot(4,2,7); plot(t, x_faza); grid on; hold on;
                        plot(t(n), x_faza(n),'ro');
        subplot(4,2,[2,4,6,8]); plot(x_re, x_im); axis equal; grid on; hold on;git
                                plot(x_re(n), x_im(n),'ro');
 
        pause(0.1);
end
% KONIEC