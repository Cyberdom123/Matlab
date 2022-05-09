function dx=fun(x,t,A,b,fo,p)
    dx=A*x + b*ug(t,fo,p);