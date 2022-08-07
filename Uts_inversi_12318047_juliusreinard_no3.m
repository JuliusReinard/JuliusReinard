%julius reinard
%12318047
%soal no.3

clear all;
clc;

%import data dan pendefinisian parameter

data = importdata('uts.txt');
x = data(:,1);
gz = data(:,2);

G = 6.674 * 10^-11; %nilai G dan konversi satuan
const = G*(4/3)*pi; %konstanta fungsi rho
x0 = [200 400 500 600 900];
z0 = [200 200 100 500 100];
R = 100;

%perhitungan respon forward modelling
for i = 1 : length(x)   %iterasi banyak data
    for k = 1 : 5       %iterasi banyak bola
        g(i,k) = ((const*R.^3.*z0(k)/(((x(i)-x0(k)).^2+z0(k).^2).^(3/2))).*10^5)^-1;
    end
end

%pembobotan
std = [];
len = length(gz);

for i = 1:len
    std(i) = 0.3;
end
a = diag(std.^2);

%proses inversi
d = gz       %rho
m = inv(g'*g)*g'*d;
dcal = g*m;

A   = (inv(g'*g)*g');
dltam = sqrt(diag(A*a*A'));

dcalp = g*(m + dltam);
dcalm = g*(m - dltam);

%PENJELASAN HASIL