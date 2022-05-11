function y = PollyDiv(a)
   a = a(:).'
   n = length(a) - 1;
   b = [ 1./(n+1:-1:1).*a , 0 ];
end