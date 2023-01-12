% m-plik skryptowy: ts_demo_13_trenowanie_wyznaczania_cft_2.m
%
% Teoria sygnalow
% Elektronika
% AGH
% 
% Opracowanie: P.Korohoda, 21.11.2022

clc; clear; close all;

dt=1e-3; t=-10:dt:10; Nt=length(t);
df=1e-3; f=-10:df:10; Nf=length(f);

opcja=1;
switch opcja
    case 1, x=xpi(t,0,1).*cos(2*pi*2.1*t);
            X_ref=(1/2)*( sinc((f+2.1)) + sinc((f-2.1)) );
    case 2, x=xpi(t,2,1).*cos(2*pi*2.1*t);
            X_ref=1;
    case 3, x=xtri(t,-1,1).*cos(2*pi*2.1*t);
            X_ref=1;
    case 4, x=xpi(t,-1,1).*sin(2*pi*2.1*t);
            X_ref=1;
    case 5, x=xpi(t,2,3).*cos(2*pi*2.1*t);
            X_ref=1;
    case 6, x=xpi(t,1,4).*cos(2*pi*2.1*(t-1));
            X_ref=1;
    case 7, x=xpi(t,2,4).*cos(2*pi*3.1*(t-1));
            X_ref=1;
    case 8, x=xpi(t,2,4).*sin(2*pi*3.1*(t-1));
            X_ref=1;
    case 9, x=xtri(t,2,4).*sin(2*pi*3.1*(t-1));
            X_ref=1;            
end

tic;
for k=1:Nf
   X(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt); 
end 
czas_petli_dla_cft=toc,

err_X=max(abs(X-X_ref)),

    figure(1);
        subplot(2,4,1); plot(t,abs(x),'b.-'); grid on;
        subplot(2,4,5); plot(t,angle(x)/pi,'b.-'); grid on;
        subplot(2,4,2); plot(t,real(x),'b.-'); grid on; 
        subplot(2,4,6); plot(t,imag(x),'b.-'); grid on; 
        
        subplot(2,4,3); plot(f,abs(X),'b.-'); grid on; hold on;
                        plot(f,abs(X_ref),'r.');
        subplot(2,4,7); plot(f,angle(X)/pi,'b.-'); grid on; hold on;
                        plot(f,angle(X_ref)/pi,'r.');
        subplot(2,4,4); plot(f,real(X),'b.-'); grid on; hold on;
                        plot(f,real(X_ref),'r.');
        subplot(2,4,8); plot(f,imag(X),'b.-'); grid on; hold on;
                        plot(f,imag(X_ref),'r.');
            % prosze uzupełnić opisy, żeby poprawić czytelność układu wykresów!
        

% EOF