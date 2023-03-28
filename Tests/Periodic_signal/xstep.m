function x=xstep(t,td,a);
% x=xstep(t,td,a);
%
% Teoria sygnalow
% Elektronika
% AGH
%
% (C) P.Korohoda 29/09/2015;

if nargin<2,
 td=0; a=1;
end;    
    dt=t(2)-t(1);
    N=length(t);

    x=zeros(1,N);
    if a==1
        x(t>=td)=1;
    else
        x(t<=td)=1;
    end;

    % warunki Dirichleta:
    x((t>(td-dt/2))&(t<(td+dt/2)))=1/2;

% KONIEC FUNKCJI;