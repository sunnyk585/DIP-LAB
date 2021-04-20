clc; clear;close all;
% Delta Modulation
Delta_Modulation(100,1000)
function [y,MSE]=Delta_Modulation(del, A) %del=step size, A=amplitude of signal
T=0:2*pi/100:2*pi;
x=A*sin(T);
plot(x)
hold on
y=[0]; %y=output binary sequence
xr=0;
for i=1:length(x)-1
if xr(i)<=x(i)
d=1;
xr(i+1)=xr(i)+del;
else
d=0;
xr(i+1)=xr(i)-del;
end
y=[y d];
end
stairs(xr)
hold off
MSE=sum((x-xr).^2)/length(x)
end
