clc; clear; close all;

dt = 0.01;
t_max = 2;
t = -t_max : dt : t_max;

Nsig = 10;
N = 3;
B = zeros(N, length(t));
our_sig = zeros(1, length(t));

for n = 1 : Nsig
    amp = rand(1)*5;
    f0 = rand(1)*1;
    phi = rand(1)*2;
    our_sig = our_sig + amp .* cos(2.*pi.*f0.*t + phi);
end

our_sig = xpi(t,-1,4);

%T = t_max/N;
% for n = 1 : N
%     for m = 1 : N
%         amp = rand(1)*5;
%         td = rand(1)*10;
%        %x`` B(n,:) = B(n,:) + amp * xtri(t, td, T);
%     end
% end

B(1,:) = -xpi(t,0,2);
B(2,:) = xpi(t,1,1);
B(3,:) = xpi(t,-1,1);

%sprawdzenie liniowej niezależności
lin_ind = rank(B)


%wykresy sygnału i bazy
figure(1);
    plot(t, our_sig);
    
figure(2);
    subplot(5,1,1); plot(t, B(1,:));
    subplot(5,1,2); plot(t, B(2,:));
    subplot(5,1,3); plot(t, B(3,:));
   % subplot(5,1,4); plot(t, B(4,:));
  %subplot(5,1,5); plot(t, B(5,:));


%macierz A
A = zeros(N, N);
for n = 1 : N
    for m = 1 : N
        A(n,m) = dot(B(m,:), B(n,:)); 
    end
end


%wektor b
b = zeros(1, N);
for n = 1 : N
    b(n) = dot(our_sig, B(n,:));
end
b = b(:);

%wektor a 
a = A \ b


%sygnał z bazy
new_sig = zeros(1, length(t));
for n = 1 : N
    new_sig = new_sig + a(n)*B(n,:);
end

figure(3);
    plot(t, our_sig, '-b'); hold on;
    plot(t, new_sig, '-r'); 


error = abs(our_sig - new_sig);
caleczka = trapz(t, error)