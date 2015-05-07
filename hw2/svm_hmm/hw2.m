% Weixin Wu
% HW 2 Main

clc;
clear all;

% Choose Model
choose_model ='Quadratic';   % Linear/Quadratic/Window/Qudratic_Window

% Epsilon
e = 0.1;

val_name = 'val.dat';
test_name = 'test.dat';
train_names = {'train1.dat','train2.dat','train3.dat','train4.dat','train5.dat','train6.dat','train7.dat','train8.dat','train9.dat','train10.dat'};

files = dir('CHORDS/*.mat');

[val_index,test_index,train_index,tr_files,table]= initialization(files);

% 1. Linear Model
if strcmp(choose_model,'Linear')==1
    load('init.mat');
    
    linear_m(choose_model, val_name, val_index, files);
    linear_m(choose_model, test_name, test_index, files);
    for i = 1:10
        linear_m(choose_model, train_names{i}, table(i,:), files);
    end
    
    % Do Cross-Validation
    [test_avg, test_std, argmaxC, max_records]= crossValidation(choose_model, train_names, val_name, test_name, e);
    
    output_path = ['l_C_' argmaxC '.mat'];
    save(output_path,'test_avg','test_std','argmaxC','max_records_linear');
end


% 2. Quadratic Model
if strcmp(choose_model,'Quadratic')==1
    load('init.mat');
    
    QuadraticModel(choose_model, val_name, val_index, files)
    QuadraticModel(choose_model, test_name, test_index, files)
    for i = 1:10
        QuadraticModel(choose_model, train_names{i}, table(i,:),files)
    end
    
    % Do Cross-Validation
    [avg_test_quad, std_test_quad, argmaxC_quad, max_records] = crossValidation(choose_model, train_names, val_name, test_name, e);
    
    output_path = ['q_C_' argmaxC_quad '.mat'];
    save(output_path,'avg_test_quad','std_test_quad','argmaxC_quad','max_records');
end


% Window and Quadratic Window
front = 0; % Previous
back = 1; % Future

% 3. Windowed Feature (Linear based)
if strcmp(choose_model,'Window')==1
    load('init.mat');
    
    WindowModel(choose_model, val_name, val_index, front, back,files)
    WindowModel(choose_model, test_name, test_index,front, back,files)
    for i = 1:10
        WindowModel(choose_model, train_names{i}, table(i,:),front, back,files)
    end
    
    % Do Cross-Validation
    [test_avg, test_std, argmaxC, max_records] = crossValidation(choose_model, train_names, val_name, test_name, e);
    
    output_path = ['front_' num2str(front) '_back_' num2str(back) '_C_' num2str(argmaxC) '.mat'];
    save(output_path,'test_avg','test_std','argmaxC','max_records');
end

% 4. Windowed Model (Quadratic based)
if strcmp(choose_model,'Quadratic_Window')==1
    load('init.mat');
    
    QuadraticWindow(choose_model, val_name, val_index,front, back,files)
    QuadraticWindow(choose_model, test_name, test_index, front, back,files)
    for i = 1:10
        QuadraticWindow(choose_model, train_names{i}, table(i,:),front, back,files)
    end
    
    % Do Cross Validation
    [test_avg, test_std, argmaxC, max_records] = crossValidation(choose_model, train_names, val_name, test_name, e);
    
    output_path = ['front_' num2str(front) '_back_' num2str(back) '_C_' num2str(argmaxC) '.mat'];
    save(output_path,'test_avg','test_std','argmaxC_qwindow','max_records');
end
