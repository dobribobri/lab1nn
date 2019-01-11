N = 200;
N5 = N*5;
t = 0;
for i = 1:N5
    image = squeeze(TestDataSet_Features_Total(1,:,i))';
    label = squeeze(TestDataSet_Labels_Total(1,:,i));
    response1 = net1(image);
    response2 = net2(image);
    response3 = net3(image);
    response4 = net4(image);
    response5 = net5(image);
    response6 = net6(image);
    response7 = net7(image);
    response8 = net8(image);
    response9 = net9(image);
    response10 = net10(image);
    res = zeros(1, 5);
    [m, index] = max(response1);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(2) = res(2) + 1; end %rectagle
    if (index == 3) res(4) = res(4) + 1; end %pentagon
    [m, index] = max(response2);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(2) = res(2) + 1; end %rectagle
    if (index == 3) res(5) = res(5) + 1; end %hexagon
    [m, index] = max(response3);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(2) = res(2) + 1; end %rectagle
    if (index == 3) res(3) = res(3) + 1; end %circle
    [m, index] = max(response4);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(4) = res(4) + 1; end %pentagon
    if (index == 3) res(5) = res(5) + 1; end %hexagon
    [m, index] = max(response5);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(4) = res(4) + 1; end %pentagon
    if (index == 3) res(3) = res(3) + 1; end %circle
    [m, index] = max(response6);
    if (index == 1) res(1) = res(1) + 1; end %triangle
    if (index == 2) res(5) = res(5) + 1; end %hexagon
    if (index == 3) res(3) = res(3) + 1; end %circle
    [m, index] = max(response7);
    if (index == 1) res(2) = res(2) + 1; end %rectangle
    if (index == 2) res(4) = res(4) + 1; end %pentagon
    if (index == 3) res(5) = res(5) + 1; end %hexagon
    [m, index] = max(response8);
    if (index == 1) res(2) = res(2) + 1; end %rectangle
    if (index == 2) res(4) = res(4) + 1; end %pentagon
    if (index == 3) res(3) = res(3) + 1; end %circle
    [m, index] = max(response9);
    if (index == 1) res(2) = res(2) + 1; end %rectangle
    if (index == 2) res(5) = res(5) + 1; end %hexagon
    if (index == 3) res(3) = res(3) + 1; end %circle
    [m, index] = max(response10);
    if (index == 1) res(4) = res(4) + 1; end %pentagon
    if (index == 2) res(5) = res(5) + 1; end %hexagon
    if (index == 3) res(3) = res(3) + 1; end %circle
    
    [m, index_r] = max(res);
    [m, index_l] = max(label);
    if (index_r == index_l)
        t = t + 1;
    end
    fprintf("max(response) is %d, \t max(label) is %d\n", index_r, index_l);
    fprintf("t is now %d \t\t sample numb. %d\n", t, i);
end

fprintf("Total number of images in TEST-Dataset: %d\n", N5);
fprintf("Recognised correctly: %d\n", t);

fprintf("\nNot recognised: %d\n", N5 - t);



