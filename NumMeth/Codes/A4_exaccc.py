import math
import scipy
from scipy import special
import numpy as np
import matplotlib.pyplot as plt

def u(x):
    return (math.pi * special.airyai_prime((-1)**(1/3) * (-4 + x)) * special.airybi(-((-1)**(1/3) * (4 - x)))
            - math.pi * special.airyai(-((-1)**(1/3) * (4 - x))) * special.airybi_prime((-1)**(1/3) * (-4 + x))
            + (4 * (-1)**(2/3) * 3**(5/6) * math.pi * special.airyai(-((-1)**(1/3) * (4 - x))) * math.gamma(1/3) * special.hyp2f1(1/3, 2/3, 4/3, -(-4 + x)**3/9))/(math.gamma(2/3) * math.gamma(4/3))
            - ((-1)**(2/3) * 3**(5/6) * math.pi * x * special.airyai(-((-1)**(1/3) * (4 - x))) * math.gamma(1/3) * special.hyp2f1(1/3, 2/3, 4/3, -(-4 + x)**3/9))/(math.gamma(2/3) * math.gamma(4/3))
            - (4 * (-1)**(2/3) * 3**(1/3) * math.pi * special.airybi(-((-1)**(1/3) * (4 - x))) * math.gamma(1/3) * special.hyp2f1(1/3, 2/3, 4/3, -(-4 + x)**3/9))/(math.gamma(2/3) * math.gamma(4/3))
            + ((-1)**(2/3) * 3**(1/3) * math.pi * x * special.airybi(-((-1)**(1/3) * (4 - x))) * math.gamma(1/3) * special.hyp2f1(1/3, 2/3, 4/3, -(-4 + x)**3/9))/(math.gamma(2/3) * math.gamma(4/3))
            + (16 * 3**(1/6) * math.pi * special.airyai(-((-1)**(1/3) * (4 - x))) * math.gamma(2/3) * special.hyp2f1(2/3, 4/3, 5/3, -(-4 + x)**3/9))/(math.gamma(4/3) * math.gamma(5/3))
            + (16 * math.pi * special.airybi(-((-1)**(1/3) * (4 - x))) * math.gamma(2/3) * special.hyp2f1(2/3, 4/3, 5/3, -(-4 + x)**3/9))/(3**(1/3) * math.gamma(4/3) * math.gamma(5/3))
            - (8 * math.pi * x * special.airybi(-((-1)**(1/3) * (4 - x))) * math.gamma(2/3) * special.hyp2f1(2/3, 4/3, 5/3, -(-4 + x)**3/9))/(3**(1/3) * math.gamma(4/3) * math.gamma(5/3))
            + (math.pi * x**2 * special.airybi(-((-1)**(1/3) * (4 - x))) * math.gamma(2/3) * special.hyp2f1(2/3, 4/3, 5/3, -(-4 + x)**3/9))/(3**(1/3) * math.gamma(4/3) * math.gamma(5/3))
            + special.airyai(-((-1)**(1/3) * (4 - x))) * c1
            + special.airybi(-((-1)**(1/3) * (4 - x))) * c2)


t = np.linspace(0, 2, 100)

# Compute y values for the function
y = u(t)

# Create a figure and axis object
fig, ax = plt.subplots()

# Plot the function by passing x and y values to the plot function
ax.plot(x, y)

# Set the x and y axis labels
ax.set_xlabel('x')
ax.set_ylabel('f(x)')

# Show the plot
plt.show()