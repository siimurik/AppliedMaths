import numpy as np
import matplotlib.pyplot as plt

a = np.loadtxt("output.csv")

x = a[:,0]
u = a[:,1]

plt.plot(x, u)
plt.grid()
plt.show()