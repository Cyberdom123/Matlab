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

% KONIEC