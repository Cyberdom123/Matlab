% m-plik skryptowy: ts_demo_07_transformata_dla_sygnalow_kosinusoidalnych_1.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 07.11.2022

clc; clear; close all;

Tmax=20;
dt=0.001;  t=-Tmax/2:dt:Tmax/2;
df=0.01;   f=-10:df:10;        Nf=length(f);

f0=2;     p0=0;    x0=cos(2*pi*f0*t - p0); % przez dobór p0 możemy np. zamienić "cos" na "sin" albo "cos" na "-cos";

n_max=10;
tic;
for n=1:n_max
    T(n)=Tmax*n/n_max;
    x=xpi(t,0,T(n)).*x0;
    for k=1:Nf
        X(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt);
    end
    
    figure(1); clf;
        subplot(3,1,1); plot(t,x,'b.-'); grid on; 
                            title(['wynik nr ',num2str(n),' z ', num2str(n_max)]);
                            xlabel('t [s]'); ylabel('x(t)');
        subplot(3,1,2); plot(f,real(X),'r.-'); grid on;
                            xlabel('f [Hz]'); ylabel('Re(X(f))'); 
                                ylim([-Tmax/2,Tmax/2]);
        subplot(3,1,3); plot(f,imag(X),'g.-'); grid on;
                            xlabel('f [Hz]'); ylabel('Im(X(f))');
                                ylim([-Tmax/2,Tmax/2]);
    pause(1);
end    
czas_obliczania_petli_w_minutach=toc/60,


% EOF