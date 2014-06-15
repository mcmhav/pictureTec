% Assignment 3 - Segmentation and morphological operations
% TDT4195 - Image Techniques
% ================================================
% Add code to this file where indicated and deliver on Itslearning before deadline

%!!!!!!!!!!!!!!FOR EACH CREATED/RESTORED IMAGE: SAVE IT AND UPLOAD ON ITSLEARNING!!!!!!!!!!

% === 1 - Morphological operations ===

% Task 1.1 - Load the image bone.tif and find its skeleton using
% thinning
%done
% Task 1.2 - Perform dilation on the skeleton with a disk
se = strel('disk', 20);
figure, imshow(imdilate(bone,se))
% Task 1.3 - Perform erosion on the dilated skeleton with a smaller disk
se = strel('disk', 10);
er = imerode(dil,se);
% Task 1.4 - Perform closing on the image a.tif with a large square
se = strel('square', 50);
clos = imclose(a, se);


% === 2 - Thresholding ===

% Task 2.1 - Load the threshold.tif image, look at its histogram and perform
% thresholding with an appropriate treshold. Display threshold
[lvl] = graythresh(threshold);
gg = im2bw(threshold, lvl); %??

% Task 2.2 - Implement a function that does basic global optimal thresholding 
% (see 11.3.2 in the book). Execute function on threshold.png and display
% the result. (Do not use graytresh)
se = goth(threshold);
imshow(im2bw(threshold, se/255))


% === 3 - Edge detection ===

% Task 3.1 - Load the image edges.tif and use sobel mask to find the edges
% of the image. Display the result
imshow(edge(edges, 'sobel'))

% Task 3.2 - Use the canny edge detector on the edges.png image. Display
% result.
imshow(edge(edges, 'canny'))

% Task 3.3 - Compute the Hough transform of the result from task 2.1. Display
% the Hough transform on the screen.
 [lvl] = graythresh(threshold);
gg = im2bw(threshold, lvl);
imshow(gg)
[H, thet, rh] = hough(threshold, 'ThetaResolution', 0.2);
peaks = houghpeaks(H, 5);
plot(thet(peaks(:, 2)), rh(peaks(:, 1)), 'linestyle', 'none', 'marker', 's', 'color', 'w')

% Task 3.4 - Find the 3 most clear lines using the Hough transform from the 
% previous task and display them on top of the original image
lines = houghlines(threshold, thet, rh, peaks);
figure, imshow(threshold), hold on
for k = 1:length(lines)
xy = [lines(k).point1 ; lines(k).point2];
plot(xy(:,1), xy(:,2), 'LineWidth', 4, 'Color', [.8 .8 .8]);
end

% === 4 - Region Growing ===

% Task 4.1 - Implement a region growing function that takes an image, a
% set of seed points and a threshold as input. The treshold defines the
% maximum difference in intensity between the seed and the candidate pixel 
% the region growing should allow.
regrow()

% Task 4.2 - Perform region growing on the image region.tif to segment the 
% bright sparks in the image. Display the result
regrow(region, 1, 0.25)
imshow(g);

% === 5 - Watershed ===

% Load the image watershed.tif and perform watershed segmentation on the
% gradient information of the image
g = im2bw(watershed, graythresh(watershed));
gc = ~g;
D = bwdist(gc);
L = wathershed(-D);
w = L == 0;
g2 = g & ~w;

% === 6 - Skittle segmentation ===
% Load the image skittles2.jpg and make a system that counts the number of
% green skittles.
% Tips: normalize the colors (that is normalize the color vectors), 
% do a color threshold segmentation and 
% check out the functions imfill, bwconncomp and labelmatrix
norms(skittles2);
b = a(:,:,2);
g = im2bw(b, graythresh(b));
fg = imfill(g,'holes');
c = strel('disk', 1);
er = imerode(fg,c);
bwconncomp(er)

% === 7 - Nail image ===
% First do registration between the two nail scans and then do a comparison 
% of them. You are free to choose your own comparison method.
% For the registration: Load two nail scans, i1 and i2, and call 
% cpselect(i1,i2). In the popup GUI, select 5 or more corresponding points 
% in the two images. Then use cp2tform to compute a piecewise linear 
% transformation and use the imtransform function to transform i1 so that 
% it is registered to i2. Show the results on screen
cpselect(x1,x2)
% velger punkter som matcher.
TFORM = cp2tform(input_points, base_points, 'piecewise linear');
a = imtransform(x1,TFORM);


