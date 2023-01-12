function x=xpi(t,td,T);
% x=xpi(t,td,T);
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% (C) P.Korohoda 29/09/2015;

if nargin<2,
 td=0; T=1;    
end;    
    dt=t(2)-t(1);
    N=length(t);
    x=zeros(1,N);
    t1=td-T/2; t2=td+T/2;
    x((t>=t1)&(t<=t2))=1;

    % warunki Dirichleta:
    x((t>(t1-dt/2))&(t<(t1+dt/2)))=1/2;    x((t>(t2-dt/2))&(t<(t2+dt/2)))=1/2;

% KONIEC FUNKCJI;