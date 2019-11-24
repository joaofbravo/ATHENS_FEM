syms x y

uex(x,y)=x*(x-1)*y*(1-y);

Lu(x,y)=laplacian(uex)
% g = -Lu = 2*x*(x-1)+2*y*(y-1)

x_int=linspace(0,1);
y_int=linspace(0,1);

[X,Y]=meshgrid(x_int,y_int);
surf(X,Y,double(uex(X,Y)))

xlabel('X');
ylabel('Y');
rotate3d on;