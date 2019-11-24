function elmat = GenerateTopology(N)
elmat=zeros(N,2);
for i=1:N
    elmat(i,1)=i;
    elmat(i,2)=i+1;
end