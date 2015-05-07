function [k,kap] = kernel (x)

% calculate the kernel
N = size(x,1);
% dis = zeros(N,N);
% 
% for i = 1:N
%     for j = 1:N
%     dis(i,j) = (x(i,:)-x(j,:))*(x(i,:)-x(j,:))';
%     end
% end
% 
%     kap = 1/(N^2)*sum(sum(dis));
%     k = exp(-dis./kap);

k = x * x';
d = diag(k);
k = k - ones(N, 1) * d' / 2;
k = k - d * ones(1, N) / 2;
k = 2 * k;
kap = -sum(sum(k)) / (N * N);
k = k / kap;
k = exp(k);


end
