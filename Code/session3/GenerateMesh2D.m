function [p,e,t] = GenerateMesh2D(x1,x2,x3,x4,x5)
% Can be given 1 string arg with geometry (ex: 'squareg') or four with
% square limits. Additional arg: hmax (maximum element side)

% Legend:  p-nodes, e-edges, t-triangles (topology)
if nargin < 3
    domain = x1;
    if nargin == 1
        [p,e,t] = initmesh(domain);
    elseif nargin == 2
        hmax = x2;
        [p,e,t] = initmesh(domain,'Hmax',hmax);
    end
else
    domain = decsg([3;4;x1;x2;x2;x1;x3;x3;x4;x4]);
    if nargin == 4
        [p,e,t] = initmesh(domain);
    elseif nargin == 5
        hmax = x5;
        [p,e,t] = initmesh(domain,'Hmax',hmax);
    else
        error('Wrong number of args in GenerateMesh2D!');
    end
end