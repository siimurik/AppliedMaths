clear
x = 1:1e-3:3;
y = cos(x).* x.^2;
z = sin(x.^2);
plot(x,y,x,z)
grid on
xlabel('x')
ylabel('y and z')
legend('func_y','func_z')