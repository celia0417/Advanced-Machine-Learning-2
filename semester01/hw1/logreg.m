function [emprisk, classerror] = logreg (X,Y,model)
%
% Finds the Emprical Risk and Binary Classification Error
%
% X = input training data
% Y = output training data
% model = vector of logistic parameter coefficients
% emprisk = Empirical Risk
% classerror = Binary Classification Error
%

% find the Empirical risk

f = logequation (X,model);  % get the logistic risk
logf = log(f);
log_f = log(1-f);

% find the index for the log(f) and log(1-f)
% in order to elimite the NaN 

index = ~isnan(logf) & ~ isnan(log_f); 
logf2 = logf(index);
log_f2 = logf(index);
Y = Y(index);   % make the dimension of matix Y 
Y_ = Y-1;       % and Y-1 match the log(f) and log(1-f)
summary = sum(Y_.*log_f2-Y.*logf2);
emprisk = (1/length(X))*summary;

% plot logistical function 
f = logequation (X,model);  % logistic equation
classerror=0;  % count the classfication error
for i = 1:200
    if f(i,1)>=0.5;
        if Y (i,1)~=1
            classerror = classerror+1;
        end
        plot(X(i,1),X(i,2),'rx');
        hold on;
    else
        if Y (i:1)==1
            classerror = classerror+1;
        end
        plot(X(i,1),X(i,2),'co');
        hold on;
    end
end
title('2D X data');
xlabel('X(1) data');
ylabel('X(2) data');

% plot the linear decision boundary
a = model(1);
b = model(2);
c = model(3);
x = 0:1;
y = -(a*x+c)/b;
plot(x,y);
hold on;
legend('Y label 0','Y label 1');





