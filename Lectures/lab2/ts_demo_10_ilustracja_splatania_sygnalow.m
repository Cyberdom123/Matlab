% m-plik skryptowy: ts_demo_10_ilustracja_splatania_sygnalow.m
%
% Teoria sygnalow
% Elektronika, AGH
%
% (C) P.Korohoda, 17/10/2015; 7/11/2019; 13/11/2021;

clc; clear; close all;

dt=0.1;
t=-10:dt:10; Nt=length(t);

wybieramy_sygnaly=8;
switch wybieramy_sygnaly
    case 1, x1=xpi(t,0,2);  x2=xpi(t,0,2);       ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 2, x1=xpi(t,-1,2); x2=xpi(t,2,2);       ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 3, x1=xpi(t,2,3);  x2=xstep(t,-1,1);    ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 4, x1=xpi(t,2,3);  x2=0.5*xpi(t,-3,2)+xpi(t,0,2);  
                                                 ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 5, x1=xpi(t,2,3);  x2=xtri(t,3,6).*xstep(t,3,1)+xpi(t,2,2); 
                                                 ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 6, x1=xpi(t,2,3);  x2=xtri(t,-3,6).*xstep(t,-3,-1)+xpi(t,-2,2);    
                                                 ymin_3=0;  ymax_3=1; ymin_4=0; ymax_4=3;
    case 7, x1=xpi(t,2,3);  x2=cos(2*pi*0.1*t);  ymin_3=-1; ymax_3=1; ymin_4=-3; ymax_4=3;
    case 8, x1=xpi(t,0,8);  x2=xtri(t);    ymin_3=-1; ymax_3=1; ymin_4=-0.3; ymax_4=0.3;
end

Dt=t(end)-t(1)+dt;
tt=[t-Dt,t,t+Dt]; Ntt=length(tt);
t0=-Dt;
  figure(1); set(gcf, 'WindowState', 'maximized'); pause(0.02);
  
  fs1=14;
        for n=1:2*Nt
        x1a=zeros(1,Ntt); x2a=x1a;
        x1a(Nt+1:2*Nt)=x1; x2a((1:Nt)+(n-1))=x2(end:-1:1);
            if wybieramy_sygnaly==3; x2a(1:n-1)=x2(end); end; % poprawka, gdy sygnal x2 jest staly poza zakresem odcinka czasu, az do "do nieskonczonosci";
        y(n)=calka(x1a.*x2a,dt); % tu wlasnie wyznaczamy (numerycznie!) wartosc splotu;
        ty(n)=t0+(n-1)*dt;
        
        subplot(4,1,1); plot(tt,x1a,'b.-');      grid on;  hold off; xlim([tt(1),tt(end)]);      ylabel('x_1(\tau)','fontsize',fs1);    xlabel('\tau [s]','fontsize',fs1);
        subplot(4,1,2); plot(tt,x2a,'r.-');      grid on;  hold off; xlim([tt(1),tt(end)]);      ylabel('x_2(t-\tau)','fontsize',fs1);  xlabel('\tau [s]','fontsize',fs1);
        subplot(4,1,3); plot(tt,x1a.*x2a,'m.-'); grid on;  hold off; xlim([tt(1),tt(end)]);      ylabel('x_1(\tau) razy x_2(t-\tau)','fontsize',fs1); xlabel('\tau [s]','fontsize',fs1);
                                                    ylim([ymin_3,ymax_3]); 
        subplot(4,1,4); plot(ty,y,'g.-');        grid on;  hold off;                             ylabel('y(t)','fontsize',fs1); xlabel('t [s]','fontsize',fs1); 
                                                    ylim([ymin_4,ymax_4]); xlim([tt(1),tt(end)]);
                                                    
        if abs(y(n))<10^-10
            pause(0.01);
        else
            pause(0.05);
        end    
      end
    
   figure(2);
        subplot(3,1,1); plot(t,x1,'b.-'); grid on;  hold off;  xlim([tt(1),tt(end)]);  ylabel('x_1(t)','fontsize',fs1);    xlabel('t [s]','fontsize',fs1);
        subplot(3,1,2); plot(t,x2,'r.-'); grid on;  hold off;  xlim([tt(1),tt(end)]);  ylabel('x_2(t)','fontsize',fs1);    xlabel('t [s]','fontsize',fs1);
        subplot(3,1,3); plot(ty,y,'g.-'); grid on;  hold off;  xlim([tt(1),tt(end)]);  ylabel('y(t)','fontsize',fs1);      xlabel('t [s]','fontsize',fs1);
    
% KONIEC PLIKU;