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

N = 20;

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
TestDataSet_Images_Total = zeros(1, P_size, N5);
TestDataSet_FFTs_Total = zeros(1, P_size, N5);

% Total
k = 1;
for i = 1:N
    TestDataSet_Images_Total(1,:,k) = trianglesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = trianglesFFT(:, i);
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = rectanglesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = rectanglesFFT(:, i);
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = circlesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = circlesFFT(:, i);
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = pentagonesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = pentagonesFFT(:, i);
    k = k + 1;
    
    TestDataSet_Images_Total(1,:,k) = hexagonesI(:, i);
    TestDataSet_FFTs_Total(1,:,k) = hexagonesFFT(:, i);
    k = k + 1;
end

TestImages = squeeze(TestDataSet_Images_Total(1, :, :));
TestFFTs = squeeze(TestDataSet_FFTs_Total(1, :, :));

for i = 1:P_size
    for j = 1:N5
        TestImages(i, j) = round(TestImages(i, j)/256);
        if (TestImages(i, j) == 0)
            TestImages(i, j) = -1;
        end
        if (TestImages(i, j) > 1)
            TestImages(i, j) = 1;
        end
        TestFFTs(i, j) = round(TestFFTs(i, j)/256);
        if (TestFFTs(i, j) == 0)
            TestFFTs(i, j) = -1;
        end
        if (TestFFTs(i, j) > 1)
            TestFFTs(i, j) = 1;
        end
    end
end

I = reshape(TestImages(:, 1), [hvP_size, hvP_size]);
imagesc(I);
% I = reshape(TestFFTs(:, 2), [hvP_size, hvP_size]);
% imagesc(I);






