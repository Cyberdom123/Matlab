clc; cler; close all;


function val=MyScalar(y1, y2, dx)
    sc = y1 .* conj(y2);
    val = (sc(1) + sc(end))/2*dt + sum(sc(2:end-1))*dt;
end