function WindowModel(model, output_file, matrix, front, back,files)

% 3. Window Feature Case
path = [model '/' output_file];
fid = fopen(path, 'wt'); % Open for writing
qid_count = 1;
for index = matrix % For all songs' indices listed in this list
    name = ['CHORDS/' files(index,1).name]; % Find this data song's name
    load(name)
    F = F'; % Now F is, say, 345 by 12 and L is 345 by 1
    L = L + ones(size(L));
    for row = 1:size(F,1) % 1:345
        % Now we are constructing a String to write
        % First we add the label and the qid
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
        
        
        count = (param(1)+front)*12+1;
        for i = 1:size(param)
            for column = 1:size(F,2) % 1:12
                if F(row+param(i), column) ~= 0
                    str = [str ' ' num2str(count) ':' num2str(F(row+param(i),column))];
                end
                count = count + 1;
            end
        end
        
        % Now we can write it down on the text file
        fprintf(fid, '%s\n', str);
    end
    qid_count = qid_count + 1;
end
fclose(fid);
end