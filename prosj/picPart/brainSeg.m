function bs = brainSeg(A)

% Create an empty segmentation
segmentation = zeros(size(A));

% TODO: Do brain segmentation

% x: 164 - 17
% y: 200 - 19
% z; 157 - 9

% 1600 - 2402
se = strel('disk', 2);

for i=17:164
    for j=19:200
        for k=11:156
            if A(i,j,k) > 1780 && A(i,j,k) < 2405
                segmentation(i,j,k) = 100;
            end
        end
    end
end

for i=11:156
     segmentation(:,:,i) = imerode(segmentation(:,:,i),se);
end


viewer3d(segmentation);

bs = segmentation;