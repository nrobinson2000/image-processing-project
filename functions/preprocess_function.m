function image = preprocess_function(image)
    % Conversion to grayScale image
    grayImage = rgb2gray(image);
    % Conversion to binary image
    threshold = graythresh(grayImage);
    binaryImage = ~imbinarize(grayImage,threshold);
    % Removes all object containing fewer than 30 pixels
    diskSE = strel('disk',9);
    moddedImage = bwareaopen(binaryImage,30);
    image = imdilate(moddedImage, diskSE);
end