% Code for Neumann boundary conditions
% using Gaussian elimination
% u'(0) = a; u'(L) = b
clear
L = 1;
p = 1;
q = 2;
a = 0;
b = 0;
f = @(x)x;
%%%%
n = 50;
h = L/n;
%%%%
x = -h:h:L+h;
A = zeros(n+3, n+3);
A(1,1) = -1/(2*h);
A(1,3) =  1/(2*h);
y(1) = a;
for i = 2:n+2
	A(i, i-1) = -p/h^2;
	A(i, i)   = 2*p/h^2+q;
	A(i, i+1) = -p/h^2;
	y(i) = f(x(i));
end
A(n+3,n+1) = -1/(2*h);
A(n+3,n+3) =  1/(2*h);
y(n+3) = b;
%%%%%
% Gaussian elimination
u = A\y';
%%%%
plot(x(2:n+2), u(2:n+2))
grid on
xlabel('x')
ylabel('u')