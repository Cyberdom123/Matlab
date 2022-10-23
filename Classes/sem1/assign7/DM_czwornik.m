%Dominik Michalczyk
%m-plik: DM_czwornik
%08.05.2022 22:22

clc; clear; close all;

R1 = 1; R2 = 2; R3 = 3; C1 = 10e-6; C2 = 100e-6; 
f = logspace(2,10,1000);


fo = 1000; U = 10; dt = 1e-6; t=0:dt:0.01; p=-5; N = length(t);

w = 2.*pi*f;

Zc1 = -j./(w*C1);
Zc2 = -j./(w*C2);

Z1 = Zc1 * R1./(Zc1 + R1) + R2;
Z2 = Zc2 * R3./(Zc2 + R3);

Z12 = Z1 + Z2;

H = Z2./Z12;

figure(1) 
    subplot(3,2,1)
    semilogx(f,real(H))
    title("Real")
    subplot(3,2,2)
    semilogx(f,imag(H))
    title("Imag")
    subplot(3,2,3)
    semilogx(f,abs(H))
    title("ABS")
    subplot(3,2,4)
    semilogx(f,angle(H)/pi)
    title("Angle")
    subplot(3,2,5)
    semilogx(f,20*log10(abs(H)))
    title("20log10(H)")


A = [ -1/(R2*C1) - 1/(R1*C1)  , -1/(R2*C1);
      -1/(C2*R2), -1/(C2*R2) - 1/(R3*C2)];

b = [1/(R2*C1) ; 1/(C2*R2)];

X(1:2,1)=[-1; -1];
for n=1:N-1
    X(1:2,n+1)=X(1:2,n) + dt*fun(X(1:2,n), t(n), A, b, fo, p);
end
Uin = ug(t,fo,p);

figure(2)
    hold on;
    plot(t,Uin,'r')
    plot(t,X(2,:),'b')
    legend("Uin", "Uout")
%end