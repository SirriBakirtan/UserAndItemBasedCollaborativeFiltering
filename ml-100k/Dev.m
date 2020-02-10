function [Norm_data] = Dev(Data)
[satir sutun] = size (Data)
for i = 1: satir
    S_i = 0;
    for j = 1: sutun
        if Data(i,j) == 0
            continue;
        else
            S_i = (Data(i,j)-mean(Data(i,:)))+S_i;
        end
    end
    S_item(i,1) = S_i / (nnz(Data(1,:)))
end

