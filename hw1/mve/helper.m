function [ p ] = helper(con)
    p = con;
    n = size(con,1);
    match_matrix = zeros(n,1);
    set1 = [];
    set2 = [];
    for i=1:n
        if (match_matrix(con(i)) == 0)
            match_matrix(con(i)) = 1;
        else
            set2 = [set2;i];
        end
    end
    for i=1:n
        if (match_matrix(i) == 0)
            set1 = [set1;i];
        end
    end
    m = size(set2,1);
    for i=1:m
        p(set2(i)) = set1(i);
    end
end

