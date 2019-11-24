function matrixS = AssembleMatrix(N,xMin,xMax,I)
if nargin ~= 4
    I=[];
end

[Smesh,N]=GenerateMesh(N,xMin,xMax,I);

matrixS = zeros(N+1,N+1);
elmat=GenerateTopology(N);

for i=1:N
    Sei = GenerateElementMatrix(Smesh(i),Smesh(i+1));
    for j=[1 2]
        for k=[1 2]
            matrixS(elmat(i,j),elmat(i,k)) = matrixS(elmat(i,j),elmat(i,k))+Sei(j,k);
        end
    end
end

matrixS(1,1)=1;
matrixS(1,2)=0;

% rcond(matrixS) % deltaX may get too small with refining