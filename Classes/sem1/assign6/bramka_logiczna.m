function y=bramka_logiczna(x, TP)
    N = length(x);
    for n=1:N
        k = find(x(n) == TP(:,n));
        TP = TP(k,:);
    end
    y = TP(1, N+1);
end