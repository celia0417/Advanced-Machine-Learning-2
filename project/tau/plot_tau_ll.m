
% plot figure

% plot batch
ll = load('07_b_512v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll2 = load('07_b_512v_0.0001k_1.0t_15.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll3 = load('07_b_512v_0.0001k_1.0t_32.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll4 = load('07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll5 = load('07_b_512v_0.0001k_1.0t_128.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll6 = load('07_b_512v_0.0001k_1.0t_256.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll7 = load('07_b_512v_0.0001k_1.0t_512.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');
ll8 = load('07_b_512v_0.0001k_1.0t_1024.0_shuf_False_ran_False_dybatch_0_rate_1.5_tpcs_100_train_output_lda.likelihood');

ll9 = load('07_b_512v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll10 = load('07_b_512v_0.0001k_1.0t_15.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll11 = load('07_b_512v_0.0001k_1.0t_32.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll12 = load('07_b_512v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll13 = load('07_b_512v_0.0001k_1.0t_128.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll14 = load('07_b_512v_0.0001k_1.0t_256.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll15 = load('07_b_512v_0.0001k_1.0t_512.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll16 = load('07_b_512v_0.0001k_1.0t_1024.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');

plot(ll(:,4),ll(:,1),'-.r');
hold();
plot(ll2(:,4),ll2(:,1),'-.b');
plot(ll3(:,4),ll3(:,1),'-.k');
plot(ll4(:,4),ll4(:,1),'-.m');
plot(ll5(:,4),ll5(:,1),'-.g');
plot(ll6(:,4),ll6(:,1),'-.y');
plot(ll7(:,4),ll7(:,1),'-.c');
plot(ll8(:,4),ll8(:,1),'-g');

plot(ll9(:,4),ll9(:,1),'-.oc');
plot(ll10(:,4),ll10(:,1),'-.db');
plot(ll11(:,4),ll11(:,1),'-.*k');
plot(ll12(:,4),ll12(:,1),'-.or');
plot(ll13(:,4),ll13(:,1),'-.*m');
plot(ll14(:,4),ll14(:,1),'-.sb');
plot(ll15(:,4),ll15(:,1),'-.oy');
plot(ll16(:,4),ll16(:,1),'-.+');


% hold();,
title('Influence of Tau to Performance','FontSize',15);
legend({'LDA tau:1.0','LDA tau:15.0','LDA tau:32.0','LDA tau:64.0','LDA tau:128.0','LDA tau:256.0','LDA tau:512.0','LDA tau:1024.0','HDP tau:1.0','HDP tau:15.0','HDP tau:32.0','HDP tau:64.0','HDP tau:128.0','HDP tau:256.0','HDP tau:512.0','HDP tau:1024.0'},'Location','southeast','FontSize',13);
axis([0 1100 -10.5 -6.5])
xlabel('Time','FontSize',13);
ylabel('Per-word Predictive Log Likelihood','FontSize',13);

set(gcf,'PaperPositionMode','auto')
print('tau','-dpng','-r800')

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




