function [result] = LetsSuggestItem(main,test,k)

Total = [test;main];
mainMatrix = MinusOnetToZeros(Total);
StoredPredict = zeros(size(mainMatrix,2),size(test,1));
FullSim = zeros(size(mainMatrix,2),size(mainMatrix,2));

for i = 1:size(mainMatrix,2)
    if(mainMatrix(1,i) == 0)
        HoldColTest = mainMatrix(:,i);
        for j = 1:(size(mainMatrix,2))
            FullSim(i,j) = CalCosine(HoldColTest,mainMatrix(:,j));
        end
    end
end

for b = 1: size(mainMatrix,2)
    FullSim(b,b) = 0;
end

for c = 1:size(mainMatrix,2)
    if(FullSim(c,1) ~= 0)
        HoldMostSimItem = SortTrainItem(FullSim,k,c);
        StoredPredict(c,1) = PredictOneUser(HoldMostSimItem,mainMatrix);
    end
end
StoredPredict(isnan(StoredPredict)) = 0;

[out,idx] = sort(StoredPredict,'descend');

firstRandom = randi([1 10],5);

result = idx(firstRandom(1,1),1);
end

