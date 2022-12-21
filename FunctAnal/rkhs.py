import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button
plt.rcParams['figure.dpi'] = 100
                           
fig, ax = plt.subplots()
plt.subplots_adjust(left=0.25, bottom=0.25)
number_pts=200
sigma_kernel=5./number_pts
t = np.arange(0.0, 1.0, 1./number_pts)

mu, sigma_noise = 0, 2 # mean and standard deviation
noise = np.random.normal(mu, sigma_noise, t.size)

a0 = 5
f0 = 2
lmbda0=1E-2
s = a0*np.sin(2*np.pi*f0*t)+noise

from scipy.spatial.distance import pdist, squareform
pairwise_sq_dists = squareform(pdist(np.reshape(t,[-1,1]), 'sqeuclidean'))
K = np.exp(-pairwise_sq_dists / sigma_kernel**2)

sapprox = np.dot(K,np.linalg.solve(K+lmbda0*t.size*np.eye(t.size), s))

l1, = plt.plot(t, sapprox,'m-')
l, = plt.plot(t, s,'ko')
plt.axis([0, 1, -10, 10])

plt.title('Effect of regularization on KRR')


axcolor = 'lightgoldenrodyellow'
axlmbda = plt.axes([0.25, 0.15, 0.65, 0.03], facecolor=axcolor,xscale='log')

slmbda = Slider(axlmbda, 'Lambda (logscale)', 1E-6, 1E2, valinit=lmbda0, color="purple")


def update(val):
    lmbda = slmbda .val
    #lmbda = 
    slmbda.valtext.set_text(np.log10(lmbda))    
    l1.set_ydata(np.dot(K,np.linalg.solve(K+lmbda*t.size*np.eye(t.size), s)))    
    fig.canvas.draw_idle()
slmbda.on_changed(update)

resetax = plt.axes([0.8, 0.025, 0.1, 0.04])
button = Button(resetax, 'Reset', color=axcolor, hovercolor='0.975')


def reset(event):
    slmbda.reset()
button.on_clicked(reset)

plt.show()
