%julius reinard
%1231847

clear all;
clc;

xc = 600;
zc = 600;
y0 = 0;
R = 300;
rho = 8000;
x1 = 0:50:2000;
y1 = 0
z1 = 0:50:1000;
G = 6.674 * 10^-11;
[X Y] = meshgrid(x1,z1);

%forward modelling
for i = 1:length(x1)
    gs = 0;
    gs = gs+G*(4/3*pi*R.^3*zc*rho)/(((x1(i)-xc).^2)+((z1(i)-(zc).^2)).^(3/2)).*10.^5;
    g(i) = gs;
end

g = g';
g_obs = g + 0.1.*randn(length(x1),1);

figure(1)
plot(xl,gobs,'.m','markersize',15);
title('Nilai Gravitasi Hasil Observasi');
xlabel('Jarak (m)');
ylabel('Anomali Gravitasi (mGal)');