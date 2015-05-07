% Weixin Wu
% Part 2

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
[~, C] = cpd_register(X,Y, opt);
perm = constructPerm(C);
for j = 1:70
    new_digits9(i,2*perm(j)-1:2*perm(j)) = Y(j,:);
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kernel_type = 2; % 1 for linear; 2 for RBF
RBF_Sigma = 500;
X = new_digits9';

% organize the input X
N = size(X,1); % row 140
half_N = N/2;
D = length(X); % col 155
row_col = 28;
X_Reshape = zeros(784,D);

for i = 1:D
    X_Coordinate = zeros(row_col,row_col);
    for j = 1 : N/2
        X_Coordinate(X(2*j-1,i)+1,X(2*j,i)+1)=1.0;
        X_Reshape(:,i) = reshape(X_Coordinate',784,1);
    end
end

A = calculateAffinityMatrix(X_Reshape, kernel_type, RBF_Sigma);
G = convertAffinityToDistance(A);

% parameters
k = 3;
tol = 0.99;
targetd = 2;
neighbors = calculateNeighborMatrix(G, k, 1);
fprintf('Running MVE...');
[Y, K, eigVals, mveScore] = mve(A, neighbors, tol, targetd);
plotEmbedding_forpart2(Y, neighbors, 'MVE embedding' ,1,X_Reshape,28,28,0.2)

fprintf('Running MVU...');
[Ymvu, K, mvuEigVals, mvuScore] = mvu(A, neighbors, targetd);
plotEmbedding_forpart2(Ymvu, neighbors, 'MVU embedding' ,2,X_Reshape,28,28,0.15)

fprintf('Running KPCA...');
[Ykpca, origEigs] = kpca(A);
plotEmbedding_forpart2(Ykpca, neighbors, 'KPCA embedding' ,3,X_Reshape,28,28,0.025)

plotCompareEigSpectrums(origEigs, eigVals, 4);

%caculate the fidelity of the eigen values
Keep_D = 2;             % keep the first D th eigen value
KPCA_fidelity = sum(origEigs(1:Keep_D,1))/sum(origEigs)

MVE_fidelity = sum(eigVals(1:Keep_D,1))/sum(eigVals)

MVU_fidelity = sum(mvuEigVals(1:Keep_D,1))/sum(mvuEigVals)


