function [g, NR, SI, TI] = regrow(f,S,T)

f = im2double(f);

if numel(S) == 1
    SI = f == S;
    S1 = S;
else
    SI = bwmorph(S,'shrink', Inf);
    S1 = f(SI);
end

TI = false(size(f));
for K = 1:length(S1)
    seedvalue = S1(K);
    S = abs(f - seedvalue) <= T;
    TI = TI | S;
end

[g, NR] = bwlabel(imreconstruct(SI, TI));