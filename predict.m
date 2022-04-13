function predict(I)
    image = imread(I);

    %binarization
    gray_image = rgb2gray(image);
    gray_thresh = graythresh(gray_image);
    disp(gray_thresh);
    binarized_image = imbinarize(gray_image);
    % filtered = imgaussfilt(image, 0.1);
    lap_filter = fspecial('laplacian',0.2); 
    mean_filter = fspecial('average',[6 6]);
    filtered = imfilter(binarized_image, mean_filter);
    filtered = imcomplement(filtered);
    rectSE = strel('rectangle',[15 15]);
    diskSE = strel('disk',11);
    cleaned = imdilate(filtered, rectSE);
    cleaned = imopen(cleaned, diskSE);

    %segmentation
    moddedImage = cleaned;
    [L,Ne] = bwlabel(moddedImage);
    % Measuring properties of image regions
    propied = regionprops(L,'BoundingBox');
    % hold on
    % Plot Bounding Box
    % for n=1:size(propied,1)
    %     rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    % end
    % figure
    for n=1:Ne
    %     subplot(5,5,n);
        [r,c] = find(L==n);
        n1 = moddedImage(min(r):max(r),min(c):max(c));
    %     imshow(n1);
        [h,w] = size(n1);
        if h<w
            padding = ceil((w-h)/2);
            n1 = padarray(n1, [padding 0],0,'both');
        elseif h>w
            padding = ceil((h-w)/2);
            n1 = padarray(n1, [0 padding],0,'both');
        end
    %     subplot(5,5,10+n);
        n1 = imresize(n1,[28 28]);
    %     imshow(n1);
        fullFileName = fullfile('segmentedImages', sprintf('image%d.png', n));
        imwrite(n1, fullFileName);
        pause(1)
    end

    %load model and predict
    load('net.mat');
    predictDataSetPath = fullfile('segmentedImages');
    imdsPred = imageDatastore(predictDataSetPath,'IncludeSubfolders',true);
    YPred = classify(net,imdsPred);
    [numFiles, n] = size(imdsPred.Files);
    figure
    for i = 1:numFiles
        subplot(3,3,i);
        imshow(imdsPred.Files{i});
        title("Predicted Label: " + string(YPred(i)));
    end
end
