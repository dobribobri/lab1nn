function save_image(folder,baseFileName,fullFileName,img_data)

numberSuffix = 1;
while numberSuffix < 500 % Exit at 500 as a failsafe, just in case all files exist.
    if exist(fullFileName, 'file')
        % Construct a new filename.
        baseFileName = sprintf([baseFileName '-0%d'], numberSuffix);
        fullFileName = [folder  baseFileName  '.png'];
        % Prepare for next time, in case this name also existed.
        numberSuffix  = numberSuffix  + 1;
    else
        break; % Out of while loop
    end
end;

img_data = imresize(img_data, [100, 100], 'bicubic'); %Resize image to resolution 320x240
imwrite(img_data, fullFileName);
disp([folder 'image saved...'])