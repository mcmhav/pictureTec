function vs = ventricleSeg(A)

segmentation = zeros(size(A));

% TODO: Do ventricle segmentation

% x: 133 - 51
% y: 159 - 63
% z; 105 - 65

% 750 - 715
% 760 - 705

for i=51:133
    for j=63:159
        for k=65:104
            if A(i,j,k) > 705 && A(i,j,k) < 760
                segmentation(i,j,k) = 100;
            end
        end
    end
end

for i=81:101
    for j=38:100
        for k=65:104
           
                segmentation(i,j,k) = 0;
           
        end
    end
end

for i=86:96
    for j=38:112
        for k=65:104
           
                segmentation(i,j,k) = 0;
           
        end
    end
end
se = strel('disk', 1);
for i=65:104
     segmentation(:,:,i) = imerode(segmentation(:,:,i),se);
end

se = strel('disk', 2);
for i=65:104
     segmentation(:,:,i) = imdilate(segmentation(:,:,i),se);
end

viewer3d(segmentation);

vs = segmentation;