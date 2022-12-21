%{
Solve
−u′′(x) + 1
x + 1 u(x) = 0 , x ∈ (0, 2) ,
u(0) = 4, u(2) = 2,
by means of the Galerkin finite element method with shape functions
%}
clear
n=100;
h=2/n;
x=0:h:2;
A=zeros(n-1,n-1);
A(1,1)=2/h+h/(x(2)+1);
A(1,2)=-1/h;
y(1)=4/h;
for i=2:n-2
    A(i,i-1) = -1/h;
    A(i,i)   =  2/h + h/(x(i+1)+1);
    A(i,i+1) = -1/h;
    y(i)=0;
end
A(n-1,n-1)=2/h+h/(x(n)+1);
A(n-1,n-2)=-1/h;
y(n-1)=2/h;
%%
u=A\y';
plotx,[4;u;2])
xlabel('x')
ylabel('u')
grid on