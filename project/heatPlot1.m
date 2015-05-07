% Heat Map Plotting Script
% clc;
% clear;
% load('confuseMat_ALL.mat');
% colormap('hot');
% %imagesc(confusionmatrixAbs1000HLDA08);
% %imagesc(confusionmatrixAbs1000HDWF08);
% %imagesc(confusionmatrixFT1000HLDA08);
% imagesc(confusionmatrixGenAbs1000HLDA08);
% colorbar;
% title('Heat Map for Confusion Matrix (08 Query 07 Recommendation, 1000 Queries, Criteria 3 & 4)');
% xlabel('arXiv Labels of Recommended Documents');
% ylabel('arXiv Labels of Query Documents');
% x_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
% y_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
% set(gca,'XTick',[1:18],'XTickLabel',x_labels);
% set(gca,'YTick',[1:18],'YTickLabel',y_labels);



% plot figure

% plot batch
re = load('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_True_dybatch_0_rate_1.0_model_abs.recommend');
% re2 = load('07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.0_tpcs_50_model_abs.recommend');

imagesc(re);
colorbar();


% figure
% 
% imagesc(re2(:,1:parts));
% colorbar();

% hold();,
title('Amount of Docs VS. Log likelihood');
legend('LDA_batch:64','LDA_batch:128','LDA_batch:256','LDA_batch:512','LDA_batch:1024','LDA_batch:2048','HDP_batch:64','HDP_batch:128','HDP_batch:256','HDP_batch:512','HDP_batch:1024','HDP_batch:2048');
xlabel('Time');
ylabel('Log Likelihood');

set(gcf,'PaperPositionMode','auto')
print('re1','-dpng','-r400')


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




