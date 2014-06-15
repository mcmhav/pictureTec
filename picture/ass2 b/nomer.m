function normval = nomer(A)
temp = [];
for i = 0:7
    count = 0;
   for h = 1:8
       if(A(h)==i)
            count = count + 1;
       end
   end
   temp(i+1) = count;
end
normval = temp/8;
histodraw(temp/8);