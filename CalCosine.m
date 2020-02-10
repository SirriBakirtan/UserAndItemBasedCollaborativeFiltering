function [result] = CalCosine(item1,item2)

SumMul = 0;

for i = 1:size(item1,1)
    if(item1(i,1) ~= 0 && item2(i,1) ~= 0)
        SumMul = SumMul + (item1(i,1)*item2(i,1));
    end
end

SumSquareItem1 = sqrt(sum(item1.^2));
SumSquareItem2 = sqrt(sum(item2.^2));

result = SumMul / (SumSquareItem1*SumSquareItem2);

end

