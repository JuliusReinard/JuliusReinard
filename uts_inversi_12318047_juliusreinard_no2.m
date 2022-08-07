%julius reinard
%12318047
%soal no.2

clear all;
clc;

data = importdata('uts.txt');
x = data(:, 1);
g = data(:, 2);
G = 6.674 * 10^-11;
const = G * (4/3) * pi; 
x0 = [200 400 500 600 900];
z0 = [200 200 100 500 100];
R = 100;
std = 0.3;

%perhitungan respon forward modelling
for i = 1 : length(x)   
    for k = 1 : 5      
        g(i,k) = ((const * R.^3. *z0(k) / (((x(i)-x0(k)).^2 + z0(k).^2).^(3/2))).*10^5)^-1;
    end
end

sigm = [ ];
len = length(g);

for i = 1:len
    sigm(i) = 0.3;
end

We = [ ];
for i = 1:len
   for j = 1:len
       if i == j
           We(i,j) = sigm(i);
       else
           We(i,j) = 0;
       end 
   end
end

We(9, 9) = 0; %outlier 400m diberi bobot 0

d = g;
m = inv(g' * g) * (g' * d)
dcal = g * m;

mweight =inv(g' * We * g) * (g'* We * d)
dweight = g * mweight

delta_d = d - dweight
ERMS = sqrt(mean(delta_d.^2))

%Ploting 
subplot(2,1,1)
hold on
plot(x, d, '*m');
plot(x, dcal, '*m');
plot(x, dweight, 'g');
title('model gravitasi dua dimensi');
xlabel('distance (m)')
ylabel('gravitasi (mGal)')
legend('hasil forward modelling','hasil invers modeling')
grid on
hold off