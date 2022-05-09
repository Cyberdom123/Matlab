clc; clear; close all;

a = [2, 1, 3];
b = [4, 1, 3];

Coef = conv(a, b) %Returns coefficients equivalent
                  %to multiplying polynomials
[Poly, Rest] = deconv(b, a) %Return coefficients equivalent
                     %to division polynomials