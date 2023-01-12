% m-plik skryptowy: ts_demo_05_generator_melodyjki.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 22.10.2022

clc; clear; close all;

fp=48000;   dt=1/fp;

Tn=[0.4,0.2];                   kT=[1,1,1,1,1,1,2,2,1];
n=[0,2,4,5,7,9,11,12]-9;        kn=[5,3,3,4,2,2,1,3,5];   Nn=length(kn)

fa1=440;    c0=(2^(1/12));    fn = fa1 * c0.^n;

x=[];
for m=1:Nn
    t=0:dt:Tn(kT(m))-dt;
    x=[x,cos(2*pi*fn(kn(m))*t)];
end    

    sound(x,fp);
    audiowrite('melodyjka_1a.wav',x,fp);

% EOF