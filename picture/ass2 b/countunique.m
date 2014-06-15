function unique = countunique(A)
temp2 = [];
for i = 0:7
    temp = sum(A == i);
    temp2 = [temp2 sum(temp)];
end
unique = temp2;