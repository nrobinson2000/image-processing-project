image = imread('equation_5.jpg');
image_8 = imread('8.jpg');


gray_image = rgb2gray(image);
gray_thresh = graythresh(gray_image);
disp(gray_thresh);

% filtered = imgaussfilt(image, 0.1);
lap_filter = fspecial('laplacian',0.2); 
mean_filter = fspecial('average',[6 6]);
binarized_image = imbinarize(gray_image, 0.4);
filtered = imfilter(binarized_image, mean_filter);
filtered = imcomplement(filtered);

lineSE = strel('line',1,45);

rectSE = strel('rectangle',[15 15]);
diskSE = strel('disk',11);

% cleaned = imerode(filtered, diskSE);

cleaned = imdilate(filtered, rectSE);
cleaned = imopen(cleaned, diskSE);



figure
subplot (3,2,1); imshow(image); title('Original');
subplot (3,2,2); imshow(gray_image); title('Gray');
subplot (3,2,3); imshow(binarized_image); title('binarized');
subplot (3,2,4); imshow(filtered); title('Filtered');
subplot (3,2,5); imshow(cleaned); title('Cleaned');


