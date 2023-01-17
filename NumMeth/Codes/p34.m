%{
Solve

    utt(x, t) − uxx(x, t) = 0 , x ∈ (0, 2) , t ∈ (0, 8) ,
    u(0, t) = u(2, t) = 0 , t ∈ (0, 8),
    u(x, 0) = x(2 − x) , ut(x, 0) = 0 , x ∈ (0, 2)

by means of the explicit scheme with the numbers of subintervals 
n = 500, l = 2000 in the x- and t-directions, respectively.
%}
clear
L = 2;
T = 8;
phi = @(x) x*(2-x);
n = 500;
l = 2000;
h   = L/n;
tau = T/l;
x = 0:h:L;
t = 0:tau:T;
%%
c = tau^2/h^2;
for i=1:n+1
u(i,1)=phi(x(i));
u(i,2)=u(i,1)-tau^2;
end
for k=2:l
u(1,k+1)=0;
for i=2:n
u(i,k+1)=2*(1-c)*u(i,k)+c*(u(i-1,k)+u(i+1,k))-u(i,k-1);
end
u(n+1,k+1)=0;
end
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
shading interp
