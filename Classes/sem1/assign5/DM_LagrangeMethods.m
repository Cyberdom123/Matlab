% Dominik Michalczyk 03.04.2022
% Porównanie sposobów generowania 
% wielomianów Lagrange'a
% m-plik DM_LagrangeMethods.m

clc, clear, close all;
PollyNum = 10; 

p{1} = [1];
x = -1:0.01:1;

for n=2:PollyNum
    W = [1,0,-1]; %(x^2 - 1)^n
    W2 = 1;

    for k=1:n-1
        W2 = conv(W2,W);
    end

    for k=1:n-1
        j = length(W2) - 1;
        W2 = (j:-1:1).*W2(1:end-1);
    end
   
    p{n} = (W2)/(2^(n-1) * factorial(n-1));
end

DivPoly = p{PollyNum}
RecPoly = RecLag(PollyNum)

y1 = polyval(DivPoly, x);
y2 = polyval(RecPoly, x)

err = max(abs(y1-y1))

    figure(1)
        plot(x, y1, 'b'); hold on; grid on;
        plot(x, y2,'ro');
        xlabel("x");
        ylabel("Lagrange polyval");
        legend("DivPoly", "RecPoly")

%end