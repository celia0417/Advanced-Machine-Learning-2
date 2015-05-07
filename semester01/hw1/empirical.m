function J = empirical (K,y,w,lambda)

% N = size(K,1);

f = 1+exp(-y.*(K*w));
J = sum(log(f))+lambda*(w'*w);

end