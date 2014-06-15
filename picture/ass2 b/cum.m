function cumf = cum(A)
temp = A(1);
for i = 2:8
    temp(i) = temp(i-1)+A(i);
end
cumf = temp;
histodraw(temp);