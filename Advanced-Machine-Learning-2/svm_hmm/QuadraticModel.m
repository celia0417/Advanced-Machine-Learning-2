function QuadraticModel(model, output_file, matrix,files)

% 2. Quadratic Model 

path = [model '/' output_file];
fid = fopen(path, 'wt'); % creat file and write
qid_count = 1;
for index = matrix 
    name = ['CHORDS/' files(index,1).name]; % Find this data song's name
    load(name)
    F = F'; 
    L = L + ones(size(L));
    for row = 1:size(F,1) 

        str = [num2str(L(row)) ' qid:' num2str(qid_count)];
        for column = 1:size(F,2) 
            if F(row, column) ~= 0
                str = [str ' ' num2str(column) ':' num2str(F(row,column))];
            end
        end
        count = 1;
        for column = 1:size(F,2) 
            for subcolumn = column+1:size(F,2) 
                if F(row,column) ~= 0 && F(row,subcolumn) ~= 0
                    str = [str ' ' num2str(count+12) ':' num2str(F(row,column)*F(row,subcolumn))];
                end
                count = count+1;
            end
        end
        % write
        fprintf(fid, '%s\n', str);
    end
    qid_count = qid_count + 1;
end
fclose(fid);
end
