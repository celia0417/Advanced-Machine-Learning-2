function ylabel = getY(w,testX)

N = size(testX,1);

ylabel = ones(N,1);

for i=1:N
    kx = testX(i,:);
    p = 1/(1+exp(-w'*kx'));
    
    if p > 0.5
        ylabel(i,1)=1;
    else
        ylabel(i,1)=-1;
    end
    
end

end

