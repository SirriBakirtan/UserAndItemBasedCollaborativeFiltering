function [result] = FoldItem(mainMatrix,fold)

mainMatrix = MinusOnetToZeros(mainMatrix);

itemStarter = uint16(size(mainMatrix,2) / fold);

itemNext = itemStarter + 1;

Test = mainMatrix(:,1:itemStarter);
Train = mainMatrix(:,itemNext:size(mainMatrix,2));

TotalSimItem = zeros(itemStarter,(size(mainMatrix,2)- itemStarter));

for i = 1:itemStarter
    for j = 1:(size(mainMatrix,2)- itemStarter)
        TotalSimItem(i,j) = CalCosine(Test(:,i),Train(:,j));
    end
end

TotalErrorRate = zeros(itemStarter,8);
k = 10;

for b = 1:8  
    HoldItemOneGuess = zeros(size(Test,1),1);
    for v = 1:itemStarter
         TenSortedSim = SortTrainItem(TotalSimItem,k,v);        
         for m = 1:size(Test,1) 
            HoldItemOneGuess(m,1) = LetsPredictItem(TenSortedSim,Train,m,Test,v);       
         end
         HoldRate = FErrorRateItem(HoldItemOneGuess(:,1),Test(:,v));
         TotalErrorRate(v,b) = HoldRate;
    end  
    k = k + 10;
end

result = TotalErrorRate;

end

