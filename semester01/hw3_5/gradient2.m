function g =  gradient2(K,y,w,lambda)

% N = size(K,2);
% 
% yk = K;
% for i = 1:N
%     yk(:,i) = yk(:,i)*y(i);
% end
% 
% f = (1+exp(y.*(K'*w)))*ones(1,1000);
% 
% g = -sum(yk./f',2) + 2*lambda*w;


n = size(K, 2);
g = K * diag(y) * (sigma(diag(w' * K) * y) - ones(n, 1)) + 2 * lambda * w;


end
