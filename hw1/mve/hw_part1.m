% Part 1 Weixin Wu

load(('teapots100.mat'));
X = teapots;
clear teapots

k = 3;                       
targetd = 2;
tol = 0.99;

kernel_type = 1;   % 1 is linear, 2 is RBF
RBF_sigma = 5;

A = calculateAffinityMatrix(X, kernel_type, RBF_sigma);   

G = convertAffinityToDistance(A);
neighbors = calculateNeighborMatrix(G,k,1);

fprintf('Running MVE...');
[Y, K, eigVals, mveScore] = mve(A, neighbors, tol, targetd);
%[Y, K, eigVals, mveScore] = mveyalmip(A, neighbors, numIts, targetd);
% plotEmbedding(Y, neighbors, 'MVE embedding' ,35)
plotEmbedding_forpart1(Y, neighbors, 'MVE embedding', 35, X, 76, 101,3000)

disp(sprintf('Running MVU...'));
[Ymvu, K, mvuEigVals, mvuScore] = mvu(A, neighbors, targetd);
plotEmbedding_forpart1(Ymvu, neighbors, 'MVU embedding' ,36,X,76,101,3000)

disp(sprintf('Running KPCA...'));
[Ykpca, origEigs] = kpca(A);
plotEmbedding_forpart1(Ykpca, neighbors, 'KPCA embedding' ,37,X,76,101,1000)

plotCompareEigSpectrums(origEigs, eigVals, 3);

%caculate the fidelity of the eigen values
Keep_D = 2;             % keep the first D th eigen value
KPCA_fidelity = sum(origEigs(1:Keep_D,1))/sum(origEigs)

MVE_fidelity = sum(eigVals(1:Keep_D,1))/sum(eigVals)

MVU_fidelity = sum(mvuEigVals(1:Keep_D,1))/sum(mvuEigVals)

