function [ z ] = sigma( x )
%SIGMA Summary of this function goes here
%   Detailed explanation goes here

z = 1 ./ (1 + exp(-x));

end

