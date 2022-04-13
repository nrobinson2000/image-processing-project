originalImage = imread('equation_5.jpg');

% Conversion to grayScale image
grayImage = rgb2gray(originalImage);
% Conversion to binary image
threshold = graythresh(grayImage);
binaryImage = ~imbinarize(grayImage,threshold);
% Removes all object containing fewer than 30 pixels
diskSE = strel('disk',9);
lineSE = strel('line',15, 90);
moddedImage = bwareaopen(binaryImage,30);
moddedImage = imdilate(moddedImage, diskSE);

imwrite(moddedImage,'test_image.png');

figure
subplot(1,2,1); title('Original'); imshow(originalImage);
subplot(1,2,2); title('Binarized'); imshow(moddedImage);