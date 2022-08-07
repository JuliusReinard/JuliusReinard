%julius reinard
%12318047
clear;
clc;

x0 = 40;
y0 = 80;
t0 = 0;
V = 4;
xi = [40 70 50 60];
yi = [60 50 70 40];
ti = [11.2 7.8 8.0 11.1];

m = [x0;y0];
error = 0;
maxi=10;
for j = 1:maxi
        figure(1)
        plot(m(1),m(2),'.')
        hold on
        for i = 1:length(xi)
            tcal(i) = t0 + (sqrt((xi(i) - m(1))^2+(yi(i) - m(2))^2)/V);
            J(i,1) = (m(1)-xi(i))./(V.*sqrt((m(1) - xi(i)).^2+(m(2) - yi(i)).^2));
            J(i,2) = (m(2)-yi(i))./(V.*sqrt((m(1) - xi(i)).^2+(m(2) - yi(i)).^2));
            dt(i) = ti(i) - tcal(i);
        end
        error(j)=sqrt(mean(dt.^2));
        dm=inv(J'*J)*J'*dt';
        m=dm+m;
end
p1 = plot(m(1),m(2),'ko','markersize',15)
p2 = plot(xi,yi,'rv','markerfacecolor','g')
stnum = 1:length(xi);
str="St-"+stnum+""
text(xi,yi,str,'HorizontalAlignment','left')
legend([p1 p2],{'Final Sol.','Station'})
hold off
xlabel('X')
ylabel('Y')
xlim([0 70])
ylim([0 70])

figure(2)
plot(error)
title('Error to iteration')
xlabel('Iterasi')
ylabel('Error')