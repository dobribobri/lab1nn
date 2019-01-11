rng(5000000);

N = 10000;
N4 = N*4;
d = zeros(2, N4);
l = zeros(4, N4);
l1 = zeros(1, N4);
k = 1;
for i = 1:N
    d(:, k) = [50+rand 50+rand];
    l(:, k) = [1 0 0 0];
    l1(k) = 1;
    k = k + 1;
end
for i = 1:N
    d(:, k) = [-50+rand 50+rand];
    l(:, k) = [0 1 0 0];
    l1(k) = 2;
    k = k + 1;
end
for i = 1:N
    d(:, k) = [-50+rand -50+rand];
    l(:, k) = [0 0 1 0];
    l1(k) = 3;
    k = k + 1;
end
for i = 1:N
    d(:, k) = [50+rand -50+rand];
    l(:, k) = [0 0 0 1];
    l1(k) = 4;
    k = k + 1;
end

trainFcn = 'trainscg';
net = feedforwardnet(4, trainFcn);
% net.layers{1}.transferFcn = 'poslin';
[net, tr] = train(net, d, l);

response = net(d(:, 1));
disp("label");
disp(l(:, 1));
% disp(l1(1));
disp("response");
disp(response);