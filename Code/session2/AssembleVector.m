function vectorf = AssembleVector(N,xMin,xMax,alpha,I)
if nargin ~= 5
    I=[];
end

[Fmesh,N]=GenerateMesh(N,xMin,xMax,I);

vectorf = zeros(N+1,1);
elmat=GenerateTopology(N);

for i=1:N
    fei = GenerateElementVector(Fmesh(i),Fmesh(i+1));
    for j=[1 2]
        vectorf(elmat(i,j))=vectorf(elmat(i,j))+fei(j);
    end
end

vectorf(1)=0;
if nargin > 3
    vectorf(end)=vectorf(end)+alpha;
end
