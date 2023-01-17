%{
    Implicit difference scheme
u_t - u_xx = x^2*(x-1)*cos(t)-(6*x-2)*sin(t), x,t ∈ (0,1)
u(1,t) = u(1,t) = 0
u(x,0) = 0
%}
clear
p = 1;
L = 1;
T = 1;
n = 50;
l = 50;
f = @(x,t) x^2*(x-1)*cos(t)-(6*x-2)*sin(t);
%%%
h = L/n;
tau = T/l;
%%%%
x = 0:h:L;
t = 0:tau:T;
%%%%
for i = 1:n+1   % i = 0,...,n
    u(i,1) = 0;
end
c = p*tau/h^2;
A = zeros(n+1,n+1);
A(1,1) = 1;
for i = 2:n
    A(i,i-1) = -c;
    A(i,i)   = 1+2*c;
    A(i,i+1) = -c;
end
A(n+1,n+1) = 1;
for k = 1:l
    y(1) = 0;
    for i = 2:n
        y(i) = u(i,k) + tau*f(x(i),t(k+1));
    end
    y(n+1) = 0;
    u(:,k+1) = A\y';
end
surf(x,t,u') % screen will be quite dense 
xlabel('x')
ylabel('t')
zlabel('u')
%shading interp
%%%%
exact = x'.^2.*(x'-1).*sin(t);
figure
surf(x,t,exact')
maxerror = max(max(abs(u-exact)))