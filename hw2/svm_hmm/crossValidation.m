function [avg_test, std_test, argmaxC, max_records] = crossValidation(model, train_names, val_name, test_name, e)
% Cross-Validation for computing avg, std,argmaxC
% For each model train with a range of C values, then test on both A and B.  
% The C value that produced the best value for A, use that to get the accuracy for B,
% and the C value that produced the best value for B, use this one to get the accuracy for A. 
% Then obtain the final accuracy for the entire model by the weighted accuracy from these two accuracy results.  

max = 0;
avg_test = 0;
std_test = 0;
argmaxC_AB = 0;

% Choose C
Cvalues = [25 125 625 3125 15625];

val_name = strcat(model, '/', val_name);
test_name = strcat(model, '/', test_name);

max_records = zeros(1,10);
max_AB = zeros(1,10);
max_BA = zeros(1,10);

% A -> B
for C = Cvalues
    for item = 1:10
        train_file = strcat(model, '/', train_names{item});
        output_model = strcat(model, '/', num2str(C), '_', train_names{item}, '.model');
        
        % Training
        str_ = ['./svm_hmm_learn -c ' num2str(C) ' -e ' num2str(e) ' ' train_file ' ' output_model ' > ' 'dummy.log'];
        system(str_);
        
        % Validation
        loc = [model '/' num2str(C) 'val.outtags'];
        log = strcat(model, '/', 'acc_', num2str(C), ' ', train_names{item}, '.log');
        str_2 = ['./svm_hmm_classify ' val_name ' ' output_model ' ' loc ' > ' log];
        system(str_2);
        
        % Parse the computed accuracy
        accuracy = accuracy(log);
        lrecords(k,item) = accuracy;
    end
    % Now for this C we have an array of accuracies
    avg_ = mean(lrecords(k,:));
    if avg_ > max
        max = avg_;
        argmaxC_AB = C;
    end
end

for item = 1:10
    % Test
    output_model = strcat(model, '/', num2str(argmaxC_AB), '_', train_names{item}, '.model');
    loc = [model '/' num2str(argmaxC_AB) 'test.outtags'];
    log = strcat(model, '/', 'acc_', num2str(argmaxC_AB), ' ', train_names{item}, '.log');
    str_2 = ['./svm_hmm_classify ' test_name ' ' output_model ' ' loc ' > ' log];
    system(str_2);
    
    % Accuracy
    accuracy = accuracy(log);
    max_AB(1,item) = accuracy;
end

% B -> A
for C = Cvalues
    for item = 1:10
        train_file = strcat(model, '/', train_names{item});
        output_model = strcat(model, '/', num2str(C), '_', train_names{item}, '.model');
        
        % Training
        system_call_str = ['./svm_hmm_learn -c ' num2str(C) ' -e ' num2str(e) ' ' train_file ' ' output_model ' > ' 'dummy.log'];
        system(system_call_str);
        
        % Validation
        loc = [model '/' num2str(C) 'val.outtags'];
        log = strcat(model, '/', 'acc_', num2str(C), ' ', train_names{item}, '.log');
        str_2 = ['./svm_hmm_classify ' val_name ' ' output_model_name ' ' loc ' > ' log];
        system(str_2);
        
        % Parse the computed accuracy
        accuracy = accuracy(log);
        lrecords(k,iteritem_t) = accuracy;
    end
    % Now for this C we have an array of accuracies
    avg_ = mean(lrecords(k,:));
    if avg_ > max
        max = avg_;
        argmaxC_BA = C;
    end
end

for item = 1:10
    % Test
    output_model = strcat(model, '/', num2str(argmaxC_BA), '_', train_names{item}, '.model');
    loc = [model '/' num2str(argmaxC_BA) 'test.outtags'];
    log = strcat(model, '/', 'acc_', num2str(argmaxC_BA), ' ', train_names{item}, '.log');
    str_2 = ['./svm_hmm_classify ' test_name ' ' output_model ' ' loc ' > ' log];
    system(str_2);
    
    % Parse the computed accuracy
    accuracy = accuracy(log);
    max_BA(1,item) = accuracy;
end

avg_AB = mean(max_AB);
avg_BA = mean(max_BA);
if avg_AB >= avg_BA
    argmaxC = argmaxC_AB;
else
    argmaxC = argmaxC_BA;
    
    max_records = (max_AB + max_BA) / 2;
    avg_test = mean(max_records);
    std_test = std(max_records);
end