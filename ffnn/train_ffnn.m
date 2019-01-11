% Train function
trainFcn = 'trainscg';
% trainFcn = 'traingd';
% trainFcn = 'trainb';

% Construct Global NN
net = feedforwardnet(56, trainFcn);
% net.layers{1}.transferFcn = 'poslin'; % activation func

% % Construct Partial NNs
nC = 56;
net1 = feedforwardnet(nC, trainFcn);
net2 = feedforwardnet(nC, trainFcn);
net3 = feedforwardnet(nC, trainFcn);
net4 = feedforwardnet(nC, trainFcn);
net5 = feedforwardnet(nC, trainFcn);
net6 = feedforwardnet(nC, trainFcn);
net7 = feedforwardnet(nC, trainFcn);
net8 = feedforwardnet(nC, trainFcn);
net9 = feedforwardnet(nC, trainFcn);
net10 = feedforwardnet(nC, trainFcn);

% Go & Train
% Global
images = squeeze(DataSet_Features_Total(1,:,:));
labels = squeeze(DataSet_Labels_Total(1,:,:));
[net, tr] = train(net, images, labels);

% Partial
% unit 1
images = squeeze(DataSet_Features(1,:,:));
labels = squeeze(DataSet_Labels(1,:,:));
[net1, tr1] = train(net1, images, labels);
% unit 2
images = squeeze(DataSet_Features(2,:,:));
labels = squeeze(DataSet_Labels(2,:,:));
[net2, tr2] = train(net2, images, labels);
% unit 3
images = squeeze(DataSet_Features(3,:,:));
labels = squeeze(DataSet_Labels(3,:,:));
[net3, tr3] = train(net3, images, labels);
% unit 4
images = squeeze(DataSet_Features(4,:,:));
labels = squeeze(DataSet_Labels(4,:,:));
[net4, tr4] = train(net4, images, labels);
% unit 5
images = squeeze(DataSet_Features(5,:,:));
labels = squeeze(DataSet_Labels(5,:,:));
[net5, tr5] = train(net5, images, labels);
% unit 6
images = squeeze(DataSet_Features(6,:,:));
labels = squeeze(DataSet_Labels(6,:,:));
[net6, tr6] = train(net6, images, labels);
% unit 7
images = squeeze(DataSet_Features(7,:,:));
labels = squeeze(DataSet_Labels(7,:,:));
[net7, tr7] = train(net7, images, labels);
% unit 8
images = squeeze(DataSet_Features(8,:,:));
labels = squeeze(DataSet_Labels(8,:,:));
[net8, tr8] = train(net8, images, labels);
% unit 9
images = squeeze(DataSet_Features(9,:,:));
labels = squeeze(DataSet_Labels(9,:,:));
[net9, tr9] = train(net9, images, labels);
% unit 10
images = squeeze(DataSet_Features(10,:,:));
labels = squeeze(DataSet_Labels(10,:,:));
[net10, tr10] = train(net10, images, labels);
