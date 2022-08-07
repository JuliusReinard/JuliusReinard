%Tugas 4 Inversi Geofisika
%Regresi Inversi Linear STD Konstan
%Billy Hansen 12318013

clear
clc

%Parameter model awal
x = (-2:0.02:3);
M = [-1 4 2 -3];
n = length(x);

%Pembuatan matriks kernel G & Perhitungan data regresi
G = [x.^3' x.^2' x' x.^0'];
d = G*M';
dNoise = d + randn(n,1)*0.5;
M_cal = inv(G'*G) * G' * dNoise;
d_cal = G*M_cal;

%Perhitungan error RMS
rms = sqrt(1/n*sum((dNoise-d_cal).^2));

%Perhitungan dengan Standar Deviasi
std = 1;
I = eye(n);
sigma = I*std;
Cd = sigma.^2;
A = inv(G'*G)*G';
Cm = A*Cd*A';