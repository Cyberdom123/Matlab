% m-plik skryptowy: ts_demo_08_transformata_dla_sygnalu_schodkowego.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 08.11.2022

clc; clear; close all;

dt=0.0001;     t=-10:dt:10;
df=0.01;       f=-10:df:10;    Nf=length(f);

zestaw=1;
switch zestaw
    case 1
        x=xpi(t,0,1);
        X=sinc(f);
    case 2 
        x=xpi(t,-0.5,2) + j*xpi(t,0.5,2);
        X=sinc(f);
end

tic;
for k=1:Nf
    X_num(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt);
end
czas_obliczania_petli_w_minutach=toc/60,

err=max(abs(X_num-X)),

    figure(1);
        subplot(4,1,1); plot(t,real(x),'b.-'); grid on; 
                                xlabel('t [s]');  ylabel('Re(x(t))');
        subplot(4,1,2); plot(t,imag(x),'b.-'); grid on; 
                                xlabel('t [s]');  ylabel('Im(x(t))');
        subplot(4,2,5); plot(f,real(X),'r.'); grid on; hold on;
                        plot(f,real(X_num),'b-'); 
                                xlabel('f [Hz]');  ylabel('Re(X(f))')
        subplot(4,2,7); plot(f,imag(X),'r.'); grid on; hold on;
                        plot(f,imag(X_num),'b-');
                                xlabel('f [Hz]');  ylabel('Im(X(f)')
        subplot(4,2,6); plot(f,abs(X),'r.'); grid on; hold on;
                        plot(f,abs(X_num),'b-'); 
                                xlabel('f [Hz]');  ylabel('|X(f)|')
        subplot(4,2,8); plot(f,angle(X)/pi,'r.'); grid on; hold on;
                        plot(f,angle(X_num)/pi,'b-');
                                xlabel('f [Hz]');  ylabel('faza X(f) / pi')
        
% EOF