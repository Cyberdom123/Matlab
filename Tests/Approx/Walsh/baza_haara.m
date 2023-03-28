function X=baza_haara(K,N);
% X=baza_haara(K,N);
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Baza Haara do poziomu K.
% N - liczba punktow na osi czasu;
%
% (C) P.Korohoda 31/10/2015;

X=ones(1,N);
x=element_bazy_haara(0,1,N);
X=[X;x];

for k=1:K,
    for m=1:2^k,
      x=element_bazy_haara(k,m,N);
      X=[X;x];
    end;
end;

% KONIEC FUNKCJI;