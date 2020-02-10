function [result] = FErrorRateItem(TakenItemCol1,TakenItemCol2)

count = 0;
template = zeros(size(TakenItemCol1,1),1);

for i = 1:size(TakenItemCol1,1)
    if(TakenItemCol1(i,1) ~= 0 && TakenItemCol2(i,1) ~= 0 && (~isnan(TakenItemCol1(i,1))) && (~isnan(TakenItemCol2(i,1))))
        template(i,1) = abs(TakenItemCol1(i,1) - TakenItemCol2(i,1));
        count = count + 1;
    end
end

template(isnan(template)) = 0;

result = sum(template) / count;

end

