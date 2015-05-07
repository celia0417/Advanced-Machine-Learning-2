function [val_index,test_index,train_index,tr_files,table] = initialization(files)

% Choose 30% of the data as training
train_ratio = 0.3;
val_ratio = 0.05;
test_ratio = 0.05;
tail_ratio = val_ratio + test_ratio;

% Get all the files
tr_files = files';
[num,null_length] = size(files);
train_size = num * train_ratio;
tail_size = num * tail_ratio;

perm_index = randperm(num);
train_index = perm_index(1:train_size);
tail_index = perm_index(num - tail_size + 1:end);
val_index = tail_index(1:tail_size/2);
test_index = tail_index(tail_size/2+1:end);

table = zeros(10, train_size);
for i = 1:10
    perm_index = randperm(num);
    train_index = perm_index(1:train_size);
    table(i,:) = train_index;
end

save('init.mat','val_index','test_index','table');
end
