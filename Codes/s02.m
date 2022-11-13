z1 = @(x,y)cos(x*y) - x + y^3;
z2 = @(x,y)z1(x-y,x+y) - x*tan(x);
v1 = z1(1,5)
v2 = z2(1,5)
%% submatrix from matrix
%A = [1 2 3; 4 5 6; 7 8 9];
%B = A(1:2,2:3)
%% inverse matrix 
% inv(A) * B == A \ B 