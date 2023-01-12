% m-plik skryptowy:  ts_demo_14_trenowanie_wyznaczania_icft.m
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
    case 1, X=xpi(f,-5,4) + xpi(f,5,4);
            x_ref=8*sinc(t*4).*cos(2*pi*5*t);
    case 2, X=j*(xpi(f,-6,3) - xpi(f,6,3));   
            x_ref=1;
    case 3, X=xpi(f,-4,5) + xpi(f,4,5) + j*(-xpi(f,-6,2) + xpi(f,6,2));   
            x_ref=1;
    case 4, X=(1/2)*(xpi(f,-4,5) + xpi(f,4,5)) + (1/4)*j*(-xpi(f,-6,2) + xpi(f,6,2));
            x_ref=1;
end

tic;
for n=1:Nt
   x(n)=calka(X.*exp(j*2*pi*f*t(n)),df); 
end 
czas_petli_dla_icft=toc,

err_x=max(abs(x-x_ref)),

    figure(1);
        subplot(2,4,1); plot(t,abs(x),'b.-'); grid on;
        subplot(2,4,5); plot(t,angle(x)/pi,'b.-'); grid on;
        subplot(2,4,2); plot(t,real(x),'b.-'); grid on; 
        subplot(2,4,6); plot(t,imag(x),'b.-'); grid on; 
        
        subplot(2,4,3); plot(f,abs(X),'b.-'); grid on;
        subplot(2,4,7); plot(f,angle(X)/pi,'b.-'); grid on;
        subplot(2,4,4); plot(f,real(X),'b.-'); grid on; 
        subplot(2,4,8); plot(f,imag(X),'b.-'); grid on;
            % prosze uzupełnić opisy, żeby poprawić czytelność układu wykresów!
        

% EOF