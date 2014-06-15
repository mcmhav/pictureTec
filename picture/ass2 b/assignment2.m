% Assignment 2 - Intensity transformation and filtering
% TDT4195 - Image Techniques
% ================================================
% Add code to this file where indicated and deliver on Itslearning before deadline


%!!!!!!!!!!!!!!FOR EACH CREATED/RESTORED IMAGE: SAVE IT AND UPLOAD ON ITSLEARNING!!!!!!!!!!

% === 1 - Intensity and Histogram processing ===

% Task 1.1 - Load the image dark.tif. Display the histogram on the screen. 
% Then use the imadjust function to make the image more visible, 
% show the new image and its histogram on screen
darkd = im2double(dark);
hist(darkd);
darka = imadjust(dark);
image(darka);

% Task 1.2 - Use the built-in Histogram Equalization function on the
% dark.png image
hist(darkd);

% Task 1.3 - Create a 4x4 image with random values from 0 to 7. Make a
% program that performs Histogram Equalization on this image. (do not use
% the built-in HE function) See 3.2.2 in the book. Tip: first create a
% histogram, then normalize it, create cumulative distribution function and
% then do the intensity transformation.

image = ceil(rand(4,4)*8) - 1; % Creates a 4x4 random image with values 0 to 7
output = zeros(4,4); % the output image after HE
n = 4*4; % total size of image

histval = countunique(image);


% Make Histogram
histodraw(image);
% Normalize histogram
%sum(sum(image zk))
nomer(histval)

% Make cumulative distribution function (CDF)
% seg selv pluss forrige
cum(histval);

% Do intensity transformation based on CDF
%gange med 7 og runne opp
cum(histval*7); % ?

% Task 1.4 - Load the image mamm.tif and perform Histogram matching on this
% image with a gaussian with mean 0.5 and std 0.25. You can use the
% supplied gaussian function
histeq(mamm, h)

% Task 1.5 - Load the image space.tif. Show the histogram and use HE to try
% to spread the intensity values. Look at both images. What happens? 
% Try to use Local adaptive Histogram Equalization instead and experiment 
% with the number of tiles to create the best result. Show the histogram 
% after local adaptive HE. What was best? Why?

histeq(space) % it gets lighter. "New" parts of the image becomes visible. 


% === 2 - Spatial filtering ===

% Task 2.1 - Implement a filter with an averaging (filter)mask for images as a function 
% and make it possible to set the size of the filtering area (do not use the 
% built-in filtering functions) Tip: Use the matlab function sum() to 
% retrieve the sum of all values in an array
%loop alle pixel, lager nytt bilde, samme størrelse, for hvert pixel sum
%over nabo loop x
%           loop y
%              sum(image())/30 setter dette inn i det nye bildet, istede
%              for sum bruker noe annet og ikke dele på 30.
% im noise
imshow(medianfilter(space)) % gets too light compared to medfilt2(space)

% Task 2.2 - Implement the median filter for images as a function
% and make it possible to set the size of the filtering area (do not use the 
% built-in filtering/median functions). Tip: Use the matlab function 
% median() to retrieve the median value of an array
spaced = im2double(space);
figure(1), imshow(realmedianfunction(spaced,10))  % spaced = picture, 10 is areal


% Task 2.3 - Create a gaussian mask with standard deviation = 1.0 and size 3x3
spaced = im2double(space);
spaceg = gaussianmask(spaced);

% Task 2.4 - Load image assignment.png and convert it to grayscale and double 
% (values from 0.0 to 1.0)
ass = rgb2gray(assignment);
assd = im2double(ass);

% Task 2.5 - Filter the image with the gaussian mask in task 3 and show the
% image on screen
imshow(gaussianmask(assd));

% Task 2.6 - Create a copy of the image in task 4 with salt-and-pepper noise 
% and another copy of the image with gaussian noise. Show both images on
% screen
assdalt = imnoise(assd,'salt & pepper',0.02);
assdaltgaus = imnoise(gaussianmask(assd),'salt & pepper',0.02);
figure(1), imshow(assdalt);

figure(2), imshow(assdaltgaus);            
figure(3), imshow(gaussianmask(assd));     

% Task 2.7 - For each noise type use an appropriate spatial filtering method to remove the noise 
% and experiment with different parameter values for the filtering methods
figure(5), imshow(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(assdaltgaus))))))))
figure(9), imshow(realmedianfunction(assdaltgaus, 10))
figure(10), imshow(realmedianfunction(assdaltgaus, 5))
figure(11), imshow(realmedianfunction(assdaltgaus, 3))
figure(12), imshow(realmedianfunction(assdaltgaus, 2))
figure(13), imshow(realmedianfunction(assdaltgaus, 1)) % nice
figure(14), imshow(assdaltgaus)

figure(6), imshow(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(gaussianmask(assdalt))))))))
figure(7), imshow(realmedianfunction(assdalt, 10)) % too much
figure(8), imshow(realmedianfunction(assdalt, 5)) % still too much
figure(3), imshow(realmedianfunction(assdalt, 3)) % ok
figure(3), imshow(realmedianfunction(assdalt, 2)) % nice
figure(3), imshow(realmedianfunction(assdalt, 1)) % real nice

% Task 2.8 - Calculate the image gradients of assingment.png (task 2.4)
FX = gradient(assd);

% Task 2.9 - Show the vector field of the image gradients on top of the image 
% by using the quiver function after the following statement: 
% figure; imshow(<original image>), axis image; hold on; (zoom in to
% see all the vectors properly)
figure; imshow(assd), axis image; hold on;
figure; imshow(FX), axis image; hold on;


% Task 2.10 - Calculate the magnitude of this vector field and display it
magn = magnitude(FX);
figure; imshow(magn);

% Task 2.11 - Blur assignment.png and then sharpen(improve the edges/remove
% blur) the blurred image. Show the images on screen
gaussianFilter = [1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];
gaussianFilter = gaussianFilter / sum(sum(gaussianFilter));
assb = imfilter(assignment, gaussianFilter);
imshow(assb)
figure, imshow(assignment);
edgeFilter = [-1,-1,-1;-1,8,-1;-1,-1,-1];
asse = imfilter(assb, edgeFilter);
figure, imshow(asse)
asss = asse + assb;
figure, imshow(asss)

% === 3 - Frequency filtering ===

% !!! Functions from the book can be downloaded from: 
% http://www.gatesmark-orders.com/student_application_dipum2e_support_package.php

% Task 3.1 - Perform blurring and find edges of the same image as in task 
% 2.4 by filtering in the Frequency domain. You can use the lpfilter and 
% hpfilter functions from the book, but not dftfilt.
%kan bruke lpfilter, hpfilter, cnotch
%fft fileter, vanlig matrisemultiplikasjon, så vi kan lage disse?
%inverser
%viser
assd = im2double(assignment);
h = fspecial('disk', 4);
assb = imfilter(assd,h,'circular');
imshow(assb)

noise = assb + (10^(-40/20)*abs(1-0))*randn(size(assb));
figure, imshow(noise)
assw = deconvwnr(noise,h,numel(assd)*(10^(-40/20)*abs(1-0))^2./(abs(fft2(assd)).^2));  % lånt fra http://blogs.mathworks.com/steve/2007/11/02/image-deblurring-wiener-filter/
figure, imshow(assw)

% Task 3.2 - Load the image clown.png convert it to double(0.0 to 1.0) and
% remove the periodic noise using a reject filter in the frequency domain.
% You can use the cnotch function from the book. Tip: use
% tools->data cursor to find coordinates in the image displayed with imshow
%fjerne støy
%lager spekter og ser på det. s = log(1 + abs(fspshift)) hvor frekvensen på
%støen er. får en maske.
cd = im2double(clown);
freq(clown) 