% Load dataset (dataset will be in an 3D matrix called VolumeData)
load('brain.mat');

% Create an empty segmentation
segmentation = zeros(size(VolumeData));

% TODO: Do ventricle segmentation

% x: 133 - 51
% y: 159 - 63
% z; 105 - 65

% 750 - 715
% 760 - 705


segmentation = ventricleSeg(VolumeData);

% Store result to disk, 'segmentation_ventricle.raw' can be changed to a specific file path
writeToRaw(segmentation, 'segmentation_ventricle.raw');

% Create an empty segmentation
segmentation = zeros(size(VolumeData));

% TODO: Do brain segmentation
% z; 157 - 9
% x: 164 - 17
% y: 200 - 19

% 1600 - 2402

segmentation = brainSeg(VolumeData);

% Store result to disk, 'segmentation_brain.raw' can be changed to a specific file path
writeToRaw(segmentation, 'segmentation_brain.raw');