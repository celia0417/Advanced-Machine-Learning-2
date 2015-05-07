function problem5

close all;
load('data1.mat');
tol = 0.001;
w = rand(size(TestX,1),1);
prew = w + 2*tol;
lambda=1;

% N = size(TestX,1);
% D = size(TestX,2);


[K, kap] = kernel (TrainingX);
[w2,curiter2,w3,curiter3, w_updating2, w_updating3] = stochastic(w,prew,K,TrainingY, 1);
[w1,curiter1, w_updating1] = gra(w,prew,K,TrainingY, 1);

% 
% for i=1:20
%     [w1,curiter1] = gra(w,prew,K,y);
% [w2,curiter2,w3,curiter3] = stochastic(w,prew,K,TrainingY);
% end

x_num = min([size(w_updating1, 2), size(w_updating2, 2), size(w_updating3, 2)]);
x_axis = 1 : x_num;

acurracy_updating1 = zeros(1, x_num);
acurracy_updating2 = acurracy_updating1;
acurracy_updating3 = acurracy_updating1;


J_updating1 = zeros(1, x_num);
J_updating2 = J_updating1;
J_updating3 = J_updating1;


% for i = 1 : x_num
%     [acurracy_updating1(i), test_kernel] = accuracy(w_updating1(:,i),TestX,TestY,TrainingX,kap);
%     [acurracy_updating2(i), ] = accuracy(w_updating2(:,i),TestX,TestY,TrainingX,kap);
%     [acurracy_updating3(i), ] = accuracy(w_updating3(:,i),TestX,TestY,TrainingX,kap);
% end

[acurracy1, test_kernel] = accuracy(w1,TestX,TestY,TrainingX,kap);
[acurracy2, ] = accuracy(w2,TestX,TestY,TrainingX,kap);
[acurracy3, ] = accuracy(w3,TestX,TestY,TrainingX,kap);
disp([acurracy1,acurracy2,acurracy3]);

for i = 1 : x_num
    J_updating1(i) = empirical (test_kernel,TestY,w_updating1(:, i),lambda);
    J_updating2(i) = empirical (test_kernel,TestY,w_updating2(:, i),lambda);
    J_updating3(i) = empirical (test_kernel,TestY,w_updating3(:, i),lambda);
end


% plot(x_axis, acurracy_updating1);
% hold;
% plot(x_axis, acurracy_updating2);
% hold;
% plot(x_axis, acurracy_updating3);
% hold;


plot(x_axis, J_updating1);
hold;
plot(x_axis, J_updating2);
hold;
plot(x_axis, J_updating3);
hold;


   