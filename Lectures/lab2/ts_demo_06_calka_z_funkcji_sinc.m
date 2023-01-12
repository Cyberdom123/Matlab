% m-plik skryptowy: ts_demo_06_calka_z_funkcji_sinc.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 08.11.2022

clc; clear; close all;

dt=0.01;   % mozna zmieniać, ale "z wyczuciem" - proszę sprawdzać czas liczenia i poprawę dokładności wyliczenia całki (!);
max_k=10;  % proszę porównać czas liczenia dla max_k=10 i max_k=20 i wyciągnąć z tego wniosek, co do wyboru tego parametru;
tic;
for k=1:max_k 
    t=-2^k:dt:2^k;       T(k)=t(end)-t(1);
    x=sinc(t);
    C(k)=calka(x,dt);
end 
toc

    figure(1);
        loglog(T,1-C,'bo-'); grid on;
              xlabel('log_1_0(T)'); ylabel('log_1_0(1-C)');
            

% EOF