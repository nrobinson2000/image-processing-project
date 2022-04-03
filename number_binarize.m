location = 'C:\Users\laskeyp\Desktop\School\numberimage'; %change to fit correct location
data = imageDatastore(location);

for j = 1:17 %change to fit number of photos
    img = read(data);
    B = imbinarize(rgb2gray(img));
    for i = 1:17
        imwrite(B, sprintf('%d.jpg', i))
    end    
end    