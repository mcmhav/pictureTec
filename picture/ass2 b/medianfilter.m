function med = medianfilter(A)
[d1 d2] = size(A);
temp = [];
for i = 2:d1-1
    for j = 2:d2-1
        temp2 = [A(i-1,j-1) A(i-1,j) A(i-1, j+1) A(i, j-1) A(i,j) A(i,j+1) A(i+1,j-1) A(i+1, j) A(i+1, j+1)];
        temp(i,j) = sum(temp2)/300;
    end
end

med = temp;