function x=xtri(t,td,T);
% x=xtri(t,td,T);
%
% Teoria sygnalow
% Elektronika
% AGH
%
% (C) P.Korohoda 29/09/2015;

if nargin<2,
 td=0; T=2;    
end;    
    N=length(t);
    x=zeros(1,N);
    a=2/T;

    n=find((t>=(td-T/2))&(t<=td));    x(n)=1-(td-t(n))*a;
    n=find((t<=(td+T/2))&(t>=td));    x(n)=1-(t(n)-td)*a;
    
% KONIEC FUNKCJI;