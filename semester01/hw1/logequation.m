function [ f ] = logequation ( X, model)
%
% The equation for logistic regression 
%
% X = input training data
% model = vector of logistic parameter coefficients
%
f = (1 + exp( -X * model)).^-1;