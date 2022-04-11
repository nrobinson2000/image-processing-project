path = fullfile('C:\Users\duongp\Desktop\WIT School Work\Senior\SEM II\Image Processing','data');
imds = imageDatastore(path, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainingFiles = 750;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');

% layers = [ ...
%     imageInputLayer([28 28 1])
%     %first convolution
%     convolution2dLayer(3,64,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,64,'Stride',1,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %second convolution
%     convolution2dLayer(3,128,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,128,'Stride',1,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %third convolution
%     convolution2dLayer(3,256,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,256,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,256,'Stride',1,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %fourth convolution
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %fifth convolution
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,512,'Stride',1,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(1,'Stride',2,'Name','UNPOOL')
%     fullyConnectedLayer(17)
%     reluLayer
%     fullyConnectedLayer(17)
%     dropoutLayer(0.5)
%     reluLayer
%     fullyConnectedLayer(17)
%     dropoutLayer(0.5)
%     reluLayer
%     softmaxLayer
%     classificationLayer
%     ];

layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3,20)
    reluLayer
    convolution2dLayer(3,20)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    fullyConnectedLayer(17)
    softmaxLayer
    classificationLayer
    ];

options = trainingOptions('sgdm', ...
    'MaxEpochs',20,...
    'InitialLearnRate',1e-4, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest);
disp(accuracy);
save net