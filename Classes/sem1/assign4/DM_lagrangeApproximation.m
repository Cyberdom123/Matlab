% Dominik Michalczyk 03.04.2022
% Aproksymacja wielomianami Lagrange'a
% m-plik DM_lagrangeApproximation

clc, clear, close all;

k=4; dx = 0.001; x=-1:dx:1; 
phi = pi/4; y1 = cos(3*x + phi);

L{1} = ones(1,length(x));
L{2} = x;
for n=2:k-1 %generowanie następnych wielomianów
L{n+1} = (2 .* n + 1)/(n+1) .* x .* L{n} - n .* L{n-1} / (n+1);
end

% aby przemnożyć każdą wartość x przez otrzymaną bazę należy
% wygenerować macierz współczynników a o wymiarze odpowiadającym
% macierzy wartości x.

y2 = zeros(1,length(x));
for n=1:k
    a(n) = dot(y1,L{n}, dx) / dot(L{n},L{n}, dx)
    y2 = y2 + a(n) .* L{n};
end

figure(1)
    plot(x,y1); hold on, grid on; axis equal;
    plot(x,y2,'r');
    xlabel("x");
    ylabel("y");
    legend("Cosine", "Approximation")

function val = dot(y1,y2, dt)
    sc = y1 .* y2;
    val = (sc(1) + sc(end))/2*dt + sum(sc(2:end-1))*dt;   
end

% End of file