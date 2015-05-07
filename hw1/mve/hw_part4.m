% part 04 Weixin Wu

close all;
load('data_batch_1')

image = zeros(100,3072);
count =0;
temp=0;
for i=1:10000
    if labels(i)==2
        count=count+1;
        image(count,:)=data(i,:);
        if count==100
            temp=1;
            break;
        end
        if temp==1
            break;
        end
    end
end

X = image';

k = 2;                       
targetd = 2;
tol = 0.99;

kernel_type = 2;   % 1 is linear, 2 is RBF
RBF_sigma = 100;   

A = calculateAffinityMatrix(X, kernel_type, RBF_sigma);   

G = convertAffinityToDistance(A);
neighbors = calculateNeighborMatrix(G,k,1);

fprintf('Running MVE...');
[Y, K, eigVals, mveScore] = mve(A, neighbors, tol, targetd);
%[Y, K, eigVals, mveScore] = mveyalmip(A, neighbors, numIts, targetd);
% plotEmbedding(Y, neighbors, 'MVE embedding' ,35)
plotEmbedding_forpart4(Y, neighbors, 'MVE embedding', 35, X, 32, 32,0.08)

disp(sprintf('Running MVU...'));
[Ymvu, K, mvuEigVals, mvuScore] = mvu(A, neighbors, targetd);
plotEmbedding_forpart4(Ymvu, neighbors, 'MVU embedding' ,36,X,32,32,900)

disp(sprintf('Running KPCA...'));
[Ykpca, origEigs] = kpca(A);
plotEmbedding_forpart4(Ykpca, neighbors, 'KPCA embedding' ,37,X,32,32,600)

plotCompareEigSpectrums(origEigs, eigVals, 3);

%caculate the fidelity of the eigen values
Keep_D = 2;             % keep the first D th eigen value
KPCA_fidelity = sum(origEigs(1:Keep_D,1))/sum(origEigs)

MVE_fidelity = sum(eigVals(1:Keep_D,1))/sum(eigVals)

MVU_fidelity = sum(mvuEigVals(1:Keep_D,1))/sum(mvuEigVals)



        
        
