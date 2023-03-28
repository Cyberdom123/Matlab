function X=baza_walsha(K,N);
% X=baza_walsha(K,N);
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Baza Walsha do poziomu K.
% N - liczba punktow na osi czasu;
%
% (C) P.Korohoda 31/10/2015;

dt=1/(N-1); t=0:1/(N-1):1;

X=ones(1,N);
x=xpi(t,1/4,0.5)-xpi(t,3/4,0.5);
X=[X;x];
xnum(1).d=[1,-1];

for k=1:K,
   T=1/(2^(k+1)); 
   for n=1:2^(k-1); % tym razem przebiegamy po kolejnych elementach poprzedniego "pokolenia";
      d0=xnum(k).d(n,:);
      if d0(end)==1; d1=[d0,d0]; d2=[d0,-d0]; else d1=[d0,-d0]; d2=[d0,d0]; end;
               xnum(k+1).d(2*n-1,:)=d1;
               xnum(k+1).d(2*n,:)=d2;
       x1=zeros(1,N); x2=x1;
       for m=1:length(d1);
           x1=x1+d1(m)*xpi(t,T*(m-0.5),T);
           x2=x2+d2(m)*xpi(t,T*(m-0.5),T);
       end;
                   x1(1)=x1(2); x1(end)=x1(end-1); x2(1)=x2(2); x2(end)=x2(end-1);
      X=[X;x1;x2];
   end;
end;

% KONIEC FUNKCJI;