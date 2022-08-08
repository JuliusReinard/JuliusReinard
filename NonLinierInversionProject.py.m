%%julius reinard
%%12318047

clear all
clc

xp = (0:50:1000);
nsta = length(xp);
x0 = 600;
z0 = 300;
R = 100;
rho = 3500;
G = 6.674*10^-11;

for i = 1:nsta
    gs = 0;
    gs = gs + G * (4/3*pi*R.^3*z0*rho)/(((xp(i)-x0).^2+z0.^2).^(3/2))*10.^5;
    g(i) = gs;
end

g = g';
gobs = g + 0.3.*randn(nsta,1);

plot(xp,gobs, '.b', 'markersize', 20);
title('nilai observsi gravitasi');
xlabel('x');
ylabel('gravity (mGal)');

iterasi = 1; eps=1;
while eps >= 0.1
    if iterasi == 1
        xmodel = 100;
        zmodel = 100;
    else
        xmodel = x_pert;
        zmodel = z_pert;
    end
    
    %data gcal
    gcal = zeros(length(xp), 1);
    for i = 1:length(xp)
        gcal(i) = G * (4/3*pi*R.^3 * zmodel * rho) / (((xp(i)-xmodel).^2 + (zmodel).^2).^(3/2)).*10.^5
    end
    
    %misfit
    dgmisfit = gobs - gcal;
    eps = mean(abs(dgmisfit));
    eplot(iterasi) = eps;
    
   %matrix jacobi
        for i = 1:length(xp)
            turunan_x(i) = (G*4/3*pi*R.^3*rho) * (3*zmodel*(xp(i)-xmodel)) * 10.^5/(((xp(i)-xmodel).^2+(zmodel.^2)).^(5/2));
            turunan_z(i)= (G*4/3*pi*R.^3*rho) * (zmodel+xp(i).^2-2*xp(i) * xmodel-2*zmodel.^2+xmodel)*10.^5/(((xp(i)-xmodel).^2+zmodel.^2).^(5/2));
        end
        
        J = ones(length(xp), 2);
        J(:,1) = turunan_x';
        J(:,2) = turunan_z';
        
        %menghitung perturbasi model
        dmperturbasi = inv(J' * J) * J' * dgmisfit;
        xpertu = xmodel + dmperturbasi(1);
        zpertu = zmodel + dmperturbasi(2);

end
