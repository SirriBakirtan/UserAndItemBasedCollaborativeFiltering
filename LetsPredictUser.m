
function [result] = LetsPredictUser(KisTen,Train,Test,ItemID)

count = 0;

for x = 1:size(Train,2)
    if(Test(1,x) ~= 0)
        count = count + 1;
    end
end

Test(1,ItemID) = 0;

MeanTest = sum(Test) / (count);

SumSecondRowFormula = 0;

KisTenMean = zeros(size(KisTen,1),1);
HoldKMatrix = zeros(size(KisTen,1),size(Train,2));

for y = 1:size(KisTen,1)
    HoldKMatrix(y,:) = Train(KisTen(y,1),:); 
end

for i = 1:size(KisTen,1)
    KisTenMean(i,1) = Means(HoldKMatrix(i,:));
end

for j = 1:size(KisTen,1)
    if(HoldKMatrix(j,ItemID) ~= 0)
        tempCal = HoldKMatrix(j,ItemID) - KisTenMean(j,1);
        HoldKMatrix(j,ItemID) = tempCal*KisTen(j,2);        
    end
    SumSecondRowFormula = SumSecondRowFormula + KisTen(j,2);
end

SumRowFormula = sum(HoldKMatrix(:,ItemID));

result = MeanTest + (SumRowFormula/SumSecondRowFormula);
    
end

