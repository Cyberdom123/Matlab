close all;clear all;clc
s = [1 2 3 4];%wartości które mamy

w = zeros(size(s));%stworzenie wektora k tórego będziemy obracać
for n = 0: (length(s)-1)
wn = exp((-1i*2*pi*n)/length(s));%stworzenie wartości obracanego wektora - nadanie mu kierunku na płaszczyźnie zespolonej 
w(n+1) = wn;%wpisanie wartości do wektora
end

sout1 = zeros(size(s)); %stworzenie wektora przechowującego wartości sumy  
sout2 = zeros(size(s)); %stworzenie wektora z ostatecznymi wartosciami DFT
for j = 0 : (length(s) - 1)
    for i = 0 : (length(s) - 1)
        sout1(i+1) = s(i+1) * w(i+1)^j;  
    end
    sout2(j+1) = sum(sout1,'all');
end

figure(1)
stem(s,linewidth = 2);hold on
stem(real(sout2),linewidth = 2);

figure(2)
stem(imag(sout2),linewidth = 2);
hold off;