path = fullfile('C:\Users\duongp\Desktop\WIT School Work\Senior\SEM II\Image Processing','data2');
imds = imageDatastore(path, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainingFiles = 750;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');

% layers = [ ...
%     imageInputLayer([28 28])
%     %first convolution
%     convolution2dLayer(3,16)
%     reluLayer
%     convolution2dLayer(3,16)
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %second convolution
%     convolution2dLayer(3,32)
%     reluLayer
%     convolution2dLayer(3,32)
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     %third convolution
%     convolution2dLayer(3,64)
%     reluLayer
%     convolution2dLayer(3,64,'Padding',1)
%     reluLayer
%     convolution2dLayer(3,64,'Padding',1)
%     reluLayer('Name','Layer24')
%     maxPooling2dLayer(2,'Stride',2,'Name','MaxPool3 Layer')
%     %fourth convolution
%     convolution2dLayer(3,128,'Padding',2)
%     reluLayer
%     convolution2dLayer(3,128)
%     reluLayer
%     convolution2dLayer(3,128,'Padding',1)
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2,'Padding',1)
%     %fifth convolution
%     convolution2dLayer(3,256,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,256,'Padding','same')
%     reluLayer
%     convolution2dLayer(3,256,'Padding','same')
%     reluLayer
%     maxPooling2dLayer(1,'Stride',1,'Name','UNPOOL')
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
    imageInputLayer([28 28])
    convolution2dLayer(3,20)
    reluLayer
    convolution2dLayer(3,20)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    dropoutLayer(0.7)
    fullyConnectedLayer(16)
    softmaxLayer
    classificationLayer
    ];

% layers = [
%     imageInputLayer([28 28],'Name','Input Layer')
%     convolution2dLayer(3,16,'Padding',[1 1])
%     reluLayer
%     convolution2dLayer(3,16,'Padding',[1 1])
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     convolution2dLayer(3,32,'Padding',[1 1])
%     reluLayer
%     convolution2dLayer(3,32,'Padding',[1 1])
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     convolution2dLayer(3,64,'Padding',[1 1])
%     reluLayer
%     convolution2dLayer(3,64,'Padding',[1 1])
%     reluLayer
%     convolution2dLayer(3,64,'Padding',[1 1])
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     fullyConnectedLayer(16)
%     reluLayer
%     dropoutLayer(0.5)
%     fullyConnectedLayer(16)
% %     reluLayer
% %     dropoutLayer(0.5)
% %     fullyConnectedLayer(16)
%     softmaxLayer
%     classificationLayer
%     ];

options = trainingOptions('sgdm', ...
    'MaxEpochs',40,...
    'InitialLearnRate',1e-4, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest);
disp(accuracy);
save net