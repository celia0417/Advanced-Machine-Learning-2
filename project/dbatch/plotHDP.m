ll = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_0_rate_1.5_train_output_hdp.likelihood');
ll2 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_1_rate_2.0_train_output_hdp.likelihood');
ll3 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_1_rate_32.0_train_output_hdp.likelihood');
ll4 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_1_rate_128.0_train_output_hdp.likelihood');
ll5 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_2_rate_1.05_train_output_hdp.likelihood');
ll6 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_2_rate_1.2_train_output_hdp.likelihood');
ll7 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_2_rate_1.4_train_output_hdp.likelihood');
ll8 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_3_rate_1.1_train_output_hdp.likelihood');
ll9 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_3_rate_1.5_train_output_hdp.likelihood');
ll10 = load ('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_False_dybatch_3_rate_2.0_train_output_hdp.likelihood');

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
title('Influence of Dynamic Batch Size to Performance for HDP','FontSize',15);
legend({'HDP const.size','HDP scheme 1 rate 2.0','HDP scheme 1 rate 32.0','HDP scheme 1 rate 128.0','HDP scheme 2 rate 1.05','HDP scheme 2 rate 1.2','HDP scheme 2 rate 1.4','HDP scheme 3 rate 1.1','HDP scheme 3 rate 1.5','HDP scheme 3 rate 2.0'},'Location','southeast','FontSize',13);
axis([0 1100 -10.0 -6.5])
xlabel('Time','FontSize',13);
ylabel('Per-word Predictive Log Likelihood','FontSize',13);

set(gcf,'PaperPositionMode','auto')
print('HDPdybatch','-dpng','-r800')
