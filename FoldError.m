function [Template] = FoldError(matrix)
Template = zeros(1,size(matrix,2));

for i = 1:size(matrix,2)
    Template(1,i) = mean(matrix(:,i));
end

end

