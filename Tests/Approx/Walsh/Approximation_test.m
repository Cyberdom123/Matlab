clc; clear; close all;

N = 2^14+1

X=baza_walsha(1,N);

%dt=1/(N-1); 
dt=0.00001; t=-2:dt:2;

x_t = xpi(t,-1,4);
b_0 = -xpi(t,0,2);
b_1 = xpi(t,1,1);
b_2 = xpi(t,-1,1);

SPro(b_0, b_1, dt)

figure(1)
    plot(t,b_0)
figure(2)
    plot(t,b_1)
figure(3)
    plot(t,b_2)
figure(4)
    plot(t,x_t,'black'); hold on;

a_0 = SPro(x_t,b_0,dt)/SPro(b_0,b_0,dt)
a_1 = SPro(x_t,b_1,dt)/SPro(b_1,b_1,dt)
a_2 = SPro(x_t,b_2,dt)/SPro(b_2,b_2,dt)



x_app = a_0 * b_0 + a_1 * b_1 + a_2 * b_2;

figure(4)
    plot(t,x_app,'red')

%x = xpi(t);
%fmax = 5; f=-fmax:0.01:fmax;
%X_f = My_FT(t,x,f);
error = abs(x_t - x_app);
er = trapz(t, error)


My_