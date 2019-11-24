function vectorf = AssembleVectorNL(N,xMin,xMax,beta)
Fmesh = GenerateMeshNL(N,xMin,xMax);

vectorf = zeros(N+1,1);
elmat = GenerateTopology(N);

for i=1:N
    fei = GenerateElementVectorNL(Fmesh(i),Fmesh(i+1),beta);
    for j=[1 2]
        vectorf(elmat(i,j)) = vectorf(elmat(i,j))+fei(j);
    end
end

% Dirichlet BC
vectorf(1) = 0;
% Newmann BC
vectorf(end) = vectorf(end)+beta;