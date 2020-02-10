function [result] = SortTrainUser(train,k,UserID)

HoldTrain = train(UserID,:).';
[out,idx] = sort(HoldTrain,'descend');

TakeID = idx(1:k,:);
TakeRate = out(1:k,:);

result = [TakeID,TakeRate];
end

