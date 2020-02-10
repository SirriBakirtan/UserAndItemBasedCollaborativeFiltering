function [result] = FErrorRateUser(Actual,Predicit)

template = zeros(1,size(Actual,2));
count = 0;

for i = 1:size(Actual,2)
    if(Actual(1,i) ~= 0 && Predicit(1,i) ~= 0 && (~isnan(Actual(1,i))) && (~isnan(Predicit(1,i))))
        template(1,i) = abs(Actual(1,i) - Predicit(1,i));
        count = count + 1;       
    end
end
template(isnan(template)) = 0;

result = sum(template) / count;
end

