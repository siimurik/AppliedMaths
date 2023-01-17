clear
n = 200;
h = 2/n;
x = 0:h:2;
f = @(x)10*x*(2-x);
%%%
A = zeros(n-1,n-1);
A(1,1) = 2/h;
A(1,2) = -1/h;
y(1) = h*f(x(2));
for i = 2:99
    A(i,i-1) = -1/h;
    A(i,i)   = 2/h;
    A(i,i+1) = -1/h;
    y(i) = h*f(x(i+1));
end
A(100,99)  = -1/h;
A(100,100) = 4/h;
A(100,101) = -3/h;
y(100) = h*f(x(101));
for i = 101:n-2
    A(i,i-1) = -3/h;
    A(i,i)   =  6/h;
    A(i,i+1) = -3/h;
    y(i) = h*f(x(i+1));
end
A(n-1,n-2) = -3/h;
A(n-1,n-1) =  6/h;
y(n-1) = h*f(x(n));
%%%
u = A\y';
plot(x,[0;u;0])
xlabel('x')
ylabel('u')
grid on