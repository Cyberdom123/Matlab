% m-plik skryptowy: ts_demo_11_sygnal_okresowy.m
%
% Teoria sygnalow
% Elektronika
% AGH
% 
% Opracowanie: P.Korohoda, 22.10.2022

clc; clear; close all;

dt=1e-3;   t=-15:dt:15;  Nt=length(t);

wybieramy=1;
switch wybieramy
    case 1, sygnal_1=@(t,n,T) xpi(t,n*T,T/2);  % dzielenie przez 2 daje efekt wypełnienia = 1/2; 
    case 2, sygnal_1=@(t,n,T) xtri(t,n*T,T/2); % uwaga na dzielenie przez 2;
    case 3, sygnal_1=@(t,n,T) sinc(t-n*T);
end        

T=4; % warto porównac wyniki dla T=1; T=2; T=3; T=4, itd.

x=zeros(1,Nt);
for n=-50:50
    x=x+sygnal_1(t,n,T);
end

    figure(1); 
        k=0;
        for n=-3:3
           k=k+1; 
           x1=sygnal_1(t,n,T);
           subplot(8,1,k); plot(t,x1,'b.-'); grid on;  
                                ylim([-1,1]);
                                
                                if n<0
                                    legend(['x(t)=x_0(t-(',num2str(n),')*T)']);
                                else
                                    legend(['x(t)=x_0(t-',num2str(n),'*T)']);
                                end
                                
                                if (k==1)&(wybieramy==1)
                                    title('Jak powstaje sygnał okresowy z sygnałów PI(t) ?'); 
                                elseif (k==1)&(wybieramy==2)
                                    title('Jak powstaje sygnał okresowy z sygnałów Lambda(t) ?'); 
                                elseif (k==1)&(wybieramy==3)
                                    title('Jak powstaje sygnał okresowy z sygnałów sinc(pi*t) ?'); 
                                else
                                    % nic nie wypisujemy;
                                end
        end    
           subplot(12,1,12); plot(t,x,'b.-'); grid on; 
                            ylim([-1,1]);    
                            xlabel('t [s]'); title(['sygnał okresowy']);
                            
% EOF                            
