clc; clear; format short

a = 0.1; n = 3; LSB = 0.1 * 0.001;

R = [0.7476, 0.7476, 0.8067, 0.8061, 0.9969]

for i=(1:5)
    u_gr(i) = ((a * R(i))/100 + n * LSB)/sqrt(3); 
end
Ray = R(1);
Rax = R(2);
Rbx = R(3);
Rby = R(4);
Rab = R(5);

Uab = 4.9715;
Uxy = Uab * (Rax + Rby - Ray - Rbx)/(2*Rab)
u_gr(6) = ((Uab * 0.02)/100 + 4 * 0.0001)/sqrt(3); %Uab

f(1) = (Uab*(Rax + Rby - Ray - Rbx))/(2*(Rab^2)); %Rab
f(2) = Uab/(2*Rab);
f(3) = Uab/(2*Rab);
f(4) = -Uab/(2*Rab);
f(5) = -Uab/(2*Rab);
f(6) = (Rax + Rby - Ray - Rbx)/(2*Rab); %Uab


k(1) = (f(1)*u_gr(5))^2;
k(2) = (f(2)*u_gr(1))^2;
k(3) = (f(3)*u_gr(2))^2;
k(4) = (f(4)*u_gr(3))^2;
k(5) = (f(5)*u_gr(4))^2;
k(6) = (f(6)*u_gr(6))^2;

f

u_gr

k

Uzm = ((1.26 * 0.2)/100 + 4 * 0.01)
err = sqrt(sum(k))