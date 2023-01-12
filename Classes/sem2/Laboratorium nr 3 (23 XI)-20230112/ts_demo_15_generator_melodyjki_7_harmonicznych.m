% m-plik skryptowy: ts_demo_15_generator_melodyjki_7_harmonicznych.m
%
% Teoria sygnalow
% Elektronika
% AGH
% 
% Opracowanie: P.Korohoda, 22.10.2022

clc; clear; close all;

fp=48000;   dt=1/fp;

Tn=[0.4,0.2];                   kT=[1,1,1,1,1,1,2,2,1];
n=[0,2,4,5,7,9,11,12]-9;        kn=[5,3,3,4,2,2,1,3,5];   Nn=length(kn)

fa1=440;    c0=(2^(1/12));    fn = fa1 * c0.^n;

a=2.^(0:-1:-6); h=[1,2,3,4,5,6,7]; Nh=length(a);

x=[];
for m=1:Nn
    t=0:dt:Tn(kT(m))-dt;
    x1=zeros(1,length(t));
    for k=1:Nh
        x1=x1+a(k)*cos(2*pi*h(k)*fn(kn(m))*t);
    end    
    x=[x,x1];
end    

    x=x/max(abs(x));
    
    % weryfikacja rozkładu używanych częstotliwości (uwaga - pasuje tylko do tego przykładu melodii!);
    figure(1); 
        subplot(3,1,1); hold on;
            for k=1:Nh, plot(fn(1:5)*k,ones(1,5)*k,'ro'); end
                    grid on; ylim([0,Nh+1]); xlabel('f [Hz]');
        subplot(3,1,2); hold on;
            for k=1:Nh, plot(log10(fn(1:5)*k),ones(1,5)*k,'ro'); end
                    grid on; ylim([0,Nh+1]); xlabel('log_1_0(f),   gdzie f w [Hz]');
        subplot(3,1,3);
            for k=1:Nh, semilogx(fn(1:5)*k,ones(1,5)*k,'ro'); hold on; end
                    grid on; ylim([0,Nh+1]); xlabel('f [Hz]');
    
    sound(x,fp);
    audiowrite('melodyjka_7_harmonicznych.wav',x,fp);

% EOF