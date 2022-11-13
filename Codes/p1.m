clear
L = pi;
p = 1;
q = 3;
a = 1;
b = 2;
f = @(x)3-8*sin(x);
%%%%
n = 100;
h = L/n;
%%%%
x = 0:h:L+h;
A = zeros(n+2, n+2);
A(1,1) = 1;
y(1) = a;
for i = 2:n+1
	A(i, i-1) = -p/h^2;
	A(i, i)   = 2*p/h^2+q;
	A(i, i+1) = -p/h^2;
	y(i) = f(x(i));
end
A(n+2,n) = -1/(2*h);
A(n+2,n+2) = 1/(2*h);
y(n+2) = b;
%%%%%
% Gaussian elimination
u = A\y';
%%%%
plot(x(1:n+1), u(1:n+1))
grid on
xlabel('x')
ylabel('u')
%%%% error
exact = 1 - 2*sin(x);
error = u - exact';
figure
plot(x(1:n+1), error(1:n+1))
xlabel('x')
ylabel('error')
grid on