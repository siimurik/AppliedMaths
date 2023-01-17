%{
    Explicit difference scheme
ut(x, t) − uxx(x, t) = t , x ∈ (0, 2) , t ∈ (0, 3) ,
u(0, t) = u(2, t) = 1 , t ∈ (0, 3),
u(x, 0) = 1 , x ∈ (0, 2)

1) n = 100, l = 20000,
2) n = 100, l = 15000,
3) n = 100, l = 14900
%}
clear
p = 1;
L = 2;
T = 3;
n = 100;
%l = 20000;
%l = 15000;
l = 14900; %instability occurs 
%%%
h = L/n;
tau = T/l;
%%%%
x = 0:h:L;
t = 0:tau:T;
%%%%
for i = 1:n+1   % i = 0,...,n
    u(i,1) = 1;
end
c = p*tau/h^2;
for k = 1:l
    u(1,k+1) = 1;
    for i = 2:n % i = 1,...,n-1
        u(i,k+1) = (1-2*c)*u(i,k) + c*(u(i-1,k) + u(i+1,k))+...
                    tau*t(k);
    end
    u(n+1,k+1) = 1;
end
surf(x,t,u') % screen will be quite dense 
xlabel('x')
ylabel('t')
zlabel('u')
shading interp
