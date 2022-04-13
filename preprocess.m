path = fullfile('C:\Users\duongp\Desktop\WIT School Work\Senior\SEM II\Image Processing','data2',')');
imds = imageDatastore(path);
[numFiles, n] = size(imds.Files);
image_path = imds.Files{5};
image = imread(image_path);

% image = imcomplement(image);
% rectSE = strel('rectangle',[10 10]);
% diskSE = strel('disk',2);
% binarized = imbinarize(image);
% binarized = imdilate(binarized, diskSE);
% binarized = imgaussfilt(double(binarized));
% binarized = padarray(imresize(binarized, [20 20]), [4 4],0, 'both');
% imshow(binarized);

for i=1:numFiles
    image_path = imds.Files{i};
    image = imread(image_path);
    image = imcomplement(image);
    diskSE = strel('disk',2);
    binarized = imbinarize(image);
    binarized = imdilate(binarized, diskSE);
    binarized = imgaussfilt(double(binarized),1);
    binarized = padarray(imresize(binarized, [20 20]), [4 4],0, 'both');
    image_path = strrep(image_path,'.jpg','.png');
    imwrite(binarized, image_path);
end



