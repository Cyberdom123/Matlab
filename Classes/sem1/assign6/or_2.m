function y=or_2(a,b)
    TP=[0,0,0;
        0,1,1;
        1,0,1;
        1,1,1];
    y = bramka_logiczna([a,b], TP);
end

