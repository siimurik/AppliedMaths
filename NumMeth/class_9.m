%{
Solve
ut(x, t) − uxx(x, t) = t , x ∈ (0, 2) , t ∈ (0, 3) ,
u(0, t) = u(2, t) = 1 , t ∈ (0, 3),
u(x, 0) = 1 , x ∈ (0, 2)
by means of the explicit difference scheme with the numbers of subin-
tervals n and l in the x- and t-directions, respectively, where
1) n = 100, l = 20000,
2) n = 100, l = 15000,
3) n = 100, l = 14900.
%}
clear
L=2;
T=3;
n=50;
l=5000;
h=L/n;
tau=T/l;
%%
C=2*tau/h^2
%%
x=0:h:L;
t=0:tau:T;
%%
u = zeros(n+1,l+1);
for i=1:n+1
    u(i,1)=1;
end
for k=1:l
    u(1,k+1)=1;
    for i=2:n
        u(i,k+1)=(1-C)*u(i,k)+C/2*(u(i-1,k)+u(i+1,k))+tau*t(k);
    end
    u(n+1,k+1)=1;
end
%%
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
shading interp