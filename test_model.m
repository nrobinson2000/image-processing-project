load('net.mat');
predictDataSetPath = fullfile('segmentedImages');
imdsPred = imageDatastore(predictDataSetPath,'IncludeSubfolders',true);
YPred = classify(net,imdsPred);
[numFiles, n] = size(imdsPred.Files);
figure
image = imread(imdsPred.Files{1});
disp(size(image));
imshow(image);
figure


for i = 1:numFiles
    subplot(3,3,i);
    imshow(imdsPred.Files{i});
    title("Predicted Label: " + string(YPred(i)));
end