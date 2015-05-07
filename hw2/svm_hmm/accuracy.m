function accuracy = accuracy(acc_path)

% Parses the accuracy 
log = acc_path;
fid = fopen(log);
tline = fgetl(fid);
accuracy = 0;
while ischar(tline)
    tline = fgetl(fid);

    k = strfind(tline, 'Average loss per token:');
    if isempty(k) ~= 1
        accuracy = 1 - sscanf(tline,'Average loss per token: %f');
    end
end
fclose(fid);
end