% m-plik skryptowy: ts_demo_18_przyklad_aproksymacji.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Aproksymacja kombinacji liniowej kosinusoid za pomoc¹ wybranej bazy (Haara lub Walsha);
%
% (C) P.Korohoda, 13/11/2015; 15/11/2018; 23/11/2022;

clc; clear; close all;

K=4; t1=0; t2=1;
T=t2-t1; f1=1/T; f2=10*f1;
dt=T/999; t=t1:dt:t2; Nt=length(t);
A=rand(1,K);
fk=rand(1,K)*(f2-f1)+f1;
pk=(rand(1,K)-0.5)*2*pi;
    x=zeros(1,Nt);
    for k=1:K
        x=x+A(k)*cos(2*pi*fk(k)*t-pk(k));
    end
    
ktora_baza=1; M=4; %liczba pokolen w bazie;
switch ktora_baza
    case 1, B=baza_haara(M,Nt);
    case 2, B=baza_walsha(M,Nt);
    case 3, B=baza_kanoniczna(M,Nt); % Dlaczego ten wariant "nie dzia³a"? Co nale¿a³oby tu zmieniæ?
end
[N1,N2]=size(B);

% wyznaczamy wspolczynniki aproksymacji i od razu dodajemy do sygnalu
% kolejn¹ funkcjê bazow¹:
        x1=zeros(1,Nt);
    for n=1:N1
        a(n)=calka(x.*B(n,:),dt);
        x1=x1+a(n)*B(n,:);    
    end

        figure(1); clf;
            subplot(2,1,1); plot(fk,A,'ro'); grid on;  
                                axis([f1,f2,0,1]);   xlabel('f [Hz]');
            subplot(2,1,2); plot(fk,pk/pi,'ro'); grid on;  
                                axis([f1,f2,-1,1]);  xlabel('f [Hz]'); 
    
        figure(2); clf;
            plot(t,x,'b.-'); hold on; 
            plot(t,x1,'r.-');
                grid on;  xlim([t1,t2]);   xlabel('t [s]');
                
% KONIEC PLIKU;