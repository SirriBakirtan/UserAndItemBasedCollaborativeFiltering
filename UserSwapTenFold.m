function [result] = SwapTest(mainMatrix,SplitNumber,Round)

starter = ((Round - 1)*SplitNumber)+1;
finished = starter + (SplitNumber-1);
beforeSt = (Round - 1)*SplitNumber;

tempBefore = mainMatrix(1:(beforeSt),:);
tempTest = mainMatrix(starter:finished,:);
tempAfter = mainMatrix((finished+1):943,:);

result = [tempTest;tempBefore;tempAfter];

end

