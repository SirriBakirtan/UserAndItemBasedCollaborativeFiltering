function [result] = PredictOneUser(Sim,main)

HoldSumSim = 0;
HoldMul = 0;

for i = 1:size(Sim,1)
   if(main(1,Sim(i,2)) ~= 0)
        HoldMul = HoldMul + (Sim(i,1) * main(1,Sim(i,2)));
        HoldSumSim = Sim(i,1) + HoldSumSim;
   end
end

result = HoldMul / HoldSumSim;

end

