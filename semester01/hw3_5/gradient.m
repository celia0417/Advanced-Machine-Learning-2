function g =  gradient(K,y,w,lambda)

N = size(K,1);
% D  = size(k,2)

yk = K;
for i = 1:N
    yk(:,i) = yk(:,i)*y(i);
end

f = (1+exp(y.*(K*w)))*ones(1,N);
g = -sum(yk./f,2) + 2*lambda*w;


end

