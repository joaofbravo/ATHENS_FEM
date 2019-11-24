N=100;
xMin=0;
xMax=1;

X=GenerateMesh(N,xMin,xMax);
S=AssembleMatrix(N,xMin,xMax);

for alpha=0:5
    f=AssembleVector(N,xMin,xMax,alpha);
    uh=S\f;
    
    figure(1); hold on
    plot(X,uh)
    
%     figure(2); hold on
%     plot(X,ExactSolu(X,alpha)'-uh)
end

disp('the error of course stays the same!');