function matrixM = AssembleMatrixNL(N,xMin,xMax)
Mmesh = GenerateMeshNL(N,xMin,xMax);

matrixM = zeros(N+1,N+1);
elmat = GenerateTopology(N);

for i=1:N
    Mei = GenerateElementMatrixNL(Mmesh(i),Mmesh(i+1));
    for j=[1 2]
        for k=[1 2]
            matrixM(elmat(i,j),elmat(i,k)) = matrixM(elmat(i,j),elmat(i,k))+Mei(j,k);
        end
    end
end

% Dirichlet BC
matrixM(1,1) = 1;
matrixM(1,2) = 0;