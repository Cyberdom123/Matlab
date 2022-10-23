% Dominik Michalczyk 03.04.2022
% Funkcja generująca rekurencyjnie
% wielomiany Lagrange'a

function out = RecLag(x)

    if x == 1
        g{1} = [1];
        out = g{x};
    end
    if x == 2
        g{2} = [1,0];
        out = g{x};
    end
    
    for n=2:x-1
        g{1} = [1];
        g{2} = [1,0];
        gn = [g{n}, 0];
        gn1 = [0, 0, g{n-1}];
        g{n+1} = (2*(n-1) + 1)/n * gn - (n-1)/n * gn1;
    end
    out = g{x};
end