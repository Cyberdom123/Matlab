% m-plik skryptowy: ts_demo_04.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: D. Michalczyk, 18.10.2022
% Na podstawie: ts_demo_03.m, P.Korohoda, 18.10.2022

clc; clear; close all;

dt=1e-3;  t=-2:dt:2;        % pseudo-ciagla os czasu;
A=2; f0=2; p0=pi/8;         % zadawane wartosci parametrów sygnalu;  
x=A*exp(j*(2*pi*f0*t-p0));  % sygnal harmoniczny x=x(t);

x_re   = real(x);
x_im   = imag(x);
x_faza = angle(x);
x_ampl = abs(x);

for n=1:10:length(t)
    figure(1); clf;
        subplot(4,2,1); plot(t, x_re, 'b.-'); grid on; hold on;
                        plot(t(n), x_re(n),'ro');
                        plot(0,0,'k+');
                        title('Re(x)');
        subplot(4,2,3); plot(t, x_im, 'b.-'); grid on; hold on;
                        plot(t(n), x_im(n),'ro');
                        plot(0,0,'k+');
                        title('Im(x)');
        subplot(4,2,5); plot(t, x_ampl, 'b.-'); grid on; hold on;
                        plot(t(n), x_ampl(n),'ro');
                        plot(0,0,'k+');
                        title('A(x)');
        subplot(4,2,7); plot(t, x_faza, 'b.-'); grid on; hold on;
                        plot(t(n), x_faza(n),'ro');
                        plot(0,0,'k+');
                        title('\phi(x)');
        subplot(4,2,[2,4,6,8]); plot(x_re, x_im, '.-'); axis equal; grid on; hold on; %wyróżnienie wykresu kołowego
                                plot([0,x_re(n)],[0,x_im(n)],'ro-'); 
                                plot(0,0,'k+');
                                title('Płaszczyzna zespolona');
        pause(0.05);
end
% KONIEC