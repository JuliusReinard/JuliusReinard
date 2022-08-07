#nama: julius reinard
#NIM: 12318047

import numpy as np
import matplotlib.pyplot as plt
import math

#parameter dan variabel
x=np.arange(0,3,0.2)
m=np.array([1,2,3,4])
g=np.zeros([len(x),len(m)])
for i in range (0,len(x)):
    for j in range (0,len(m)):
        g[i,j]+=x[i]**j
d=np.dot(g,m)
d_noise=d+np.random.randn(len(d))*5

#plotting
plt.plot(x,d,label='nilai asli')
plt.scatter(x,d_noise,color='red',marker='*', label='noise')
plt.xlabel('X')
plt.ylabel('Y')
plt.legend()
plt.show()
