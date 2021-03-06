%% plot
ll = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_True_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll2 = load('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_1_rate_2.0_tpcs_100_train_output_lda.likelihood');
ll3 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_1_rate_32.0_tpcs_100_train_output_lda.likelihood');
ll4 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_1_rate_128.0_tpcs_100_train_output_lda.likelihood');
ll5 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_2_rate_1.05_tpcs_100_train_output_lda.likelihood');
ll6 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_2_rate_1.2_tpcs_100_train_output_lda.likelihood');
ll7 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_2_rate_1.4_tpcs_100_train_output_lda.likelihood');
ll8 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_3_rate_1.1_tpcs_100_train_output_lda.likelihood');
ll9 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_3_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll10 = load ('07_b_256v_0.0001k_0.8t_32.0_shuf_False_ran_False_dybatch_3_rate_2.0_tpcs_100_train_output_lda.likelihood');

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


% hold();,
title('Influence of Dynamic Batch Size to Performance for LDA','FontSize',15);
legend({'LDA const.size','LDA scheme 1 rate 2.0','LDA scheme 1 rate 32.0','LDA scheme 1 rate 128.0','LDA scheme 2 rate 1.05','LDA scheme 2 rate 1.2','LDA scheme 2 rate 1.4','LDA scheme 3 rate 1.1','LDA scheme 3 rate 1.5','LDA scheme 3 rate 2.0'},'Location','southeast','FontSize',13);
axis([0 1100 -10.5 -7.5])
xlabel('Time','FontSize',13);
ylabel('Per-word Predictive Log Likelihood','FontSize',13);

set(gcf,'PaperPositionMode','auto')
print('LDAdybatch','-dpng','-r800')




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




