function elmat = GenerateTopologyNL(N)
elmat=zeros(N,2,2);
elmat(1,1,1) = 1;
elmat(1,2,1) = 2;
elmat(2,1,1) = 2;
elmat(2,2,1) = 3;
elmat(1,1,2) = 2;
elmat(1,2,2) = 3;
elmat(2,1,2) = 3;
elmat(2,2,2) = 4;

for i=3:N+1
    elmat(i,1,1)=i;
    elmat(i,2,1)=i+1;
    elmat(i,1,2)=i+1;
    elmat(i,2,2)=i+2;
end