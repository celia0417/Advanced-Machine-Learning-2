function [err,model,errT] = sinreg(x,y,k,xT,yT)
%
% Finds a basis k Sinusoidal fit to the data
%
%    function [err,model,errT] = sinreg(x,y,k,xT,yT)
%
% x = vector of input scalars for training
% y = vector of output scalars for training
% k = the Sinusoidal basis
% xT = vector of input scalars for testing
% yT = vector of output scalars for testing
% err = average squared loss on training
% model = vector of polynomial parameter coefficients
% errT = average squared loss on testing
%
%

xx = zeros(length(x),k);
for i=1:k
  xx(:,i) = sin(i*x)+cos(i*x);
end
model = pinv(xx)*y;
err   = (1/(2*length(x)))*sum((y-xx*model).^2);

if (nargin==5)
  xxT = zeros(length(xT),k);
  for i=1:k
    xxT(:,i) = sin(i*xT)+cos(i*xT);
  end
  errT  = (1/(2*length(xT)))*sum((yT-xxT*model).^2);
end

q  = (min(x):(max(x)/300):max(x))';
qq = zeros(length(q),k);
for i=1:k
  qq(:,i) = sin(i*q)+cos(i*q);
end

clf
plot(x,y,'X');
hold on
if (nargin==5)
plot(xT,yT,'cO');
end
plot(q,qq*model,'r')
title('Sinusoidal function Fitting');
xlabel('x');
ylabel('f(x;model)');

