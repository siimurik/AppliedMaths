% v_vec(x_vec) = (x1-x2, x1+x2, x2*x3) 
% v_vec(1,2,3)
v = @(x)[x(1)-x(2), x(1)+x(3), x(2)*x(3)];
% matlab will figure out that x should be a vector
result = v([1,2,3])     % v(1,2,3) won't be understood bc x is a vector
                        % to fix this we write v([1,2,3])
% Alternatively
x0 = [1,2,3];
r = v(x0)