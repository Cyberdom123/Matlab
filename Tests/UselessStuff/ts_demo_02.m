% m-plik skryptowy: ts_demo_02.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 18.10.2022

clc; clear; close all;

dt=1e-3;  t=-2:dt:2;  N=length(t);
    A=2;   B=-1;   f0=0.5;   p0=pi/4;
p=2*pi*f0*t-p0;     p=mod(p+pi,2*pi)-pi;
x=A*cos(p)+B;
y=A*sin(p);
     
tic;
 for n=1:10:N
    figure(1); clf;
        subplot(2,2,1); plot(t,x,'b.-');  grid on; hold on;
                        plot(t(n),x(n),'ro');
                        plot(0,0,'k+');            % jedynie zaznaczenie poczatku ukladu wspolrzednych;
        subplot(2,2,3); plot(t,p/pi,'b.-');  grid on; hold on;
                        plot(t(n),p(n)/pi,'ro');
                        plot(0,0,'k+');
        subplot(1,2,2); plot(x,y,'b.-');  grid on; hold on;
                        plot([B,x(n)],[0,y(n)],'ro-');
                        plot(0,0,'k+');  
                            axis equal;
         
        pause(0.1); 
 end    
  
czas_realizacji_petli_w_minutach=toc/60,

% KONIEC