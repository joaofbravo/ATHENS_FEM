function tensorT = AssembleTensorNL(N,xMin,xMax)
tensorT = zeros((N+1)*(N+1),N+1);
Tmesh = GenerateMeshNL(N,xMin,xMax);

for i=1:N
    Tei = GenerateElementTensorNL(Tmesh(i),Tmesh(i+1));
    for j=[1 2]
        for k=[1 2]
            tensorT(i+k-1+(i-1)*(N+1),i+j-1) = tensorT(i+k-1+(i-1)*(N+1),i+j-1) + Tei(k,j);
            tensorT(i+k-1+i*(N+1),i+j-1) = tensorT(i+k-1+i*(N+1),i+j-1) + Tei(k+2,j);
        end
    end
end

% Dirichlet BC
tensorT(1:2,1:2) = 0;

% I believe this is wrong
% tensorT(1,:) = 0;
% tensorT(N+2,:) = 0;