%julius reinard
%12318047
clear all 
r=250
zc=300
xc=500
yc=400
rho=3000
G=6.72*10.^(-11)

xi=0:100:1000
yi=0:100:1000
[X,Y]=meshgrid(xi,yi)
g=(G*(4/3*pi*r.^3*rho*zc)./(((X-xc).^2.*(Y-yc).^2+zc.^2).^(3/2)))*10.^5

contourf(X,Y,g)
xlabel('x(m)')
ylabel('y(m')
c=colorbar
c.Label.String='mgal'
