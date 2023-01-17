%{
Solve the problem
−u′′(x) + (4 − x)u(x) = x + 5 , x ∈ (0, 2) ,
u′(0) = 1, u′(2) = 2,
by means of the Galerkin finite element method
where xi = ih, h = 0.01
%}
clear
n = 2000;
h = 2/n;
x = 0:h:2;
A = zeros(n+1,n+1);
y = zeros(1, n+1);
A(1,1) = 1/h + h/2*(4-x(1));
A(1,2) = -1/h;
y(1) = h/2*(x(1)+5) - 1;
for i = 2:n
    A(i,i-1) = -1/h;
    A(i,i)   =  2/h + h*(4-x(i));
    A(i,i+1) = -1/h;
    y(i)     = h*(x(i)+5);
end
A(n+1,n)   = -1/h;
A(n+1,n+1) = 1/h + h/2*(4-x(n+1));
y(n+1)     = h/2*(x(n+1)+5) - 1;
%%
tic;
u = inv(A)*y';
%u = A\y';
toc
plot(x,u)
xlabel('x')
ylabel('u')
grid on
