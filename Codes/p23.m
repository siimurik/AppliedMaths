%{
    [ -Δ + (x+1)u = 0, (x,y) ∈ (0,1)^2
    { u(x,0) = u(0,y) = 1
    [ u_x(1,y) = u_y(x,1) = 0
    m = n = 100
    || u^k - u^k-1||_inf < 10^(-5)
%}
clear
Lx = 1;
Ly = 1;
n = 100;
m = 100;
h = Lx/n;
q = @(x)x+1;
x = 0:h:Lx+h;
y = 0:h:Ly+h;
%%%%
u       = ones(n+2,m+2);
norm    = 1;
k       = 0;
unew    = u;
while norm > 1e-5
    for i = 2:n+1   %i = 1, ..., n
        for j = 2:m+1 %j = 1, ..., m-1
            unew(i,j) = 1/(4+h^2*q(x(i)))*(u(i-1,j)+...
            u(i+1,j) + u(i,j-1) + u(i,j+1));
            unew(n+2,j) = u(n,j);
        end
        unew(i,m+2) = u(i,m);
    end
    norm = max(max(abs(unew-u)));
    u = unew;
    k = k+1; %count loops
end
k
xplot = x(1:n+1);
yplot = y(1:m+1);
uplot = u(1:n+1,1:m+1);
surf(xplot,yplot,uplot')
xlabel('x')
ylabel('y')
zlabel('u')