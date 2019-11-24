N=100;
xMin=0;
xMax=1;

X=GenerateMesh(N,xMin,xMax);
S=AssembleMatrix(N,xMin,xMax);
f=AssembleVector(N,xMin,xMax);
uh=S\f;

figure(1)
spy(S)

figure(2)
plot(X,uh,'r')
hold on
plot(X,ExactSolu(X),'b')

figure(3)
plot(X,ExactSolu(X)'-uh,'g')