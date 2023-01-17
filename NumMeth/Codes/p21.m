clear
Lx = 1;
Ly = 2;
h = 0.02;
n = Lx/h;
m = Ly/h;
x = 0:h:Lx+h;
y = 0:h:Ly;
%%%%
u       = 3*ones(n+2,m+1);
norm    = 1;
factor  = (4/h^2+2)^(-1);    %(4/h^2+q)^(-1)
k       = 0;
unew    = u;
while norm > 1e-5
    for i = 2:n+1   %i = 1, ..., n
        for j = 2:m %j = 1, ..., m-1
            unew(i,j) = factor*(1/h^2*(u(i-1,j)+...
            u(i+1,j) + u(i,j-1) + u(i,j+1))+x(i)-y(j));
            unew(n+2,j) = u(n,j)+2*h;
        end
    end
    norm = max(max(abs(unew-u)));
    u = unew;
    k = k+1; %count loops
end
k
xplot = x(1:n+1);
uplot = u(1:n+1,:);
surf(xplot,y,uplot')
xlabel('x')
ylabel('y')
zlabel('u')