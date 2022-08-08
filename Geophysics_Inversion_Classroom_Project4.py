#nama: julius reinard
#NIM: 12318047

import numpy as np
import matplotlib.pyplot as plt
import math

#parameter dan variabel
x0=np.array([200,400,600,800])
y0=np.array([300,400,500,600])
z0=np.array([150,300,450,600])
R=np.array([150,150,150,150])
rho=np.array([1000,5000,3000,4000])

x=np.arange(0,900,10)
y=np.arange(0,700,10)
[x_grid,y_grid]=np.meshgrid(x,y)
[o,p]=x_grid.shape
#creating g matrix

g=np.zeros([o*p,len(rho)])
f=0
for i in range (0,len(y))
    for j in range (0,len(x))
        f+=1
        for k in range (0,len(rho))
            g[f-1,k]+=6.674*(10**(-11))*((4/3)*np.pi*R[k]**3*z0[k])/(((x[j]-x0[k])**2+(y[i]-y0[k])**2)**(3/2))
#searching for d value
d=np.dot(g,rho)*10**5
d_noise=d+np.random.randn(len(d))*0,47
d_noise=d_noise.reshape(o,p)
d=d.reshape(o,p)
f=0

#plotting
plt.contourf(x_grid,y_grid,d_noise)
plt.colorbar()
plt.show()
