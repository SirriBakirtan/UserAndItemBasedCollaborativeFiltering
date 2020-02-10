function [mainMatrix] = MinusOnetToZeros(mainMatrix)

for i = 1:size(mainMatrix,1)
    for j = 1:size(mainMatrix,2)
        if(mainMatrix(i,j) == -1)
            mainMatrix(i,j) = 0;
        end
    end
end

end

