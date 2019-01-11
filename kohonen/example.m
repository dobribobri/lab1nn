P = [.1 .8  .1 .9; .2 .9 .1 .8];
net = newc([0 1; 0 1],2);
net = train(net,P);
Y = sim(net,P);
Yc = vec2ind(Y);