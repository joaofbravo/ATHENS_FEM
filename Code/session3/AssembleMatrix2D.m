function matrixS = AssembleMatrix2D(x1,x2,x3,x4,x5)
% Can be given 1 string arg with geometry (ex: 'squareg') or four with
% square limits. Additional arg: hmax (maximum element side)
if nargin == 1
    [p,e,t] = GenerateMesh2D(x1);
elseif nargin == 2
    [p,e,t] = GenerateMesh2D(x1,x2);
elseif nargin == 4
    [p,e,t] = GenerateMesh2D(x1,x2,x3,x4);
elseif nargin == 5
    [p,e,t] = GenerateMesh2D(x1,x2,x3,x4,x5);
else
    error('Wrong number of args in AssembleMatrix2D!');
end

[~,Ibnd,Nnode,Nelem] = SeparateIntBnd(p,e,t);
matrixS = zeros(Nnode,Nnode);

for k=1:Nelem
    Sek = GenerateElementMatrix2D(p(:,t(1,k)),p(:,t(2,k)),p(:,t(3,k)));
    for i=1:3
        for j=1:3
            matrixS(t(i,k),t(j,k)) = matrixS(t(i,k),t(j,k))+Sek(i,j);
        end
    end
end

matrixS(Ibnd,:)=0;
matrixS(Ibnd,Ibnd)=eye(size(Ibnd,1));