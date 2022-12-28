%{
Construct an explicit difference scheme of 2nd order local accuracy for
the problem
utt(x, t) + ut(x,t) − uxx(x,t) − ux(x,t) = x + t , x ∈ (0, 1), t ∈ (0, 4),
u(0, t) = u(1, t) = 0 , t ∈ (0, 4),
u(x, 0) = ut(x, 0) = 0 , x ∈ [0, 1].
and solve the problem with the space stepsize h = 0.01 and different
time stepsizes τ . Numerically, find maximum τ for maintaining the
stability.
---
Becomes unstabile at:
n = 100, l = 390.
%}
clear
L = 1;
T = 4;
n = 100;
l = 400;   
h = L/n
tau = T/l;
%%
%C = tau^2/h^2
%%
u = zeros(n+1,l+1);
x = 0:h:L;
t = 0:tau:T;
%%
for i=1:n+1
    u(i,1)=0;
end
tic;
u = zeros(n+1,l+1);
for k=2:l
    u(1,k+1)=0;
    for i=2:n
        u(i,k+1)=1/(2-tau)*(4*u(i,k)*(1-C) - u(i,k-1)*(2-tau) + ...
            C*u(i+1,k)*(2-h) + C*u(i-1,k)*(2+h) + x(i) + t(k));    
        %    This has truncation error is O(h^2 + τ^2) but doesn't work :(
        %------------------------------------------------------------------
        % u(i,k+1)= 1/(1+tau)*( u(i,k)*(2-tau)-u(i,k-1)+ tau^2/h^2*(u(i+1,k) ...
        % -2*u(i,k) + u(i-1,k)) - tau^2/h*(u(i+1,k) - u(i,k)) + x(i) + t(k));
    end             %%% Current truncation error is O(h^2 + τ )
    u(n+1,k+1)=0;
end
toc
%%
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
shading interp
