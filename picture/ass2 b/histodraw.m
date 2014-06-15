function histodraw(A)
dist = 1;
for i = 1:8
    if(A(i)==0)
        rectangle('Position', [dist, 0, 1, 0.00001]);
    else
        rectangle('Position', [dist, 0, 1, A(i)]);
    end
    dist = dist + 2;
end