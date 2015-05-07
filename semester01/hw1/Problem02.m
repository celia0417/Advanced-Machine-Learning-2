% For Problem 02
% Finds a sinusoidal basis fit to the data
% k = the Sinusoidal basis
%
%  Call the function [err,model,errT] = sinreg(x,y,k,xT,yT)
%  According to the k, err and errT, to plot the functions
%  Acoording to the Cross-validation for Sinusoidal Fitting
%  Get the best choice for basis k
%

%load data and split them to half and half 
%set the x,y,xT,yT respectively
a=load('dataset1b.txt');
n=size(a);
halfN=n(1)/2;
x=a(1:halfN,1);
y=a(1:halfN,2);
xT=a(halfN+1:n(1),1);
yT=a(halfN+1:n(1),2);
errRes = [];
errTRes = [];

figure(1);

for k=10:30
  [err, model, errT] = sinreg(x,y,k,xT,yT);
  errRes = [errRes, err];
  errTRes = [errTRes, errT];
end;
figure(2); %set another figure for traning loss and testing loss
plot(10:30,log(errRes)); % use log to get the more precise value
hold on;
plot(10:30,log(errTRes),'r'); %use log to get the more precise value
hold on;
title('The Loss for Different K of Sinusoidal');
xlabel('k');
ylabel('log(Risk)');
legend('Training Loss','Testing Loss')

plot the training and testing loss for the best k





