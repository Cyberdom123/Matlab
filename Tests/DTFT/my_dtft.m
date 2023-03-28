function y_f = my_dtft(t, y_t, f)
    dt = t(2) - t(1);
    N = length(t);


    y_f = zeros(size(f));
    k = f/(f(2) - f(1));
    for k = k
        k = round(k) + 1;
        for n = 1:N
            w = exp((-1i * 2 * pi * k * n) / N);
            y_f(k) = y_f(k) + dt * y_t(n) * w;
        end
    end
end