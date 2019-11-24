x = 0:0.01:1;
y = 0:0.03:3;

[X,Y]=meshgrid(x,y);
f = X.^2.*sin(Y);

surf(X,Y,f)
xlabel('X'); ylabel('Y');
colorbar
rotate3d on