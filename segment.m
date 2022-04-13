image = imread('test_image.png');
imshow(image);
moddedImage = image;
[L,Ne] = bwlabel(moddedImage);
% Measuring properties of image regions
propied = regionprops(L,'BoundingBox');
hold on
% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
figure
for n=1:Ne
    subplot(5,5,n);
    [r,c] = find(L==n);
    n1 = moddedImage(min(r):max(r),min(c):max(c));
    imshow(n1);
    [h,w] = size(n1);
    if h<w
        padding = ceil((w-h)/2);
        n1 = padarray(n1, [padding 0],0,'both');
    elseif h>w
        padding = ceil((h-w)/2);
        n1 = padarray(n1, [0 padding],0,'both');
    end
    subplot(5,5,10+n);
%     n1 = imresize(n1,[28 28]);
%     n1 = imresize(n1,[128 128]);
    n1 = imgaussfilt(double(n1),1);
    n1 = padarray(imresize(n1, [20 20]), [4 4],0, 'both');
    imshow(n1);
    fullFileName = fullfile('segmentedImages', sprintf('image%d.png', n));
    imwrite(n1, fullFileName);
    pause(1)
end
