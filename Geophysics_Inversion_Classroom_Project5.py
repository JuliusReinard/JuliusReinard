#nama: julius reinard
#NIM: 12318047

import numpy as np
import matplotlib.pyplot as plt
import math

#parameter dan variabel
T= np.array([3,3,3,3,3,3,3,3,3,3])
T= T+ np.random.randn(len(T))
X=np.array([1,2,3,4,5,6,7,8,9,10])
#creating matrix
n=2
G=np.zeros([len(T),n])
for i in range 
#searching for d value
d=np.dot(g,rho)*10**5
d_noise=d+np.random.randn(len(d))*0.2
rhocalculate=np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(g),g)),np.transpose(g)),d_noise)*10**(-5)
print(rhocalculate)
d_noise=np.reshape(d_noise,[o,p])
d=np.reshape(d,[o,p])
f=0

#plotting
plt.contourf(x_grid,y_grid,d_noise)
plt.colorbar()
plt.show()
