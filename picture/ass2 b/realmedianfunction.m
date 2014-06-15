function med = realmedianfunction(A, fa)

[d1 d2] = size(A);
temp = [];
for i = fa+1:d1-fa
    for j = fa+1:d2-fa
        temp2 = median(median(A((-fa+i):(fa+i), (-fa+j):(fa+j))));
        temp(i,j) = temp2;
    end
end

med = temp;

% Task 2.2 - Implement the median filter for images as a function
% and make it possible to set the size of the filtering area (do not use the 
% built-in filtering/median functions). Tip: Use the matlab function 
% median() to retrieve the median value of an array