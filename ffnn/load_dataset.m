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


N = 5000;

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

DataSet_Images = zeros(10, 784, N3);
DataSet_FFTs = zeros(10, 784, N3);
DataSet_Features = zeros(10, 112, N3);
DataSet_Labels = zeros(10, 3, N3);
DataSet_Labels_1 = zeros(10, 1, N3);

% Total
k = 1;
for i = 1:N
    DataSet_Images_Total(1,:,k) = trianglesI(:, i);
    DataSet_FFTs_Total(1,:,k) = trianglesFFT(:, i);
    DataSet_Labels_1_Total(1,:,k) = 1;
    DataSet_Labels_Total(1,:,k) = [1 0 0 0 0];
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = rectanglesI(:, i);
    DataSet_FFTs_Total(1,:,k) = rectanglesFFT(:, i);
    DataSet_Labels_1_Total(1,:,k) = 2;
    DataSet_Labels_Total(1,:,k) = [0 1 0 0 0];
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = circlesI(:, i);
    DataSet_FFTs_Total(1,:,k) = circlesFFT(:, i);
    DataSet_Labels_1_Total(1,:,k) = 3;
    DataSet_Labels_Total(1,:,k) = [0 0 1 0 0];
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = pentagonesI(:, i);
    DataSet_FFTs_Total(1,:,k) = pentagonesFFT(:, i);
    DataSet_Labels_1_Total(1,:,k) = 4;
    DataSet_Labels_Total(1,:,k) = [0 0 0 1 0];
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
    
    DataSet_Images_Total(1,:,k) = hexagonesI(:, i);
    DataSet_FFTs_Total(1,:,k) = hexagonesFFT(:, i);
    DataSet_Labels_1_Total(1,:,k) = 5;
    DataSet_Labels_Total(1,:,k) = [0 0 0 0 1];
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features_Total(1,:,k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    k = k + 1;
end

% UNIT 1
k = 1;
for i = 1:N
    DataSet_Images(1, :, k) = trianglesI(:, i);
    DataSet_FFTs(1, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(1, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(1, :, k) = [1 0 0];
    DataSet_Labels_1(1, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(1, :, k) = rectanglesI(:, i);
    DataSet_FFTs(1, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(1, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(1, :, k) = [0 1 0];
    DataSet_Labels_1(1, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(1, :, k) = pentagonesI(:, i);
    DataSet_FFTs(1, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(1, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(1, :, k) = [0 0 1];
    DataSet_Labels_1(1, :, k) = -1;
    k = k + 1;
end

% UNIT 2
k = 1;
for i = 1:N
    DataSet_Images(2, :, k) = trianglesI(:, i);
    DataSet_FFTs(2, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(2, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(2, :, k) = [1 0 0];
    DataSet_Labels_1(2, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(2, :, k) = rectanglesI(:, i);
    DataSet_FFTs(2, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(2, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(2, :, k) = [0 1 0];
    DataSet_Labels_1(2, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(2, :, k) = hexagonesI(:, i);
    DataSet_FFTs(2, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(2, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(2, :, k) = [0 0 1];
    DataSet_Labels_1(2, :, k) = -1;
    k = k + 1;
end

% UNIT 3
k = 1;
for i = 1:N
    DataSet_Images(3, :, k) = trianglesI(:, i);
    DataSet_FFTs(3, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(3, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(3, :, k) = [1 0 0];
    DataSet_Labels_1(3, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(3, :, k) = rectanglesI(:, i);
    DataSet_FFTs(3, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(3, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(3, :, k) = [0 1 0];
    DataSet_Labels_1(3, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(3, :, k) = circlesI(:, i);
    DataSet_FFTs(3, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(3, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(3, :, k) = [0 0 1];
    DataSet_Labels_1(3, :, k) = -1;
    k = k + 1;
end

% UNIT 4
k = 1;
for i = 1:N
    DataSet_Images(4, :, k) = trianglesI(:, i);
    DataSet_FFTs(4, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(4, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(4, :, k) = [1 0 0];
    DataSet_Labels_1(4, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(4, :, k) = pentagonesI(:, i);
    DataSet_FFTs(4, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(4, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(4, :, k) = [0 1 0];
    DataSet_Labels_1(4, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(4, :, k) = hexagonesI(:, i);
    DataSet_FFTs(4, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(4, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(4, :, k) = [0 0 1];
    DataSet_Labels_1(4, :, k) = -1;
    k = k + 1;
end

% UNIT 5
k = 1;
for i = 1:N
    DataSet_Images(5, :, k) = trianglesI(:, i);
    DataSet_FFTs(5, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(5, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(5, :, k) = [1 0 0];
    DataSet_Labels_1(5, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(5, :, k) = pentagonesI(:, i);
    DataSet_FFTs(5, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(5, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(5, :, k) = [0 1 0];
    DataSet_Labels_1(5, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(5, :, k) = circlesI(:, i);
    DataSet_FFTs(5, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(5, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(5, :, k) = [0 0 1];
    DataSet_Labels_1(5, :, k) = -1;
    k = k + 1;
end

% UNIT 6
k = 1;
for i = 1:N
    DataSet_Images(6, :, k) = trianglesI(:, i);
    DataSet_FFTs(6, :, k) = trianglesFFT(:, i);
    I = reshape(trianglesI(:, i), [28, 28]);
    fft = reshape(trianglesFFT(:, i), [28, 28]);
    DataSet_Features(6, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(6, :, k) = [1 0 0];
    DataSet_Labels_1(6, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(6, :, k) = hexagonesI(:, i);
    DataSet_FFTs(6, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(6, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(6, :, k) = [0 1 0];
    DataSet_Labels_1(6, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(6, :, k) = circlesI(:, i);
    DataSet_FFTs(6, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(6, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(6, :, k) = [0 0 1];
    DataSet_Labels_1(6, :, k) = -1;
    k = k + 1;
end

% UNIT 7
k = 1;
for i = 1:N
    DataSet_Images(7, :, k) = rectanglesI(:, i);
    DataSet_FFTs(7, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(7, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(7, :, k) = [1 0 0];
    DataSet_Labels_1(7, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(7, :, k) = pentagonesI(:, i);
    DataSet_FFTs(7, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(7, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(7, :, k) = [0 1 0];
    DataSet_Labels_1(7, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(7, :, k) = hexagonesI(:, i);
    DataSet_FFTs(7, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(7, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(7, :, k) = [0 0 1];
    DataSet_Labels_1(7, :, k) = -1;
    k = k + 1;
end

% UNIT 8
k = 1;
for i = 1:N
    DataSet_Images(8, :, k) = rectanglesI(:, i);
    DataSet_FFTs(8, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(8, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(8, :, k) = [1 0 0];
    DataSet_Labels_1(8, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(8, :, k) = pentagonesI(:, i);
    DataSet_FFTs(8, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(8, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(8, :, k) = [0 1 0];
    DataSet_Labels_1(8, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(8, :, k) = circlesI(:, i);
    DataSet_FFTs(8, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(8, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(8, :, k) = [0 0 1];
    DataSet_Labels_1(8, :, k) = -1;
    k = k + 1;
end

% UNIT 9
k = 1;
for i = 1:N
    DataSet_Images(9, :, k) = rectanglesI(:, i);
    DataSet_FFTs(9, :, k) = rectanglesFFT(:, i);
    I = reshape(rectanglesI(:, i), [28, 28]);
    fft = reshape(rectanglesFFT(:, i), [28, 28]);
    DataSet_Features(9, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(9, :, k) = [1 0 0];
    DataSet_Labels_1(9, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(9, :, k) = hexagonesI(:, i);
    DataSet_FFTs(9, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(9, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(9, :, k) = [0 1 0];
    DataSet_Labels_1(9, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(9, :, k) = circlesI(:, i);
    DataSet_FFTs(9, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(9, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(9, :, k) = [0 0 1];
    DataSet_Labels_1(9, :, k) = -1;
    k = k + 1;
end

% UNIT 10
k = 1;
for i = 1:N
    DataSet_Images(10, :, k) = pentagonesI(:, i);
    DataSet_FFTs(10, :, k) = pentagonesFFT(:, i);
    I = reshape(pentagonesI(:, i), [28, 28]);
    fft = reshape(pentagonesFFT(:, i), [28, 28]);
    DataSet_Features(10, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(10, :, k) = [1 0 0];
    DataSet_Labels_1(10, :, k) = 1;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(10, :, k) = hexagonesI(:, i);
    DataSet_FFTs(10, :, k) = hexagonesFFT(:, i);
    I = reshape(hexagonesI(:, i), [28, 28]);
    fft = reshape(hexagonesFFT(:, i), [28, 28]);
    DataSet_Features(10, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(10, :, k) = [0 1 0];
    DataSet_Labels_1(10, :, k) = 0;
    k = k + 1;
end
for i = 1:N
    DataSet_Images(10, :, k) = circlesI(:, i);
    DataSet_FFTs(10, :, k) = circlesFFT(:, i);
    I = reshape(circlesI(:, i), [28, 28]);
    fft = reshape(circlesFFT(:, i), [28, 28]);
    DataSet_Features(10, :, k) = [sum(I), sum(I'), sum(fft), sum(fft')];
    DataSet_Labels(10, :, k) = [0 0 1];
    DataSet_Labels_1(10, :, k) = -1;
    k = k + 1;
end
