function main(image)
    preprocessed_image = preprocess_function(image);
    segment_function(preprocessed_image);
    pred = predict_function();
    disp(pred);
    disp(str2sym(pred));    
end