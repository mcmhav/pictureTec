function gaus = gaussianmask(A)

[d1 d2] = size(A);
temp = zeros(d1, d2);
kern = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
for i = 3:d1-3
    for j = 3:d2-3
        for ki = 1:3
            mm = ki - 2;
            for kj = 1:3
                nn = kj - 2;
                ii = i + mm;
                jj = j + nn;
                temp(i,j) = temp(i,j) + A(ii,jj) * kern(ki,kj);
            end
        end
    end
end

gaus = temp;