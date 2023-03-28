function X=baza_kanoniczna(K,N);
% X=baza_kanoniczna(K,N);
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Baza kanoniczna do poziomu 2^K.
% N - liczba punktow na osi czasu;
%
% (C) P.Korohoda 25/11/2016;

M=2^(K+1);
dt=1/(N-1); t=0:1/(N-1):1;  T=1/M;
X=[];
for m=1:M,
   X=[X;xpi(t,(m*T-T/2),T)]; 
end;    

% KONIEC FUNKCJI;