function [res] = Means(matrix)
count = 0;
for i = 1:size(matrix,2)
    if(matrix(1,i) ~= 0)
        count = count + 1;
    end
end

res = sum(matrix) / count;
end

