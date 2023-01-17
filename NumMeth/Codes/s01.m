%data
x = 10;
t = 5e3;
%computation of result
v = (x*t - x/t)^(1/(x-t))
%%
% inline function
f1 = @(x)x^2 - 3*x + 5;
