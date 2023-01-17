%[ -3u''(x) + e^x u(x)= x-1, x e (-1,1)
%[ u'(-1) = 1, u'(1) = 1    Neumann boundary
% n = 200
clear
n = 200;
h = 2/n; %righthand point
x = -1:h:1;
A = zeros(n+1,n+1);
%%%
A(1,1) =  3/h + h/2*exp(x(1));
A(1,2) = -3/h;
y(1)   =  h/2*(x(1)-1)-3; % + 0
for i = 2:n
    A(i,i-1) = -3/h;
    A(i,i)   =  6/h + h*exp(x(i));
    A(i,i+1) = -3/h;
    y(i) = h*(x(i)-1);
end
A(n+1,n)   = -3/h;
A(n+1,n+1) =  3/h + h/2*exp(x(n+1));
y(n+1)     =  h/2*(x(n+1)-1)-3;
%%%%
u = A\y';
plot(x,u);
xlabel('x')
ylabel('u')
grid on