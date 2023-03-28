function x_num=My_IFT(f,X,t)
    df=f(2)-f(1); Nt = length(t);
    for n=1:Nt
       x_num(n)=calka(X.*exp(j*2*pi*f*t(n)),df); 
    end
end

