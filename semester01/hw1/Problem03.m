%
% Finds the Emprical Risk and Binary Classification Error
%
% orimodel = initialization of vector of logistic parameter coefficients
% n = step size
% E = tolerence
% count = the number of iterations needed for n and E.
% emprisk = Empirical Risk
% classerror = Binary Classification Error
%

% load dataset2, get training data X,Y
load('dataset2.mat');

orimodel=zeros(3,1);
n=1;
% choose different E to get different iterations, Emprical Risk and
% Classification Error
for i=1:10
    E=2^-i;
    disp(E);
    [ model,count ] = gradientdescent ( X, Y, orimodel, n, E);
fprintf('The number of iterations needed: %f\n',count);
disp(model);

    [ emprisk, classerror] = logreg (X,Y,model);
fprintf('Emprical Risk is: %f\n', emprisk);
fprintf('Binary Classification Error is: %f\n\n', classerror);

end

