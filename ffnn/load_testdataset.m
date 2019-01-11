triangleFolder = '_img_/TEST/3-gone/';       % label: 1
rectangleFolder = '_img_/TEST/4-gone/';      % label: 2
circleFolder = '_img_/TEST/100-gone/';       % label: 3
pentagonFolder = '_img_/TEST/5-gone/';       % label: 4
hexagonFolder = '_img_/TEST/6-gone/';        % label: 5

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

N = 200;

trianglesI = zeros(784, N);
rectanglesI = zeros(784, N);
circlesI = zeros(784, N);
pentagonesI = zeros(784, N);
hexagonesI = zeros(784, N);
trianglesFFT = zeros(784, N);
rectanglesFFT = zeros(784, N);
circlesFFT = zeros(784, N);
pentagonesFFT = zeros(784, N);
hexagonesFFT = zeros(784, N);

for i = 1:N
    fpath = strcat(triangleFolder, fileListTriangles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);    
    trianglesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    trianglesFFT(:, i) = I;
    
    fpath = strcat(rectangleFolder, fileListRectangles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    rectanglesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    rectanglesFFT(:, i) = I;
    
    fpath = strcat(circleFolder, fileListCircles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    circlesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    circlesFFT(:, i) = I;
    
    fpath = strcat(pentagonFolder, fileListPentagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    pentagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    pentagonesFFT(:, i) = I;
    
    fpath = strcat(hexagonFolder, fileListHexagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    hexagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    hexagonesFFT(:, i) = I;
end

N5 = 5 * N;
TestDataSet_Images_Total = zeros(1, 784, N5);
TestDataSet_Labels_Total = zeros(1, 5, N5);
TestDataSet_FFTs_Total = zeros(1, 784, N5);
TestDataSet_Features_Total = zeros(1, 112, N5);

% Total
k = 1;
for i = 1:N
    TestDataSet_Images_Total(1,:,k) = trianglesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = trianglesFFT(:, i);
    TestDataSet_Labels_Total(1,:,k) = [1 0 0 0 0];
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    TestDataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = rectanglesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = rectanglesFFT(:, i);
    TestDataSet_Labels_Total(1,:,k) = [0 1 0 0 0];
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    TestDataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = circlesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = circlesFFT(:, i);
    TestDataSet_Labels_Total(1,:,k) = [0 0 1 0 0];
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    TestDataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = pentagonesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = pentagonesFFT(:, i);
    TestDataSet_Labels_Total(1,:,k) = [0 0 0 1 0];
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    TestDataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = hexagonesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = hexagonesFFT(:, i);
    TestDataSet_Labels_Total(1,:,k) = [0 0 0 0 1];
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    TestDataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
end