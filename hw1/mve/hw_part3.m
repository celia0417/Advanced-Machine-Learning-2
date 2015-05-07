% Weixin Wu
% Part 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Improvement solution

close all;

load('digits9')
new_digits9 = digits9;
X = reshape(digits9(1,:),2,70)';

opt.method='nonrigid'; % use nonrigid registration
opt.beta=2;            % the width of Gaussian kernel (smoothness)
opt.lambda=8;          % regularization weight

opt.viz=1;              % show every iteration
opt.outliers=0.1;       % use 0.1 noise weight
opt.fgt=0;              % do not use FGT (default)
opt.normalize=1;        % normalize to unit variance and zero mean before registering (default)
opt.corresp=1;          % compute correspondence vector at the end of registration (not being estimated by default)

opt.max_it=100;         % max number of iterations
opt.tol=1e-10;          % tolerance


for i=2:155
Y = reshape(digits9(i,:),2,70)';
[~, con] = cpd_register(X,Y, opt);
p = helper(con);
for j = 1:70
    new_digits9(i,2*p(j)-1:2*p(j)) = Y(j,:);
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

kernel_type =1; % kernel_type = 1; % 1 for linear; 2 for RBF
RBF_Sigma = 100;
X = new_digits9';

A = calculateAffinityMatrix(X, kernel_type, RBF_Sigma);
G = convertAffinityToDistance(A);

% parameters
k = 3;
tol = 0.99;
targetd = 2;
%caculate the fidelity of the eigen values
Keep_D = 2;             % keep the first D th eigen value

beta = linspace(0.1,0.9,9);
fidelity = zeros(1,9);
for i =1:9
    neighbors = calculateNeighborMatrix(G, k, 1);
    [Y, K, eigVals, mveScore] = mve2(A, neighbors, tol, targetd,beta(1,i));
    fidelity(1,i) = sum(eigVals(1:Keep_D,1))/sum(eigVals); 
end
plot(beta,fidelity);


