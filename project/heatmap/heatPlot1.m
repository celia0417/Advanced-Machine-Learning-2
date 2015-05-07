% plot figure

% plot batch
re = load('07_b_256v_0.0001k_1.0t_1.0_shuf_False_ran_True_dybatch_0_rate_1.0_model_abs.recommend');
nore = zeros(size(re,2),size(re,1));

for i = 1: size(re,1)
    rowsum = sum(re(i,:));
    for j = 1: size(re,2)
        nore(i,j)=re(i,j)/rowsum;
    end
end

imagesc(nore);
colorbar();

% hold();,
title('Heat Map for Confusion Matrix (1000 Queries, Criteria 3 & 4) of HDP');
xlabel('arXiv Labels of Recommended Documents');
ylabel('arXiv Labels of Query Documents');
x_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
y_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
% xticklabel_rotate([1:18],45,{'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'},'interpreter','none');

set(gca,'XTick',[1:18],'XTickLabel',x_labels);
set(gca,'YTick',[1:18],'YTickLabel',y_labels);

ax = gca; 
ax.XTickLabelRotation = 45;

set(gcf,'PaperPositionMode','auto')
print('re1','-dpng','-r400')


% recomendation 2
re2 = load('07_b_256v_0.0001k_1.0t_64.0_shuf_False_ran_False_dybatch_0_rate_1.0_tpcs_50_model_abs.recommend');
nore2 = zeros(size(re2,2),size(re2,1));

% normalize
for i = 1: size(re2,1)
    rowsum2 = sum(re2(i,:));
    for j = 1: size(re2,2)
        nore2(i,j)=re2(i,j)/rowsum2;
    end
end

figure

imagesc(nore2);
colorbar();

title('Heat Map for Confusion Matrix (1000 Queries, Criteria 3 & 4) of LDA');
xlabel('arXiv Labels of Recommended Documents');
ylabel('arXiv Labels of Query Documents');


xlabel('arXiv Labels of Recommended Documents');
ylabel('arXiv Labels of Query Documents');
x_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
y_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
set(gca,'XTick',[1:18],'XTickLabel',x_labels);
set(gca,'YTick',[1:18],'YTickLabel',y_labels);

ax = gca; 
ax.XTickLabelRotation = 45;

set(gcf,'PaperPositionMode','auto')
print('re2','-dpng','-r400')


% dwf

dwf = importdata('confusion_matrix_1000-H-DWF-08.tsv');
nordwf = zeros(size(dwf,2),size(dwf,1));

% normalize
for i = 1: size(dwf,1)
    rowsum3 = sum(dwf(i,:));
    for j = 1: size(dwf,2)
        nordwf(i,j)=dwf(i,j)/rowsum3;
    end
end

figure

imagesc(nordwf);
colorbar();

title('Heat Map for Confusion Matrix (1000 Queries, Criteria 3 & 4) of DWF');
xlabel('arXiv Labels of Recommended Documents');
ylabel('arXiv Labels of Query Documents');

ax = gca; 
ax.XTickLabelRotation = 45;

xlabel('arXiv Labels of Recommended Documents');
ylabel('arXiv Labels of Query Documents');
x_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
y_labels = {'cs','math','astro-ph','cond-mat','gr-qc','hep-ex','hep-lat','hep-ph','hep-th','math-ph','nlin','nucl-ex','nucl-th','physics','quant-ph','stat','q-fin','q-bio'};
set(gca,'XTick',[1:18],'XTickLabel',x_labels);
set(gca,'YTick',[1:18],'YTickLabel',y_labels);

set(gcf,'PaperPositionMode','auto')
print('dwf','-dpng','-r400')





