function [result] = SimTwoUser(User1,User2)

% U1Mean = mean(User1);
% U2Mean = mean(User2);

count = CountingElement(User1);
count2 = CountingElement(User2);

U1Mean = sum(User1) / count;
U2Mean = sum(User2) / count2;

HoldUser1 = zeros(1,size(User1,2));
HoldUser2 = zeros(1,size(User2,2));

SumMul = 0;
SumSquare1 = 0;
SumSquare2 = 0;

for i = 1:size(User1,2)
    if(User1(1,i) ~= 0)
         HoldUser1(1,i) = User1(1,i) - U1Mean;
    end
end

for z = 1:size(User2,2)
    if(User2(1,z) ~= 0)
         HoldUser2(1,z) = User2(1,z) - U2Mean;
    end
end

for j = 1:size(User1,2)
    if(User1(1,j) ~= 0 && User2(1,j) ~= 0)
        Mul = HoldUser1(1,j) * HoldUser2(1,j);
        SumMul = SumMul + Mul;
        SquareU1 = abs(HoldUser1(1,j).^2);
        SquareU2 = abs(HoldUser2(1,j).^2);
        SumSquare1 = SquareU1+SumSquare1;
        SumSquare2 = SquareU2+SumSquare2;
    end
end

sqrtSum1 = sqrt(SumSquare1);
sqrtSum2 = sqrt(SumSquare2);
procedure1 = SumMul;
procedure2 = sqrtSum1 * sqrtSum2 ;

result = procedure1 / procedure2;

end

