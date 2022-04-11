image = imread('equation_2.jpg');
gray_image = rgb2gray(image);
gray_thresh = graythresh(gray_image);
disp(gray_thresh);
binarized_image = imbinarize(gray_image);
% filtered = imgaussfilt(image, 0.1);
lap_filter = fspecial('laplacian',0.2); 
mean_filter = fspecial('average',[6 6]);



filtered = imfilter(binarized_image, mean_filter);
figure
% imshow(filtered);
filtered = imcomplement(filtered);


rectSE = strel('rectangle',[10 10]);
diskSE = strel('disk',1);

% cleaned = imerode(filtered, diskSE);

cleaned = imdilate(filtered, rectSE);
cleaned = imopen(cleaned, diskSE);

% imwrite(filtered,'.png');

figure
subplot (3,2,1); imshow(image); title('Original');
subplot (3,2,2); imshow(gray_image); title('Gray');
subplot (3,2,3); imshow(binarized_image); title('binarized');
subplot (3,2,4); imshow(filtered); title('Filtered');
subplot (3,2,5); imshow(cleaned); title('Cleaned');


