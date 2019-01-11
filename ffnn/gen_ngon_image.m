function out = gen_ngon_image(n)

%% Suppose that domain is [0 100]x[0 100] square
dom = [0 100 0 100];

% Center of n-polygon
xC = randi([30 70],1,1);
yC = randi([30 70],1,1);
center = [xC yC];
nS = n; % number of sides of n-gon
th = linspace(0, 2*pi, nS + 1);
% Rotate the shape by subtracting an offset.
rot = randi([-10 10],1,1);
th = th - pi/rot;
R = randi([15 35],1,1);
x = R * cos(th) + center(1);
y = R * sin(th) + center(1);

%% Show image
figure_color        = 0.5 + 0.5*rand(1,3);
background_color    = 0.2*rand(1,3);

h = fill(x, y, figure_color);
set(h,'edgecolor',figure_color);
ax = gca;
set(ax,'xtick',[]); set(ax,'ytick',[]);

ax.XColor = background_color; ax.YColor = background_color ;
axis square; axis(dom);
set(ax,'Color',background_color )

img = getframe(gca);
out = img;