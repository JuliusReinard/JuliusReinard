%% Input Data & Parameter
clc
close all

%Lokasi Source dan Receiver
S.X = [0 0 0 0 0];
S.Y = [1 3 6 9 11];
R.X = [18 18 18 18 18];
R.Y = [1 3 6 9 11];

x0 = 0;
y0 = 0;
dx = 18;
dy4 = 4;
dy8 = 8;

Xgrid = [0;18]; 
Ygrid = [0;4;8;12];

[Mesh.X, Mesh.Y] = meshgrid(Xgrid,Ygrid);

Velocity = [1000; 5000; 3000];
VelocityPlot = [Velocity; Velocity(size(Velocity,1),:)];
VelocityPlot = [VelocityPlot VelocityPlot(:,size(VelocityPlot,2))];

%% Visualisasi
pcolor(Mesh.X,Mesh.Y,VelocityPlot)
set(gca,'Ydir','Reverse')
hold on
plot(S.X,S.Y,'*r')
hold on
plot(R.X,R.Y,'vb')
hold on
for i=1:length(S.X)
    for j=1:length(R.X)
        [X,Y] = raypath4(S.X(i),S.Y(i),R.X(j),R.Y(j),dy4,Velocity);
        plot(X,Y,'r')
        hold on
    end
end
for i=1:length(S.X)
    for j=1:length(R.X)
        [X,Y] = raypath8(S.X(i),S.Y(i),R.X(j),R.Y(j),dy8,Velocity);
        plot(X,Y,'r')
        hold on
    end
end
hold off
title('Ray Tracing')
xlabel('Distance')
ylabel('Depth')
colorbar

%% Fungsi Raypath
function [RayPathX,RayPathY] = raypath4(SX,SY,RX,RY,dy4,Velocity)
SdtDtg = 0:1:90;
BatasY = dy4;
ErrorMin = inf;
for i=1:length(SdtDtg)
    dxx = tan(deg2rad(SdtDtg(i)))*dy4;
    if SY > RY
    BatasX = SY - dxx;
    else
    BatasX = SY + dxx;
    end

SdtTrmsi = sin(deg2rad(SdtDtg(i)))*Velocity(2)/Velocity(1);
dyy = tan(SdtTrmsi)*dy4;

if SY > RY
    ReceiverTempY = SY - dyy;
    else
    ReceiverTempY = SY + dyy;
end

ErrorDist = sqrt((RX-RX)^2+(ReceiverTempY-RY)^2);

if ErrorDist<ErrorMin
    ErrorMin = ErrorDist;
    RayPathX = [SX BatasX RX];
    RayPathY = [SY BatasY RY];
end
end

end

%% Fungsi Raypath
function [RayPathX,RayPathY] = raypath8(SX,SY,RX,RY,dy8,Velocity)
SdtDtg = 0:1:90;
BatasY = dy8;
ErrorMin = inf;
for i=1:length(SdtDtg)
    dxx = tan(deg2rad(SdtDtg(i)))*dy8;
    if SY > RY
    BatasX = SY - dxx;
    else
    BatasX = SY + dxx;
    end

SdtTrmsi = sin(deg2rad(SdtDtg(i)))*Velocity(2)/Velocity(1);
dyy = tan(SdtTrmsi)*dy8;

if SY > RY
    RTempY = SY - dyy;
    else
    RTempY = SY + dyy;
end

ErrorDist = sqrt((RX-RX)^2+(RTempY-RY)^2);

if ErrorDist < ErrorMin
   ErrorMin = ErrorDist;
   RayPathX = [SX BatasX RX];
   RayPathY = [SY BatasY RY];
end
end

end
