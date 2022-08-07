close all
clear all

% before rotation
Sxx = 2 %normal stress xx MPa
Syy = 3 %normal stress yy MPa
Sxy = 4 %shear stress xy MPa

n = 181;
dsudut = 1;
sudut = zeros(n,1);
Sxx_new = zeros(n,1);
Syy_new = zeros(n,1);
Sxy_new = zeros(n,1);

for i = 1:n
    sudut(i) = (i-1)*dsudut;

% after rotation (i = sudut)
Sxx_new(i) = 0.5*(Sxx + Syy) + 0.5*(Sxx - Syy)*(cos((2*i)*pi/180)) + Sxy*(sin((2*i)*pi/180));
Syy_new(i) = 0.5*(Sxx + Syy) - 0.5*(Sxx - Syy)*(cos((2*i)*pi/180)) - Sxy*(sin((2*i)*pi/180));
Sxy_new(i) = -0.5*(Sxx - Syy)*(sin((2*i)*pi/180)) + Sxy*(cos((2*i)*pi/180));

end

figure(1)% Untuk mem-plotting grafik theta sumbu x baru, sumbu y baru dan sumbu xy baru 
scatter (sudut,Sxx_new,'g')% untuk plot titik scatter 
hold on % untuk menampilkan plotting x dan y bersama
scatter (sudut,Syy_new,'m') 
scatter (sudut,Sxy_new,'b')
xlabel('Teta (derajat)') % keterangan sumbu x
ylabel('Rotasi Stress') % keterangan sumbu y 
legend('Rotasi Sumbu x','Rotasi Sumbu y','Rotasi Sumbu xy') % legenda grafik
grid on %  menampilkan grid dari ploting 
figure(2) %untuk mem-plotting perubahan stress dari sumbu x dan y 
scatter (Sxx_new,Syy_new,'m')
xlabel('Stess Sumbu x')%  keterangan sumbu x
ylabel('Stress SUmbu Y')% keterangan sumbu y
grid on ;% perintah untuk menampilkan grid dari ploting 

Sxy_newabs = abs(Sxy_new);
indeks = zeros(n,1);
for i = 1:n
    if round(Sxy_newabs(i),4) == round(min(Sxy_newabs),4);
        indeks(i) = 9;
%         i
%         Sxy_newabs(i)
    end
end

Sxx_newround = round(Sxx_new,4); 
[Mmax,Imax] = max(Sxx_newround)
[Mmin,Imin] = min(Sxx_newround)
Syy_newround = round(Syy_new,4);

save('matriks.mat','indeks')