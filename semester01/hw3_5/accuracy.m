function [a, test_kernel] = accuracy(resultW,testX,testY,trainX,kap)

N = size(testX,1);
error=0;

% kx
dis = zeros(N,N);
for i = 1:N
    for j = 1:N
    dis(i,j) = (testX(i,:)-trainX(j,:))*(testX(i,:)-trainX(j,:))';
    end
end

test_kernel = exp(-dis/kap);

 ylabel=getY(resultW,test_kernel);

for i=1:N    
    if ylabel(i,1)~=testY(i,1)
        error=error+1;
    end
end

a=(N-error)/N;

end
