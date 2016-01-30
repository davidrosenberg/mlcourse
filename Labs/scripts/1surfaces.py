from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import matplotlib.pyplot as plt
import numpy as np
# %matplotlib inline  # uncomment this for ipython notebook


#plot ||Ax - b||^2=y
fig = plt.figure()
ax = fig.gca(projection='3d')

#pick A diagonal
#first and second eigenvalues are random, have similar magnitude but opposite sign
diagonal = []
diagonal.append(np.random.normal(4,1,1))
diagonal.append(np.random.normal(-4,1,1))
b = np.random.normal(0,1,2)

X1 = np.arange(-5, 5, 0.25)
X2 = np.arange(-5, 5, 0.25)
X1, X2 = np.meshgrid(X1, X2)

# to see the contrast change the signs of this function to
# x1^2 - x2^2 and -x1^2 - x2^2
Y = ((diagonal[0]*X1-b[0])**2 + (diagonal[1]*X2-b[1])**2)
surf = ax.plot_surface(X1, X2, Y, rstride=1, cstride=1, cmap=cm.coolwarm,
                       linewidth=.0, antialiased=False)

ax.zaxis.set_major_locator(LinearLocator(10))
ax.zaxis.set_major_formatter(FormatStrFormatter('%.1f'))

fig.colorbar(surf, shrink=0.5, aspect=5)
fig.tight_layout()
#plt.savefig('localmin.pdf')
plt.show()