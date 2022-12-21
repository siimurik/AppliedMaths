%{
Solve
−(pu′)′(x) = 10x(2 − x) , x ∈ (0, 2) ,
u(0) = u(2) = 1,
p(x) =
{1 if x ∈ (0, 1)
{3 if x ∈ (1, 2) by means of the Galerkin finite element
method
where i = 0, . . . , n, n = 200, h = 2/n 
%}
clear
n=200;
f=@(x)10*x*(2-x);
%%
h = 2/n;
x = 0:h:2;
A = zeros(n-1,n-1);
A(1,1) = 2/h;
A(1,2) = -1/h;
y(1) = h*f(x(2))+1/h;
for i = 2:99
    A(i,i-1) = -1/h;
    A(i,i)   = 2/h;
    A(i,i+1) = -1/h;
    y(i)     = h*f(x(i+1));
end
A(100,99)  = -1/h;
A(100,100) = 4/h;
A(100,101) = -3/h;
y(100)     = h*f(x(101));
for i = 101:198
    A(i,i-1) = -3/h;
    A(i,i)   = 6/h;
    A(i,i+1) = -3/h;
    y(i)     = h*f(x(i+1));
end
A(199,198) = -3/h;
A(199,199) = 6/h;
y(199) = h*f(x(200))+3/h;
%%
u=A\y';
plot(x,[1;u;1])
xlabel('x')
ylabel('u')
grid on