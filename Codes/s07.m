clear
x = 1;
xold = 0;
while abs(x - xold) >= 1e-7
    xold = x;
    x = cos(x);
end
x
