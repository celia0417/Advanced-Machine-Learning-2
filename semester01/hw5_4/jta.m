function [psis,phi]=jta()

n = 5;
psis = cell(n-1, 1);
% for i = 1:(n-1)
%     psis{i} = rand(2,2);
% end
psis{1}=[0.1 0.7;0.8 0.3];

psis{2}=[0.5 0.1;0.1 0.5];

psis{3}=[0.1 0.5;0.5 0.1];
psis{4}=[0.9 0.3;0.1 0.3];

phi = cell(3, 1);

for i = 1:(n-2)
    phi{i} = sum(psis{i},1);
    psis{i+1} = (repmat(phi{i},2,1))'.*psis{i+1};
end

for i = (n-1): -1:2
    temp = phi{i-1};
    phi{i-1} = sum(psis{i},2)';
    phi{i-1}=phi{i-1}./temp;
    psis{i-1} = repmat(phi{i-1},2,1).*psis{i-1};
end

% normalize psis and phi
for i=1:(n-1)
    psis{i}=psis{i}./sum(sum(psis{i}));
end

for i=1:(n-2)
    phi{i}=phi{i}./sum(phi{i});
end

end
