clear
x = 1:1e-1:3;
y = 0:1e-1:2;
y = y';
%[x,y] = meshgrid(1:1e-1:3,0:1e-1:2);
z = x.^2 + 3*y.^2;
surf(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')