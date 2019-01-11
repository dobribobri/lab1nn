triangleFolder = '../ffnn/_img_/3-gone/';       % label: 1
rectangleFolder = '../ffnn/_img_/4-gone/';      % label: 2
circleFolder = '../ffnn/_img_/100-gone/';       % label: 3
pentagonFolder = '../ffnn/_img_/5-gone/';       % label: 4
hexagonFolder = '../ffnn/_img_/6-gone/';        % label: 5

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


N = 100;

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
% trianglesL = zeros(1, N);
% rectanglesL = zeros(1, N);
% circlesL = zeros(1, N);
% pentagonesL = zeros(1, N);
% hexagonesL = zeros(1, N);

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
%   trianglesL(i) = 1;
    
    fpath = strcat(rectangleFolder, fileListRectangles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    rectanglesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    rectanglesFFT(:, i) = I;
%   rectanglesL(i) = 2;
    
    fpath = strcat(circleFolder, fileListCircles{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    circlesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    circlesFFT(:, i) = I;
%   circlesL(i) = 3;
    
    fpath = strcat(pentagonFolder, fileListPentagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    pentagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    pentagonesFFT(:, i) = I;
%   pentagonesL(i) = 4;
    
    fpath = strcat(hexagonFolder, fileListHexagones{i});
    disp(fpath);
    I = imread(fpath);
    I = imresize(I, [28 28]);
    II = reshape(I(:,:,1), [784, 1]);
    hexagonesI(:, i) = II;
    I = fft2(I);
    I = reshape(abs(fftshift(I(:,:,1))), [784,1]);
    hexagonesFFT(:, i) = I;
%   hexagonesL(i) = 5;
end

N3 = 3 * N;
N5 = 5 * N;
DataSet_Images_Total = zeros(1, 784, N5);
DataSet_Labels_Total = zeros(1, 5, N5);
DataSet_Labels_1_Total = zeros(1, 1, N5);
DataSet_FFTs_Total = zeros(1, 784, N5);
DataSet_Features_Total = zeros(1, 112, N5);

% Total
k = 1;
for i = 1:N
    DataSet_Images_Total(1,:,k) = trianglesI(:, i)/256;
    F = trianglesFFT(:, i)/10000;
    F(F>1) = 1;
    DataSet_FFTs_Total(1,:,k) = F;
    DataSet_Labels_1_Total(1,:,k) = 1;
    DataSet_Labels_Total(1,:,k) = [1 0 0 0 0];
    I = reshape(trianglesI(:, i)/256, [28, 28]);
    fft = reshape(F, [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = rectanglesI(:, i)/256;
    F = rectanglesFFT(:, i)/10000;
    F(F>1) = 1;
    DataSet_FFTs_Total(1,:,k) = F;
    DataSet_Labels_1_Total(1,:,k) = 2;
    DataSet_Labels_Total(1,:,k) = [0 1 0 0 0];
    I = reshape(rectanglesI(:, i)/256, [28, 28]);
    fft = reshape(F, [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = circlesI(:, i)/256;
    F = circlesFFT(:, i)/10000;
    F(F>1) = 1;
    DataSet_FFTs_Total(1,:,k) = F;
    DataSet_Labels_1_Total(1,:,k) = 3;
    DataSet_Labels_Total(1,:,k) = [0 0 1 0 0];
    I = reshape(circlesI(:, i)/256, [28, 28]);
    fft = reshape(F, [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = pentagonesI(:, i)/256;
    F = pentagonesFFT(:, i)/10000;
    DataSet_FFTs_Total(1,:,k) = F;
    DataSet_Labels_1_Total(1,:,k) = 4;
    DataSet_Labels_Total(1,:,k) = [0 0 0 1 0];
    I = reshape(pentagonesI(:, i)/256, [28, 28]);
    fft = reshape(F, [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = hexagonesI(:, i)/256;
    F = hexagonesFFT(:, i)/10000;
    DataSet_FFTs_Total(1,:,k) = F;
    DataSet_Labels_1_Total(1,:,k) = 5;
    DataSet_Labels_Total(1,:,k) = [0 0 0 0 1];
    I = reshape(hexagonesI(:, i)/256, [28, 28]);
    fft = reshape(F, [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
end