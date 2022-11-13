clear
Lx  = 2;
Ly  = 1;
n   = 50;
m   = 50;
hx  = Lx/n;
hy  = Ly/m;
f   = @(x,y)-x*y;
%%
x   =0:hx:Lx;
y   =0:hy:Ly;
%%
for i = 1:n+1
    for j = 1:m+1
        u(i,j) = 2+0.5*sin(2*x(i)*y(j));
    end
end
eta     = 1e-7;
norm    = 1;
factor  = 1/(2/hx^2+2/hy^2+1);
k       = 0;
unew = u;
while norm > eta
    for j = 2:m
        for i = 2:n
            unew(i,j) = factor*(1/hx^2*(u(i-1,j)+u(i+1,j))+...
            1/hy^2*(u(i,j-1)+u(i,j+1))+f(x(i),y(j)));
        end
    end
    norm=max(max(abs(unew-u)));
    u = unew;
    k = k+1;
end
k
surf(x,y,u')
xlabel('x')
ylabel('y')
zlabel('u')