% Dominik Michalczyk
% Badanie błędu przybliżenia wzorem Taylora dla funkcji cos(A)
% gdzie A jest macierzą kadratową.
% 30.03.2022

clc; clear; close all;

K = 8; % ilość wyrazów
size = 10; % wielkość macierzy kwadratowej

A = rand(size);
X = zeros(size);
Y = funm(A, @cos);

%funm(A,fun) evaluates the user-defined function fun at the square matrix argument
Yt{1} = funm(X, @cos); %pierwszy wyraz szeregu
err(1) = max(max(abs(Yt{1} - Y)));
for n=2:K
    Yt{n} = Yt{n-1} + ((-1).^(n-1).*A^(2*(n-1)))/factorial(2*(n-1)); 
    err(n) = max(max(abs(Yt{n}-Y))); %maksymalny błąd dla każdej z macierzy
end

x = 1:K;
figure(1)
    grid on;
    plot(x,err);
    xlabel("Ilość wyrazów");
    ylabel("Błąd przybliżenia");

