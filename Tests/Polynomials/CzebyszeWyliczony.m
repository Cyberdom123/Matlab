clc; clear; close all;

x = -0.999 : 0.0001 : 0.999;
dx = 0.0001;

c{1} = ones(1, length(x));
c{2} = x;

for i = 3 : 100
    c{i} = 2.*x.*c{i-1} - c{i-2};
end

for i = 1 : 100
    f{i} = c{i} .* sqrt(2)./nthroot(pi*pi .* (1-x.*x), 4);
end

    figure(1); clf;
        plot(x, c{1}); hold on;
        plot(x, c{2}); hold on;
        plot(x, c{3}); hold on;
        plot(x, c{4}); hold on;
        plot(x, c{5}); hold on;
        plot(x, c{6}); hold on;
        plot(x, c{7}); hold on;
        plot(x, c{8}); hold on;
        plot(x, c{9}); hold on;

w = cos(x);
 
for i = 1 : 100
    a(i) = MyScalar(w, f{i}, dx) / MyScalar(f{i}, f{i}, dx);
end

y_aproximation = zeros(1, length(x));
for i = 1 : 100
    y_aproximation = y_aproximation + a(i)*f{i};
end

    figure(2);
        plot(x, w); hold on;
        plot(x, y_aproximation);