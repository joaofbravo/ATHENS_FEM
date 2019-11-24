hmax = 0.14; % for 100 elements

[p,e,t] = GenerateMesh2D(0,1,0,1,hmax); % pdemesh(p,e,t);
[~,~,Nnode,Nelem] = SeparateIntBnd(p,e,t);

S = AssembleMatrix2D(0,1,0,1,hmax);
f = AssembleVector2D(0,1,0,1,hmax);
uh = S\f;

% figure(1)
% spy(S)

figure(2)
% GenerateGeometry(0,1,0,1); hold on
pdemesh(p,e,t,uh)
xlabel('X'); ylabel('Y'); rotate3d on;

figure(3)
pdesurf(p,t,uh)
xlabel('X'); ylabel('Y'); rotate3d on;

figure(4)
[X,Y]=meshgrid(linspace(0,1));
surf(X,Y,ExactSolu(X,Y))
xlabel('X'); ylabel('Y'); rotate3d on;

fprintf('\nNº of elements: %i \nNº of nodes: %i\n\n',Nnode,Nelem);