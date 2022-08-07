%%julius reinard
%%12318047

%%soal no.1
clear all
dat = readmatrix('uts.txt')
d = dat(:,2)
x1 = dat(:,1)

G = 6.674 * 10^-11;
conts = G*(4/3)*pi;
x = [200 400 500 600 900];
z = [200 200 100 500 100];
R = 100;
x_titik = x1
for i = 1 : length(x_titik) %iterasi banyak data
    for k = 1 : 5 %iterasi banyak bola
        grav(i,k) = (conts*R.^3.*z(k)/(((x_titik(i)-x(k)).^2+z(k).^2).^(3/2))).*10^5;
    end
end
m = inv(grav'*grav)*grav'*d
dcal = grav*m;
%1
delta_d = d - dcal;
m %rho
ERMS = sqrt(mean(delta_d.^2));
ERMS

