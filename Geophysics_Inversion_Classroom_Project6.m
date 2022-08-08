close all
clear all

% before rotation
Sxx = 2 %normal stress xx MPa
Syy = 3 %normal stress yy MPa
Sxy = 4 %shear stress xy MPa
theta = [0:5:180] %maksud dari perintah di samping adalah dimulai dari 0 derajat, setiap 5 derajat, sampai 180 derajat 

% after rotation (theta degree)
Sxx_new = 0.5*(Sxx + Syy) + 0.5*(Sxx - Syy)*(cos((2*theta)*pi/180)) + Sxy*(sin((2*theta)*pi/180))
Syy_new = 0.5*(Sxx + Syy) - 0.5*(Sxx - Syy)*(cos((2*theta)*pi/180)) - Sxy*(sin((2*theta)*pi/180))
Sxy_new = -0.5*(Sxx - Syy)*(sin((2*theta)*pi/180)) + Sxy*(cos((2*theta)*pi/180))

figure(1)% untuk memploting normal stress, shear stress terhadap sudut 
scatter (theta,Sxx_new,'r')% grafik titik untuk menunjukan perubahan setiap 5 derajat. 
hold on % perintah untuk bisa menampilkan plotting titik sumbu y dan xy juga secara bersamaan dalam satu grafik yang sama dengan sumbu x
scatter (theta,Syy_new,'m')  
scatter (theta,Sxy_new,'g')
xlabel('theta(degree)') % keterangan dari sumbu x
ylabel('stress rotation') % keterangan dari sumbu y 
legend('Sxx rotation','Syy rotation','Sxy rotation') % untuk menampilkan legenda dari grafik
grid on %menampilkan grid dari ploting 
figure(2) % Grafik untuk mem-plotting perubahan stress dari sumbu x dan y 
scatter (Sxx_new,Syy_new,'b')
xlabel('Sxx stress')%keterangan dari sumbu x
ylabel('Syy stress')% keterangan dari sumbu y
grid on % perintah untuk menampilkan grid dari ploting
