triangleFolder = '_img_/3-gone/';       % label: 1
rectangleFolder = '_img_/4-gone/';      % label: 2
circleFolder = '_img_/100-gone/';       % label: 3
pentagonFolder = '_img_/5-gone/';       % label: 4
hexagonFolder = '_img_/6-gone/';        % label: 5

% getting filelists 
dirData = dir(triangleFolder);
dirIndex = [dirData.isdir];
fileListTriangles = {dirData(~dirIndex).name}';
dirData = dir(rectangleFolder);
dirIndex = [dirData.isdir];
fileListRectangles = {dirData(~dirIndex).name}';
dirData = dir(circleFolder);
dirIndex = [dirData.isdir];
fileListCircles = {dirData(~dirIndex).name}';
dirData = dir(pentagonFolder);
dirIndex = [dirData.isdir];
fileListPentagones = {dirData(~dirIndex).name}';
dirData = dir(hexagonFolder);
dirIndex = [dirData.isdir];
fileListHexagones = {dirData(~dirIndex).name}';

N = 1;
hvP_size = 28;
P_size = hvP_size * hvP_size;

trianglesI = zeros(P_size, N);
rectanglesI = zeros(P_size, N);
circlesI = zeros(P_size, N);
pentagonesI = zeros(P_size, N);
hexagonesI = zeros(P_size, N);
trianglesFFT = zeros(P_size, N);
rectanglesFFT = zeros(P_size, N);
circlesFFT = zeros(P_size, N);
pentagonesFFT = zeros(P_size, N);
hexagonesFFT = zeros(P_size, N);

for i = 1:N
    fpath = strcat(triangleFolder, fileListTriangles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [hvP_size hvP_size]);
    II = reshape(I(:,:,1), [P_size, 1]);    
    trianglesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [P_size,1]);
    trianglesFFT(:, i) = I;
    
    fpath = strcat(rectangleFolder, fileListRectangles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [hvP_size hvP_size]);
    II = reshape(I(:,:,1), [P_size, 1]);
    rectanglesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [P_size,1]);
    rectanglesFFT(:, i) = I;
    
    fpath = strcat(circleFolder, fileListCircles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [hvP_size hvP_size]);
    II = reshape(I(:,:,1), [P_size, 1]);
    circlesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [P_size,1]);
    circlesFFT(:, i) = I;
    
    fpath = strcat(pentagonFolder, fileListPentagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [hvP_size hvP_size]);
    II = reshape(I(:,:,1), [P_size, 1]);
    pentagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [P_size,1]);
    pentagonesFFT(:, i) = I;
    
    fpath = strcat(hexagonFolder, fileListHexagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [hvP_size hvP_size]);
    II = reshape(I(:,:,1), [P_size, 1]);
    hexagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [P_size,1]);
    hexagonesFFT(:, i) = I;
end

N5 = 5 * N;
DataSet_Images_Total = zeros(1, P_size, N5);
DataSet_FFTs_Total = zeros(1, P_size, N5);

% Total
k = 1;
for i = 1:N
    DataSet_Images_Total(1,:,k) = trianglesI(:, i);
    DataSet_FFTs_Total(1,:,k) = trianglesFFT(:, i);
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = rectanglesI(:, i);
    DataSet_FFTs_Total(1,:,k) = rectanglesFFT(:, i);
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = circlesI(:, i);
    DataSet_FFTs_Total(1,:,k) = circlesFFT(:, i);
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = pentagonesI(:, i);
    DataSet_FFTs_Total(1,:,k) = pentagonesFFT(:, i);
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = hexagonesI(:, i);
    DataSet_FFTs_Total(1,:,k) = hexagonesFFT(:, i);
    k = k + 1;
end

Images = squeeze(DataSet_Images_Total(1, :, :));
FFTs = squeeze(DataSet_FFTs_Total(1, :, :));
for i = 1:P_size
    for j = 1:N5
        Images(i, j) = round(Images(i, j)/256);
        if (Images(i, j) == 0)
            Images(i, j) = -1;
        end
        if (Images(i, j) > 1)
            Images(i, j) = 1;
        end
        FFTs(i, j) = round(FFTs(i, j)/256);
        if (FFTs(i, j) == 0)
            FFTs(i, j) = -1;
        end
        if (FFTs(i, j) > 1)
            FFTs(i, j) = 1;
        end
    end
end

I = reshape(Images(:, 5), [hvP_size, hvP_size]);
imagesc(I);
% I = reshape(FFTs(:, 5), [hvP_size, hvP_size]);
% imagesc(I);


