%{
Solve
−∆u(x, y) + 2u(x, y) = x − y , x ∈ (0, 1) , y ∈ (0, 2) ,
u(x, 0) = u(x, 2) = 3 , x ∈ (0, 1),
u(0, y) = 3, ux(1, y) = 1 , y ∈ (0, 2)
by means of the finite difference method with the stepsize hx = hy =
0.02.
%}
clear
Lx=1;
Ly=2;
n=50;
m=100;
h=1/n;
f=@(x,y)x-y;
%%
x=0:h:Lx+h;
y=0:h:Ly;
%%
u=3*ones(n+2,m+1);
eta=1e-5;
norm=1;
factor=1/(4/h^2+2);
k=0;
unew=u;
while norm>eta
    for j=2:m
        for i=2:n+1
            unew(i,j)=factor*(1/h^2*(u(i-1,j)+u(i+1,j)+...
            u(i,j-1)+u(i,j+1))+f(x(i),y(j)));
        end
        unew(n+2,j)=u(n,j)+2*h;
    end
    norm=max(max(abs(unew-u)));
    u=unew;
    k=k+1;
end
k
xplot=x(1:n+1);
uplot=u(1:n+1,:);
surf(xplot,y,uplot')
xlabel('x')
ylabel('y')
zlabel('u')