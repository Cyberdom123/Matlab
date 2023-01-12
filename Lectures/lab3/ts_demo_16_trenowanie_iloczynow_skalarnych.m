% m-plik skryptowy: ts_demo_16_trenowanie_iloczynow_skalarnych.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Uwaga: załączono przykłady tylko dla sygnałów rzeczywistych!
%
% (C) P.Korohoda, 13/11/2015; 15/11/2018;

clc; clear; close all;
dt=0.01;
t=-10:dt:10; Nt=length(t);

sygnal_1=3; sygnal_2=3;

switch sygnal_1,
    case 1, x1=xpi(t,-1,2);
    case 2, x1=xpi(t,-1,2)+2*xpi(t,1,2);    
    case 3, x1=xtri(t,0,4);
    case 4, x1=xtri(t,-4,4)+2*xtri(t,4,4);
    case 5, f1=0.1; x1=cos(2*pi*f1*t);
end;    
switch sygnal_2,
    case 1, x2=xpi(t,1,1);
    case 2, x2=xpi(t,0,2)-2*xpi(t,1,2);    
    case 3, x2=xtri(t,1,4);
    case 4, x2=xtri(t,-2,4)-2*xtri(t,6,4);
    case 5, f2=0.1; x2=sin(2*pi*f2*t);
end;    

y=x1.*x2;

wyliczony_iloczyn_skalarny=calka(x1.*conj(x2),dt),

    figure(1);
        subplot(3,1,1); plot(t,x1,'b.-'); grid on; xlabel('t [s]');
        subplot(3,1,2); plot(t,x2,'g.-'); grid on; xlabel('t [s]');
        subplot(3,1,3); plot(t,y,'r.-'); grid on; xlabel('t [s]');

% KONIEC PLIKU;