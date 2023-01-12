% m-plik skryptowy: ts_demo_01.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 18.10.2022

clc; clear; close all;

dt=1/48000;    t=0:dt:2;   Nt=length(t);       % pseudo-ciagla os czasu;
                                         
x1=cos(2*pi*440*t);                            % sygnal cosinusoidalny x1=x1(t);
x2=ones(1,Nt)*0.1;  x2((t>=0.5)&(t<1.5))=1;    % sygnal prostokątny x2=x2(t);
x=x1.*x2;                                      % iloczyn sygnalow x1(t) oraz x2(t);

% czesc graficzna:
    figure(1); 
        subplot(3,1,1);
            plot(t,x1,'b.-');  grid on;
                xlabel('t [s]'); ylabel('x_1(t)'); title('ilustracja graficzna mnożenia sygnałów'); 
        subplot(3,1,2);
            plot(t,x2,'b.-');  grid on;
                xlabel('t [s]'); ylabel('x_2(t)');
        subplot(3,1,3);
            plot(t,x,'b.-');  grid on;
                xlabel('t [s]'); ylabel('x(t) = x_1(t) * x_2(t)');
% koniec czesci graficznej;                
                
x=x/max(abs(x));                    % normalizacja sygnalu przed wyslaniem do karty dzwiekowej; 
fp=1/dt;   sound(x,fp);             % odsluchanie (porownaj sound z soundsc);


% KONIEC