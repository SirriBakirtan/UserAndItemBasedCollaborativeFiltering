function [count] = CountingElement(matrix)

count = 0;

for b = 1:size(matrix,2)
    if(matrix(1,b) ~= 0)
        count = count + 1;
    end
end

end

