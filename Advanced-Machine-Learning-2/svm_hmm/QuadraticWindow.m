function QuadraticWindow(model, output_file, matrix, front, back,files)

% 4. Quadratic Window Model

path = [model '/' output_file];
fid = fopen(path, 'wt');  % creat file and write
qid_count = 1;
for index = matrix
    name = ['CHORDS/' files(index,1).name];
    load(name)
    F = F';
    L = L + ones(size(L));
    for row = 1:size(F,1)
        
        str = [num2str(L(row)) ' qid:' num2str(qid_count)];
        count = 0;
        param = [];
        if row <= front
            for i = 2:row
                param = [param,i-row-1];
            end
            param = [param,0];
            for i = 1:back
                param = [param,i];
            end
        elseif row+back>size(F,1)
            for i = 1:front
                param = [param,-front+i-1];
            end
            param = [param,0];
            for i = row+1:size(F,1)
                param = [param,i-row];
            end
            count = front-1;
        else
            for i = 1:front
                param = [param,-front+i-1];
            end
            param = [param,0];
            for i = 1:back
                param = [param,i];
            end
        end
        
        w_data = [];
        count = (param(1)+front)*12+1;
        for i = 1:size(param)
            for column = 1:size(F,2) % 1:12
                w_data = [w_data, F(row+param(i), column)];
                if F(row+param(i), column) ~= 0
                    str = [str ' ' num2str(count) ':' num2str(F(row+param(i),column))];
                end
                count = count + 1;
            end
        end
        
        count_feature = count - 1;
        for column = 1:count_feature % 1:12
            for subcolumn = column+1:count_feature % column:12 (when column = 12, dismiss)
                if w_data(column) ~= 0 && w_data(subcolumn) ~= 0
                    str = [str ' ' num2str(count) ':' num2str(w_data(column)*w_data(subcolumn))];
                end
                count = count+1;
            end
        end
        
        % Now we can write it down on the text file
        fprintf(fid, '%s\n', str);
    end
    qid_count = qid_count + 1;
end
fclose(fid);
end