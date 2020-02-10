function [result] = SortTrainItem(TotalSim,k,ItemId)

[out,idx] = sort(TotalSim(ItemId,:),'descend');

MostSimValue = out(:,1:k).';
MostSimId = idx(:,1:k).';

result = [MostSimValue,MostSimId];
end

