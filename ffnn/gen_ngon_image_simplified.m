function out = gen_ngon_image_simplified(n)

%% Suppose that domain is [0 100]x[0 100] square
dom = [0 100 0 100];
% Center of n-polygon
center = [50 50];
nS = n; % number of sides of n-gon
th = linspace(0, 2*pi, nS + 1);
% No rotation
R = 20;
x = R * cos(th) + center(1);
y = R * sin(th) + center(2);

%% Show image
figure_color        = [0.533, 0.976, 0.521];
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