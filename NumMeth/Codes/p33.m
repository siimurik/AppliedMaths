%{
    Crank-Nicolson scheme
u_t - u_xx = x^2*(x-1)*cos(t)-(6*x-2)*sin(t), x,t ∈ (0,1)
u(1,t) = u(1,t) = 0
u(x,0) = 0
%}
clear
L = 1;
T = 1;
f = @(x,t) x^2*(x-1)*cos(t)-(6*x-2)*sin(t);
n = 50;
l = 50;
%%%
h   = L/n;
tau = T/l;
x   = 0:h:L;
t   = 0:tau:T;
%%
for i = 1:n+1
    u(i,1) = 0;
end
c = tau/h^2;
A = zeros(n+1,n+1);
A(1,1) = 1;
for i = 2:n
    A(i,i-1)=-c/2;
    A(i,i)  = 1+c;
    A(i,i+1)=-c/2;
end
A(n+1,n+1) = 1;
for k = 1:l
    y(1) = 0;
    for i = 2:n
        y(i) =  c/2*u(i-1,k) + (1-c)*u(i,k) + c/2*u(i+1,k)+...
                tau/2*(f(x(i),t(k)) + f(x(i),t(k+1)));
    end
    y(n+1)  = 0;
    u(:,k+1)= A\y';
end
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
%%%
exact = x'.^2.*(x'-1).*sin(t);
maxerror = max(max(abs(u-exact)))
%{
for i = 1:n+1
    for k = 1:l+1
        ue(i,k)=x(i)^2*(x(i)-1)*sin(t(k));
    end
end
error = max(max(abs(u-ue)))
%}