function vectorf = AssembleVector2D(x1,x2,x3,x4,x5)
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
    error('Wrong number of args in AssembleVector2D!');
end

[~,Ibnd,Nnode,Nelem] = SeparateIntBnd(p,e,t);
vectorf = zeros(Nnode,1);

for k=1:Nelem
    fek = GenerateElementVector2D(p(:,t(1,k)),p(:,t(2,k)),p(:,t(3,k)));
    for i=1:3
        vectorf(t(i,k))=vectorf(t(i,k))+fek(i);
    end
end

vectorf(Ibnd)=0;