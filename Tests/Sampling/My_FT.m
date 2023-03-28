function X_num=My_FT(t,x,f)
    df=f(2)-f(1); Nf=length(f); dt=t(2)-t(1);
    for k=1:Nf
        X_num(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt);
    end
end
