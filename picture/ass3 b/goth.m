function re = goth(A)

count = 0;
done = false;
T  = mean2 (A);
while ~done
    count = count + 1;
    g = A > T;
    Tnext = 0.5*(mean(A(g)) + mean(A(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end

re = T;