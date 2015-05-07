function [w1,curiter1,w2,curiter2, w_updating1, w_updating2] = stochastic(w,prew,K,trainY, plot_step)

% stochastic descent
maxiter = 50000;
curiter1 = 0;
curiter2 = 0;
stepsize = 0.001;
tol = 0.0001;
lambda=1;
n = size(K,1);
w_updating1 = [];
w_updating2 = [];

 



w1=w;
prew1=prew;
while norm(w1-prew1)>=tol
    if curiter1>maxiter
        break;
    end    
    prew1 = w1;
    
    % pick up 100 data
    dataindex = randperm(n)';
    trainingindex = dataindex(1:100,1);
    hunK = K(:, trainingindex);
    hunY = trainY(trainingindex,1);
    
    % compute gradient and update w
    G = gradient2(hunK,hunY,w1,lambda);
    w1 = w1 - stepsize*G;
    curiter1 = curiter1 +1 ;
    if mod(curiter1, plot_step) == 0
        w_updating1 = [w_updating1, w1];
    end
end



w2=w;
prew2=prew;
while norm(w2-prew2)>=tol
    if curiter2>maxiter
        break;
    end    
    prew2 = w2;
    
    % pick up 1 
    dataindex = randperm(n)';
    trainingindex = dataindex(1,1);
    oneK = K(:, trainingindex);
    oneY = trainY(trainingindex,1);
    
    % compute gradient and update w
    G = gradient2(oneK,oneY,w2,lambda);
    w2 = w2 - stepsize*G;
    curiter2 = curiter2 +1 ;
    if mod(curiter2, plot_step) == 0
        w_updating2 = [w_updating2, w2];
    end
end

end



