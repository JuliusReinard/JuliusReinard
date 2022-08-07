close all
clc

n = 181;
s1 = 150;
s3 = 20;
h = 0.5*(s1+s3);
j = 0.5*(s1-s3);

r = rand(n,1);
s = rand(n,1);

Sigma = zeros(n,1);
Tau = zeros(n,1);
strike = zeros(n,1)
theta = zeros(n,1);5
t = rand(n,1);

for z = 1:n
    theta(z) = z-1;
    Sigma(z) = t(z)*(h + j*(cos(2*theta(z)*pi/180)));
    Tau(z) = t(z)*(j*(sin(2*theta(z)*pi/180)));
    strike(z) = 90-theta(z);
end

figure(1)
quiver(r,s,Sigma,Tau,'-ok')
hold on
quiver(r,s,-Sigma,-Tau,'-ok')
xlim([-0.1 1.1])
ylim([-0.1 1.1])
grid on
hold on

figure(2)
quiver(r,s,Sigma,Tau,'-ok')
hold on
quiver(r,s,-Sigma,-Tau,'-ok')
xlim([-0.1 1.1])
ylim([-0.1 1.1])
grid on
hold on

rasio = zeros(n,1)
for z = 1:n
      rasio(z) = Tau(z)/Sigma(z);
      
end
R = rasio
sort(rasio)

Rasio = abs(rasio);
indeks = zeros(n,1);
for z = 1:n
    if rasio(z) > 0.5324 
        indeks(z) = 1;
    end
end

Sigma2 = zeros(n,1);
Tau2 = zeros(n,1);
for z = 1:n
    if indeks(z) == 1       
        Sigma2(z) = t(z)*(h + j*(cos(2*theta(z)*pi/180)));
        Tau2(z) = t(z)*(j*(sin(2*theta(z)*pi/180)));
        theta(z);
    end
end
quiver(r,s,Sigma2,Tau2,'.-g')
hold on
quiver(r,s,-Sigma2,-Tau2,'.-g')
xlim([-0.1 1.1])
ylim([-0.1 1.1])
grid on
hold on

for z = 1:n
    theta(z) = z-1;
    Sigma(z) = (h + j*(cos(2*theta(z)*pi/180)));
    Tau(z) = (j*(sin(2*theta(z)*pi/180)));
end

for z = 1:n
    if indeks(z) == 1       
        Sigma2(z) = (h + j*(cos(2*theta(z)*pi/180)));
        Tau2(z) = (j*(sin(2*theta(z)*pi/180)));
        theta(z);
    end
end
figure(3)
plot(Sigma,Tau,'m')
xlim([0 200])
ylim([-80 80])
hold on
plot(Sigma2,Tau2,'ob')
hold on
grid on
filename = 'datastress.xlsx'
no = zeros(181,1)
for i = 1:181
    no(i) = i
end
writematrix('No',filename,'Sheet',1,'Range','A1')
writematrix('Theta',filename,'Sheet',1,'Range','B1')
writematrix('Strike',filename,'Sheet',1,'Range','C1')
writematrix('Normal stress MPa',filename,'Sheet',1,'Range','G1')
writematrix('Shear stress MPa',filename,'Sheet',1,'Range','F1')
writematrix('Rasio',filename,'Sheet',1,'Range','D1')
writematrix(no,filename,'Sheet',1,'Range','A2')
writematrix(theta,filename,'Sheet',1,'Range','B2')
writematrix(strike,filename,'Sheet',1,'Range','C2')
writematrix(Sigma,filename,'Sheet',1,'Range','D2')
writematrix(Tau,filename,'Sheet',1,'Range','E2')
writematrix(R,filename,'Sheet',1,'Range','F2')