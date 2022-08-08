clear all
close all

n = 181;
dsudut = 1;

x = rand(n,1);
y = rand(n,1);

azi = zeros(n,1);
u = zeros(n,1);
v = zeros(n,1);

w = rand(n,1);
for i = 1:n
    azi(i)=i*dsudut;
    u(i)=w(i)*(sin(azi(i)*pi/180)); % delta x
    v(i)=w(i)*(cos(azi(i)*pi/180)); % delta y
end

figure(1)

quiver(x,y,u,v,"-ob")
hold on 
quiver(x,y,-u,-v,"-ob")
xlim([-0.1 1.1])
ylim([-0.1,1.1])
xlabel('x')
ylabel('y')
grid on

load ('matriks.mat')

u2 = zeros(n,1);
v2 = zeros(n,1);

for i = 1:n
    if indeks(i) == 9
        u2(i)=w(i)*(sin(azi(i)*pi/180)); % delta x
        v2(i)=w(i)*(cos(azi(i)*pi/180)); % delta y
        azi(i);
    end
end

hold on
quiver(x,y,u2,v2,".-r") %'AutoScale','off'
hold on
quiver(x,y,-u2,-v2,".-r")
xlim([-0.1 1.1])
ylim([-0.1 1.1])
xlabel('x')
ylabel('y')
grid on
