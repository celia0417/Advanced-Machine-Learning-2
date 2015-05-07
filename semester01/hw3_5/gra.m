function [w,curiter, w_updating1] = gra(w,prew,K,y, plot_step)

% gradient descent
maxiter =5000;
curiter = 0;
stepsize = 0.001;
tol = 0.001;
lambda = 1;
w_updating1 = [];
% N = size(K,1);

while norm(w-prew)>=tol
    if curiter>maxiter
        break;
    end    
    prew = w;
    G = gradient(K,y,w,lambda);
    w = w - stepsize*G;
    curiter = curiter +1 ;
    if mod(curiter, plot_step) == 0
        w_updating1 = [w_updating1, w];
    end
end
end