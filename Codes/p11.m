%[ -u''(x) = x, x e (0,pi)
%[ u(0) = 2, u'(1) = 3
% n = 100
clear
n = 100;
h = 1/n; %righthand point
x = 0:h:1;
A = zeros(n-1,n-1);
A(1,1) =  2/h;
A(1,2) = -1/h;
y(1)   = h*x(2) + 2/h; % + 0
for i = 2:n-2
    A(i,i-1) = -1/h;
    A(i,i)   =  2/h;
    A(i,i+1) = -1/h;
    y(i) = h*x(i+1);
end
A(n-1,n-2) = -1/h;
A(n-1,n-1) =  2/h;
y(n-1)     = h*x(n) + 3/h;
%%%%
u = A\y';
plot(x,[2;u;3]);
xlabel('x')
ylabel('u')
grid on