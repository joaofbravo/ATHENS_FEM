xMin=0;
xMax=1;
N=10;
alpha=1;

refine=true;
I=[];
threshold=0.00001;

tic
while refine
    [X,finalN] = GenerateMesh(N,xMin,xMax,I);
    S = AssembleMatrix(N,xMin,xMax,I);
    f = AssembleVector(N,xMin,xMax,alpha,I);
    uh = S\f;
    
    % Find errors larger than threshold
    err = ExactSolu(X,alpha)'-uh;
    auxI = flip(find(abs(err)>threshold));
    
    % Concatenate indexes or stop refining
    if isempty(auxI)
        refine=false;
    else
        I = [I; auxI];
    end
    
    % figure(3); hold on
    % plot(X,uh);
    % figure(4); hold on
    % plot(X,ExactSolu(X,alpha));
    
    figure(1);
    plot(X,err,'.');
end
toc

ylabel('Node error'); xlabel('X')

% Plot sizes of elements ei
figure(2)
semilogy(X(2:end)-X(1:end-1),'r.')
ylabel('size of elements'); xlabel('elements')

fprintf('\nNumber of elements: %i\n\n',finalN)