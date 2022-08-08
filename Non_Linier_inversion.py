#julius reinard
#12318047

import numpy as np
import matplotlib.pyplot as plt

#input parameter
Xi = np.arange(0,1500,50)
Xc = 750
Zc = 300
G = 6.674*(10**(-11))
R = 100
rho = 1500
dobs = np.zeros(len(Xi))
for i in range(len(Xi)):
    dobs[i] = G*((4/3)*np.pi*(R**3)*rho*Zc)/(((Xi[i]-Xc)**2+(Zc)**2)**(3/2))*10**5
dobs = dobs + np.random.randn(len(dobs))*0.04

#Model Awal
iterasi = 1
mat_iterasi = []
Erms = 1
mat_Erms = []
X_model_awal = 200
Z_model_awal = 150

#inversi non-linier
while Erms >=0.05:
    if iterasi == 1:
        X_model = X_model_awal
        Z_model = Z_model_awal
    elif iterasi == 1000:
        break
    else :
        X_model = X_Koreksi
        Z_model = Z_Koreksi
    mat_iterasi.append(iterasi)
    dcal = np.zeros(len(Xi))
    for i in range(len(dcal)):
        dcal[i] = G*(4/3)*np.pi*(R**3)*rho*Z_model/(((Xi[i]-X_model)**2+(Z_model)**2)**(3/2))*10**5
    misfit = dobs-dcal
    Erms = np.sqrt(1/(len(dobs))*sum((misfit)**2))
    #matriks jacobi
    J = np.zeros((len(dcal),2))
    for i in range(len(dcal)):
        J[i,0] = G*(4/3)*np.pi*(R**3)*rho*(3*Z_model*(Xi[i]-X_model))*10**5/(((Xi[i]-X_model)**2+Z_model**2)**(5/2))
        J[i,1] = G*(4/3)*np.pi*(R**3)*rho*(Z_model+Xi[i]**2-2*Xi[i]*X_model-2*Z_model**2+X_model**2)*10**5/(((Xi[i]-X_model)**2+Z_model**2)**(5/2))
    #Delta M
    deltaM = np.dot(np.dot(np.linalg.inv(np.dot(np.transpose(J),J)),np.transpose(J)),misfit)
    #X dan Z model baru
    X_Koreksi = X_model+deltaM[0]
    Z_Koreksi = Z_model+deltaM[1]
    iterasi+=1
    mat_Erms.append(Erms)
    print("X model =",X_model,"Z model = ",Z_model,"Erms = ",Erms)

#plotting grafik
plt.scatter(Xi,dobs,label='Data sintetik',color='g')
plt.plot(Xi,dcal,label='Hasil Inversi Non-Linier')
plt.title('Hasil Inversi non-linier')
plt.xlabel('X (m)')
plt.ylabel('gz (mgal)')
plt.plot(mat_iterasi,mat_Erms)
plt.xlabel("Iterasi")
plt.ylabel("Erms")
plt.title("Grafik Misfit Iterasi")
plt.show()







