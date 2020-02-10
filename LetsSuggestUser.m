function [result] = LetsSuggestUser(main,test,k)

main = MinusOnetToZeros(main);
TotalSim = zeros(size(main,1),1);

for i = 1:size(main,1)
    TotalSim(i,1) = SimTwoUserPCC(test,main(i,:));
end
TotalSim(isnan(TotalSim)) = 0;
[out,idx] = sort(TotalSim,'descend');

SimGreaterValue = out(1:k,1);
SimGreaterID = idx(1:k,1);

Merged = [SimGreaterID,SimGreaterValue];

TemplatePredictUser = zeros(1,1682);

for j = 1:size(main,2)
    if(test(1,j) == 0)
        TemplatePredictUser(1,j) = LetsPredictUser(Merged,main,test,j);
    end
end
TemplatePredictUser(isnan(TemplatePredictUser)) = 0;

[out2,idx2] = sort(TemplatePredictUser,'descend');

firstRandom = randi([1 10],5);

result = idx2(1,firstRandom(1,1));

end

