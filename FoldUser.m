function [result] = FoldUser(mainMatrix,fold)

mainMatrix = MinusOnetToZeros(mainMatrix);

numberOfSeperate = uint16(size(mainMatrix,1) / fold);
temp = numberOfSeperate + 1;
temp2 = size(mainMatrix,1) - numberOfSeperate;

Test = mainMatrix(1:numberOfSeperate,:);
Train = mainMatrix(temp:size(mainMatrix,1),:);

TotalSim = zeros(numberOfSeperate,temp2);

for k = 1:numberOfSeperate
    for t = 1:temp2
        TotalSim(k,t) = SimTwoUserPCC(Test(k,:),Train(t,:));     
    end
end

k = 10;
TotalSim(isnan(TotalSim)) = 0;
Oness = zeros(numberOfSeperate,8);
for a = 1:8
    for q = 1:numberOfSeperate
        KisTen = SortTrainUser(TotalSim,k,q);
        Predict = zeros(1,size(mainMatrix,2));

        for c = 1:size(mainMatrix,2)
            if(Test(q,c) ~= 0)
                Predict(1,c) = LetsPredictUser(KisTen,Train,Test(q,:),c);
            end
        end
        Predict(isnan(Predict)) = 0;
        Oness(q,a) = FErrorRateUser(Test(q,:),Predict(1,:));       
    end
     k = k + 10;
end
result = Oness;
end

