L = zeros(784, 2);
L(:, 2) = ones(784, 1);
% 
net = newc(L, 5);

P = squeeze(DataSet_Images_Total(1, :, :));
% P = squeeze(DataSet_FFTs_Total(1, :, :));

% L = zeros(112, 2);
% L(:, 2) = ones(112, 1);

% net = newc(L, 5);
% 
% P = squeeze(DataSet_Features_Total(1, :, :));


net = train(net, P);