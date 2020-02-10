function [result] = ItemSwapTenFold(main,fold,sizeCol)

starter = ((fold - 1)*sizeCol)+1;
finished = starter + (sizeCol-1);
beforeSt = (fold - 1)*sizeCol;

tempBefore = main(:,1:(beforeSt));
tempTest = main(:,starter:finished);
tempAfter = main(:,(finished+1):size(main,2));

result = [tempTest,tempBefore,tempAfter];

end

