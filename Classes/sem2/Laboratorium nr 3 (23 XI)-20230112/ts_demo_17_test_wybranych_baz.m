% m-plik skryptowy: ts_demo_17_test_wybranych_baz.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Baza Walsha;
%
% (C) P.Korohoda 31/10/2015; 15/11/2018; 23/11/2022;

clc; clear; close all;

N=2^14+1; % liczba punktów na osi czasu - dodanie "1" powoduje, ze nie trafiamy "pomiedzy" z przeskokiem w funkcji xpi;
wybor_bazy=1;
switch wybor_bazy
    case 1, X=baza_haara(3,N);
    case 2, X=baza_walsha(3,N);                    
    case 3, X=baza_kanoniczna(3,N);
end        
    [NH,Nt]=size(X);
    dt=1/(N-1); t=0:dt:1;
    
% iloczyny skalarne:
for m=1:NH
    for n=1:NH
        x=X(n,:); y=X(m,:);
        Ais(m,n)=calka(x.*y,dt);
    end
end 
    
    figure(1);
       for n=1:NH
           subplot(NH,1,n); plot([t(1),t(end)],[0,0],'k-'); grid on; hold on;
                            plot(t,X(n,:),'b.-');
       end  

    figure(2);
        mesh(Ais); axis ij;
        


% KONIEC PLIKU;