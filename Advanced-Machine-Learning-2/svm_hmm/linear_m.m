function linear_m(model, output_file, matrix,files)

% 1. Linear Model
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
        for column = 1:size(F,2) % 1:12
            if F(row, column) ~= 0
                str = [str ' ' num2str(column) ':' num2str(F(row,column))];
            end
        end
        % Now we can write it down on the text file
        fprintf(fid, '%s\n', str);
    end
    qid_count = qid_count + 1;
end
fclose(fid);
end