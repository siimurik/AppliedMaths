%[ -u''(x) = cos(x), x e (0,pi)
%[ u(0) = 2, u'(pi) = 1

clear
n = 50;
h = pi/n; %righthand point
x = 0:h:pi;
A = zeros(n,n);
A(1,1) =  2/h;
A(1,2) = -1/h;
y(1)   = h*cos(x(2)) + 2/h;% first element on the righthand side
for i = 2:n-1
    A(i,i-1) = -1/h;
    A(i,i)   =  2/h;
    A(i,i+1) = -1/h;
    y(i) = h*cos(x(i+1));
end
A(n,n-1) = -1/h;
A(n,n)   =  1/h;
y(n)   = h/2*cos(x(n+1)) + 1;
%%%%
u = A\y';
plot(x,[2;u]);
xlabel('x')
ylabel('u')
grid on
%%%%
exact = cos(x)+1+x;
error = [2;u]-exact';
figure
plot(x,error)
grid on