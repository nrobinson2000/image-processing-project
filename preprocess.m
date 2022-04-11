path = fullfile('C:\Users\duongp\Desktop\WIT School Work\Senior\SEM II\Image Processing','data','1');
imds = imageDatastore(path);
[numFiles, n] = size(imds.Files);
image_path = imds.Files{1};
image = imread(image_path);
binarized = imbinarize(image);
imshow(binarized);

% for i=1:numFiles
%     image_path = imds.Files{i};
%     image = imread(image_path);
%     inverted = imcomplement(image);
%     inverted = imresize(inverted, [28 28]);
%     image_path = strrep(image_path,'.jpg','.png');
%     imwrite(inverted, image_path);
% end



