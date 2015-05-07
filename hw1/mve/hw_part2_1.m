% Machine Learning Assign 01 Part 2
% Weixin Wu

close all;

load 'digits9';
X = digits9';
clear digits9;

% organize the input X
N = size(X,1); % row 140
half_N = N/2;
D = length(X); % col 155
row_col = 28;
X_Reshape =  zeros(784,D);

for i = 1:D
    X_Coordinate = zeros(row_col,row_col);
    for j = 1 : N/2
        X_Coordinate(X(2*j-1,i)+1,X(2*j,i)+1)=1.0;
        X_Reshape(:,i) = reshape(X_Coordinate',784,1);
    end
end

k = 3;
targetd = 2;    % descrease the dimension to
tol = 0.99;

kernel_type = 3;   % 1 is linear, 2 is RBF, 3 for polynomial
parameter = 2;     % RBF_sigma for RBF kernel or power for polynomial kernel

A = calculateAffinityMatrix(X, kernel_type, parameter);

G = convertAffinityToDistance(A);
neighbors = calculateNeighborMatrix(G,k,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic solution without any improvement
fprintf('Running MVE...');
[Y, K, eigVals, mveScore] = mve(A, neighbors, tol, targetd);
%[Y, K, eigVals, mveScore] = mveyalmip(A, neighbors, numIts, targetd);
% plotEmbedding(Y, neighbors, 'MVE embedding' ,35)
plotEmbedding_forpart2(Y, neighbors, 'MVE embedding', 35, X_Reshape, 28, 28,3000)

disp(sprintf('Running MVU...'));
[Ymvu, K, mvuEigVals, mvuScore] = mvu(A, neighbors, targetd);
plotEmbedding_forpart2(Ymvu, neighbors, 'MVU embedding', 36, X_Reshape, 28, 28,3000)

disp(sprintf('Running KPCA...'));
[Ykpca, origEigs] = kpca(A);
plotEmbedding_forpart2(Ykpca, neighbors, 'KPCA embedding', 37, X_Reshape, 28, 28,800)

plotCompareEigSpectrums(origEigs, eigVals, 3);

%caculate the fidelity of the eigen values
Keep_D = 2;             % keep the first D th eigen value
KPCA_fidelity = sum(origEigs(1:Keep_D,1))/sum(origEigs)

MVE_fidelity = sum(eigVals(1:Keep_D,1))/sum(eigVals)

MVU_fidelity = sum(mvuEigVals(1:Keep_D,1))/sum(mvuEigVals)



