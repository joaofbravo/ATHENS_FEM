function Sek = GenerateElementMatrix2D(x1,x2,x3)
Sek=zeros(3);
X=[x1(1) x1(2) 1; x2(1) x2(2) 1; x3(1) x3(2) 1];

Aek = polyarea(X(:,1),X(:,2));
coefs = X\eye(3);

for i=1:3
    for j=1:3
        Sek(i,j) = Aek*(coefs(1,i)*coefs(1,j)+coefs(2,i)*coefs(2,j));
    end
end