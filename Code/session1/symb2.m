syms x y z0

f(x,y)=sqrt(1+4*x.^2+4*y.^2)./(1+x.^4+y.^4);

dfx(x,y)=diff(f,x);
dfy(x,y)=diff(f,y);

mx=double(dfx(1,2));
my=double(dfy(1,2));
F=double(f(1,2));

z0=double(solve(F-mx*1-my*2-z0,z0));
fprintf('z = %.3f*x + %.3f*y + %.3f\n',mx,my,z0)

[X,Y]=meshgrid(0:0.02:2,0:0.04:4);
Z=mx*X+my*Y+z0;

surf(X,Y,double(f(X,Y)),'FaceAlpha',0.5)
hold on
surf(X,Y,Z,'FaceColor','r')
xlabel('X'); ylabel('Y');
rotate3d on