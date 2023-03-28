
function val=SPro(y1, y2, dt)
    sc = y1 .* conj(y2);
    val = (sc(1) + sc(end))/2*dt + sum(sc(2:end-1))*dt;
end