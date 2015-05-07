% Plot Data 

%% figure 
accuracy =  [0.5676,0.6265,0.5767,0.5467,0.6392,0.5625,0.5367,0.5813,0.5630,0.5444,0.5723];
groups= char('+0-0','+0-1','Q+0-0','+1-0','+1-1','Q+1-0','+2-0','+2-2','Q+2-0','+3-0','+3-3');

figure();
plot(accuracy ,'ro');
title('Figure 1:Average Hamming accuracies for each model');
xlabel('modle');
ylabel('average accuracy across runs');
set(gca,'XTickLabel',groups);

legend('30% train');

%% plot 
accuracy = [0.5676,0.6265,0.5767,0.5467,0.6392,0.5625,0.5367,0.5813,0.5630,0.5444,0.5723];
a2 = [0.620, 0.6805, 0.6401, 0.583, 0.6809, 0.6365, 0.6216, 0.672, 0.6204, 0.6109, 0.6805];
a3 = [0.5209, 0.5316, 0.5181, 0.473, 0.5519, 0.4728, 0.4601, 0.5212, 0.4907,0.4617, 0.5208];
x = [1,2,3,4,5,6,7,8,9,10,11];
groups= char('+0-0','+0-1','Q+0-0','+1-0','+1-1','Q+1-0','+2-0','+2-2','Q+2-0','+3-0','+3-3');

figure();

plot(x, accuracy ,'ro',x,a2,'b*',x,a3,'kv')

title('Figure 1:Average Hamming accuracies for each model');
xlabel('modle');
ylabel('average accuracy across runs');
set(gca,'XTickLabel',groups);

legend('Average','Upper 25%','Upper 75%');

%% Box Plot
figure();
accuracy1 =  [0.5676,0.620,0.5209;0.6265,0.6805,0.5316;0.5767,0.6401,0.5181;0.5467,0.583,0.473;0.6392,0.6809,0.5519;0.5625,0.6365,0.4728;0.5367,0.6216,0.4601;0.6013,0.672,0.5212;0.5630,0.6204,0.4907;0.5444,0.6109,0.4617;0.6023,0.6805,0.5208];

boxplot(accuracy1',groups);
title('Figure 1:Average Hamming accuracies for each model');
xlabel('modle');
ylabel('average accuracy across runs');
set(gca,'XTickLabel',groups);

%% Annotation Figure
% randomly pick up two files
load('init.mat');
file_no = 2;  % change to plot different Beatles songs
index = test_index(1,file_no);  
fileName = ['CHORDS/' files(index,1).name];
load(fileName);   % load chords file
fileSize = size(L,1);

% get test label
Model = 'Window'; % Linear/Quadratic/Windows
testOutput = '125test'; % change output file 
testOutput = [testOutput '.outtags'];
labelFile = [Model '/' testOutput];
load(labelFile);
filesize = size(L,1);

for i = 1:filesize
    fileLabel(i,1) = X125test(i,1);
 end

figure();
% plot real label
plot(L,'ro');
hold();

% plot test label
plot(fileLabel,'b*');
titleName = ['Figure 2: Annotation on Beatles Song for ' Model];
title(titleName);
xlabel('L Vector Label (True Label)');
ylabel('Features');
legend('True Label', 'Predicted Label');

%% Color Plot Annotation Figure
figure();
imagesc(F);
colorbar();
set(gca,'xtick',1:size(L,1));
set(gca,'xticklabel',L(1:filesize,:));

xL = cell(size(L,1),1);
for i = 1: size(L,1)
    xL{i} = [num2str(L(i,1)) ',' num2str(fileLabel(i,1))];
end
set(gca,'xticklabel',xL); % real label

titleName = ['Figure 3: Annotation on Beatles Song for ' Model];
title(titleName);
xlabel('True Label & Predicted Label');
ylabel('Features');

%% Color Plot Some Parts of Annotation Figure
figure();
parts = 20;
imagesc(F(:,1:parts));
colorbar();
set(gca,'xtick',1:parts);

partsL = cell(size(L,1),1);
for i = 1: parts
    partsL{i} = [num2str(L(i,1)) ',' num2str(fileLabel(i,1))];
end
set(gca,'xticklabel',partsL); % real label

titleName = ['Figure 4: Annotation on Parts of frames for ' Model];
title(titleName);
xlabel('True Label & Predicted Label');
ylabel('Features');
