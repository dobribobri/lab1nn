N = 200;
N5 = N*5;
t = 0;
for i = 1:N5
    image = squeeze(TestDataSet_Features_Total(1,:,i))';
    label = squeeze(TestDataSet_Labels_Total(1,:,i));
    response = net(image);
    [m, index_r] = max(response);
    [m, index_l] = max(label);
    if (index_r == index_l)
        t = t + 1;
    end
    fprintf("max(response) is %d, \t max(label) is %d\n", index_r, index_l);
    fprintf("t is now %d\n", t);
end

fprintf("Total number of images in TEST-Dataset: %d\n", N5);
fprintf("Recognised correctly: %d\n", t);

fprintf("\nNot recognised: %d\n", N5 - t);



