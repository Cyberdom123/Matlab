% m-plik skryptowy: ts_demo_09_transformata_dla_sygnalow_kosinusoidalnych_2.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 07.11.2022

clc; clear; close all;

sygnal=1; % wybieramy sygnał audio;
switch sygnal
    case 1
        [x,fp]=audioread('melodyjka_1a.wav');
    case 2
        [x,fp]=audioread('melodyjka_1b.wav');
    case 3
        [x,fp]=audioread('melodyjka_1c.wav');
end  
   
x=x';   Nx=length(x);
czas_nagrania_w_sekundach=Nx/fp,
dt=1/fp;    t=0:dt:(Nx-1)*dt;

zestaw_f=2; % wybieramy zestaw "f";
if zestaw_f==1
    df=1;  f=0:df:5000;
elseif zestaw_f==2    
    df=0.2;  f=0:df:1000;
else
    df=0.05;  f=300:df:500;
end    
Nf=length(f);

tic;
for k=1:Nf
    X(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt);
end
czas_obliczania_petli_w_minutach=toc/60,

    figure(1);
        subplot(4,1,1); plot(t,x,'b.-'); grid on;
                            xlim([t(1),t(end)]); xlabel('t [s]');  ylabel('x(t)');
        subplot(4,1,2); plot(f,abs(X),'r.'); grid on; hold on;
                            xlim([f(1),f(end)]); xlabel('f [Hz]'); ylabel('|X(f)|');
        subplot(4,1,3); plot(f,abs(X),'r-'); grid on; hold on;
                            xlim([f(1),f(end)]); xlabel('f [Hz]'); ylabel('|X(f)|');
        subplot(4,1,4); plot(f,abs(X),'r.-'); grid on; hold on;
                            xlim([f(1),f(end)]); xlabel('f [Hz]'); ylabel('|X(f)|');

%sound(x,fp);

% EOF