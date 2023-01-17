import numpy as np

def Phi(x):
    # Returns the Laplace error function
    # Also: Phi(x) = 1/2*erf(x/sqrt(2))
    return sum([
            x/(np.sqrt(2*np.pi)) * \
                (-x**2/2)**k/((2*k+1)*np.math.factorial(k))
            for k in range(0, 100)
    ])


x_val = float(input("Enter x value: "))
#x_val = 0.0
print(Phi(x_val))
