% Dominik Michalczyk
% m-plik DM_Sumator.m

clc; clear; close all;

Bity = 2;
N = 2^Bity -1;

%Generowanie 2 bitowego kodu binarnego
for n=0:N
    x = dec2bin(n,2);
    XY(n+1,1) = str2num(x(1,1));
    XY(n+1,2) = str2num(x(1,2));
end

%Test bramek
for n=1:length(XY) 
    and = and_2(XY(n,1),XY(n,2));
    or = or_2(XY(n,1),XY(n,2));
    xor = xor_2(XY(n,1),XY(n,2));

    OutputBramki(n, 1) = and;
    OutputBramki(n, 2) = or;
    OutputBramki(n, 3) = xor;
end
XY, OutputBramki

%Blok sumatora
for k=1:size(XY)
    A = XY(k,1); B = XY(k,2);
    C = 0;
    Sumator(1,k) = xor_2(xor_2(A,B), C);
    Cout(1,k) = or_2(and_2(xor_2(A,B),C), and_2(A,B));
end

%Wyświetlannie
for n=1:size(XY)
    X(1,n) = XY(n,2);
    Y(1,n) = XY(n,1);
    K(1,n) = n-1;
end


figure(1)
    subplot(4,1,1)
    stem(K,X)
    ylabel("X")
    subplot(4,1,2)
    stem(K,Y)
    ylabel("Y")
    subplot(4,1,3)
    stem(K,Sumator)
    ylabel("Suma")
    subplot(4,1,4)
    stem(K,Cout)
    ylabel("Carry")
%end