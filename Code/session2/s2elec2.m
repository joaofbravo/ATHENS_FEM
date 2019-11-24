Nmax=10;
xMin=0;
xMax=1;

Nmesh=zeros(Nmax,1);
errNorm=zeros(Nmax,1);

for i=1:Nmax
    Nmesh(i)=2^i;
    X=GenerateMesh(Nmesh(i),xMin,xMax);
    S=AssembleMatrix(Nmesh(i),xMin,xMax);
    f=AssembleVector(Nmesh(i),xMin,xMax);
    uh=S\f;
    
%     figure(1); hold on
%     plot(X,uh)
% 
%     figure(2); hold on
%     plot(X,ExactSolu(X))

    err = ExactSolu(X)'-uh;
    errNorm(i) = max(err);

    figure(3); hold on
    plot(X,err)
end

figure(4)
semilogy(Nmesh,errNorm)