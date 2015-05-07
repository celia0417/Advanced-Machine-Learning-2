
% plot figure

% plot batch
ll = load('batch/07_b_64v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll2 = load('batch/07_b_128v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll3 = load('batch/07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll4 = load('batch/07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll5 = load('batch/07_b_1024v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll6 = load('batch/07_b_2048v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');

ll7 = load('batch/07_b_64v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll8 = load('batch/07_b_128v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll9 = load('batch/07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll10 = load('batch/07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll11 = load('batch/07_b_1024v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll12 = load('batch/07_b_2048v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');

plot(ll(:,4),ll(:,1),'-.*r');
hold();
plot(ll2(:,4),ll2(:,1),'-.b');
plot(ll3(:,4),ll3(:,1),'-.k');
plot(ll4(:,4),ll4(:,1),'-.m');
plot(ll5(:,4),ll5(:,1),'-.g');
plot(ll6(:,4),ll6(:,1),'-.y');
plot(ll7(:,4),ll7(:,1),'-.g');
plot(ll8(:,4),ll8(:,1),'-.g');
plot(ll9(:,4),ll9(:,1),'-.g');
plot(ll10(:,4),ll10(:,1),'-.g');
plot(ll11(:,4),ll11(:,1),'-.g');
plot(ll12(:,4),ll12(:,1),'-.g');

% hold();,
title('Amount of Docs VS. Log likelihood');
legend('LDA_batch:64','LDA_batch:128','LDA_batch:256','LDA_batch:512','LDA_batch:1024','LDA_batch:2048','HDP_batch:64','HDP_batch:128','HDP_batch:256','HDP_batch:512','HDP_batch:1024','HDP_batch:2048');
xlabel('Time');
ylabel('Log Likelihood');




% legend('tau:0.6','tau:0.7','tau:0.8','tau:0.9','tau:1.0');


% 
% figure
% plot(ll(:,4),ll(:,1),'-ro');
% hold();
% plot(ll(:,4),ll(:,2),'-.b');
% title('The number of batches VS. Abstract & Full Text');
% xlabel('number of batches seen by the model');
% ylabel('abstract & full text');
% legend('abstract','full text','Location','southwest');
% 
% figure
% plot(ll(:,5),ll(:,1),'-ro');
% hold();
% plot(ll(:,5),ll(:,2),'-.b');
% title('Elapsed Time VS. Abstract & Full Text');
% xlabel('elapsed time');
% ylabel('abstract & full text');
% legend('abstract','full text','Location','southwest');




