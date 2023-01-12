function x=element_bazy_haara(k,m,N);
% x=element_bazy_haara(k,m,N);
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Pojedyncza funkcja bazy haara - z grupy 'k' numer funkcji: 'm'.
% N - liczba punktow na osi czasu;
%
% (C) P.Korohoda 31/10/2015;

dt=1/(N-1);
t=0:1/(N-1):1;
T=1/(2^k);
x= xpi(t, T*(m-3/4), T/2) - xpi(t, T*(m-1/4), T/2);
x=2^(k/2)*x;

% korekta na obu krancach "czasu":
if abs(x(1))>0, x(1)=x(2); end; if abs(x(end))>0, x(end)=x(end-1); end;

% KONIEC FUNKCJI;