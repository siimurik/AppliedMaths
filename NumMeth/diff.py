"""
Solve the problem
-u''(x) + (4 - x)u(x) = x + 5 , x ∈ (0, 2) ,
u'(0) = 1, u'(2) = 2,
by means of the Galerkin finite element method
where xi = ih, h = 0.01
"""
from matplotlib import pyplot as plt
from scipy.integrate import odeint
import numpy as np

def f(u,x):
    return (u[1],-5 * u[1]-7)

y0 = [21,12]
xs = np.arange(0,5,0.1)
us = odeint(f,y0,xs)
ys = us[:,0]

plt.plot(xs,ys,'-')
plt.plot(xs,ys,'ro')
plt.xlabel('x values')
plt.ylabel('y values')
plt.title('(D**2+ 5*D+7)y=0')
plt.show()