
% plot figure

% plot batch
ll = load('07_b_64v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll2 = load('07_b_128v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll3 = load('07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll4 = load('07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll5 = load('07_b_1024v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll6 = load('07_b_2048v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');

ll7 = load('07_b_64v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll8 = load('07_b_128v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll9 = load('07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll10 = load('07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll11 = load('07_b_1024v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll12 = load('07_b_2048v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');

plot(ll(:,4),ll(:,1),'-.*r');
hold();
plot(ll2(:,4),ll2(:,1),'-.b');
plot(ll3(:,4),ll3(:,1),'-.k');
plot(ll4(:,4),ll4(:,1),'-.m');
plot(ll5(:,4),ll5(:,1),'-.g');
plot(ll6(:,4),ll6(:,1),'-.y');
plot(ll7(:,4),ll7(:,1),'-.om');
plot(ll8(:,4),ll8(:,1),'-.dg');
plot(ll9(:,4),ll9(:,1),'-.c');
plot(ll10(:,4),ll10(:,1),'-.p');
plot(ll11(:,4),ll11(:,1),'-.*k');
plot(ll12(:,4),ll12(:,1),'-.*y');

% hold();,
title('Influence of Batch Size to Performance','FontSize',15);
legend({'LDA batch:64','LDA batch:128','LDA batch:256','LDA batch:512','LDA batch:1024','LDA batch:2048','HDP batch:64','HDP batch:128','HDP batch:256','HDP batch:512','HDP batch:1024','HDP batch:2048'},'Location','southeast','FontSize',13);
axis([0 1100 -10.2 -7])
xlabel('Time','FontSize',13);
ylabel('Per-word Predictive Log Likelihood','FontSize',13);

set(gcf,'PaperPositionMode','auto')
print('batch','-dpng','-r800')



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




