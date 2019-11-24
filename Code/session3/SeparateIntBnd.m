function [Iint,Ibnd,Nnode,Nelem] = SeparateIntBnd(p,e,t)
[~, Nnode] = size(p);
[~, Nelem] = size(t);
[~, ~, B1, ~] = assempde('squareb1',p,e,t,1,0,1); % ... c, a, f) -> d/dx(c*du/x)+a*u=f

I = [1:Nnode]';
Iint = B1'*I;
Ibnd = setdiff(I,Iint);