function [prediction] = predict_function()
    prediction = "";
    load('main_net.mat');
    predictDataSetPath = fullfile('segmentedImages');
    imdsPred = imageDatastore(predictDataSetPath,'IncludeSubfolders',true);
    YPred = classify(net,imdsPred);
    [numFiles, n] = size(imdsPred.Files);
%     figure
%     image = imread(imdsPred.Files{1});
%     figure

    for i = 1:numFiles 
        char = string(YPred(i));
        if char == "times"
            char = "*";
        elseif char == "div"
            char = "/";
        end
        prediction = prediction + char;
    end
end