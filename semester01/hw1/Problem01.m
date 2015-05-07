% For Problem 01
% Finds a D-1 order polynomial fit to the data
%
% D - 1= order for the polynomial
%
%  Call the function [err,model,errT] = polyreg(x,y,D,xT,yT)
%  According to the D, err and errT, to plot the functions
%  Acoording to the Cross-validation for Polynomial Fitting
%  Get the best choice of order 
%

%load data and split them to half and half 
%set the x,y,xT,yT respectively

a=load('dataset1a.txt');
n=size(a);
halfN=n(1)/2;
x=a(1:halfN,1);
y=a(1:halfN,2);
xT=a(halfN+1:n(1),1);
yT=a(halfN+1:n(1),2);
errRes = [];
errTRes = [];
figure(1);

% plot the order 4-14
for D=5:15
  [err, model, errT] = polyreg(x,y,D,xT,yT);
  errRes = [errRes, err];
  errTRes = [errTRes, errT];
  disp(model);
end;

%set another figure for traning loss and testing loss for oder 4-14
figure(2); 
plot(4:14,errRes);
hold on;
plot(4:14,errTRes,'r');
hold on;
title('The Loss for Different Order of Polynomial');
xlabel('Order');
ylabel('Risk');
legend('Training Loss','Testing Loss')

