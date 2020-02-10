function [result] = LetsPredictItem(TotalSim,Train,UserId,Test,PredictItemCol)

Mul = 0;
AddSim = 0;

for i = 1:size(TotalSim,1)
    if(Train(UserId,TotalSim(i,2)) ~= 0 && Test(UserId,PredictItemCol) ~= 0)
        Mul = Mul + (TotalSim(i,1) * Train(UserId,TotalSim(i,2)));
        AddSim = AddSim + TotalSim(i,1);
    end
end

result = Mul / AddSim;

end

