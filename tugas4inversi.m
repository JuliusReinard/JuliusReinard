%julius reinard
%12318047
%Tugas 4 Inversi Geofisika

clear all
clc

%Parameter model awal
x = (-2:0.04:3);
M = [-3 5 7 -1];
n = length(x);

%matriks kernel
G = [x.^3' x.^2' x' x.^0'];
d = G*M';
dNoise = d + randn(n,1)*0.2;
Mcal = inv(G'*G) * G' * dNoise;
dcal = G*Mcal;

%Perhitungan error RMS
rms = sqrt(1/n*sum((dNoise-dcal).^2));

%Perhitungan dengan Standar Deviasi
std = 1;
I = eye(n);
sigma = I*std;
Cd = sigma.^2;
A = inv(G'*G)*G';
Cm = A*Cd*A';
Cm