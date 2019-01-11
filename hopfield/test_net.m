
steps = 500;
[Y_img, Pf1, Af1, E1, perf1] = sim(net_img, {steps}, [], TestImages(:, 5));
% [Y_fft, Pf2, Af2, E2, perf2] = sim(net_fft, {steps}, [], TestFFTs(:, 2));

imagesc(reshape(Y_img{1, steps}, [hvP_size, hvP_size]));
% imagesc(reshape(Y_fft{1, steps}, [hvP_size, hvP_size]));